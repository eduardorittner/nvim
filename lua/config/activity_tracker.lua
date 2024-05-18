local M = {}

-- Global Variables

-- All entries are saved by day
local current_day = os.date '%Y-%m-%d'

-- Object where the usage data is stored
local usage_data = {}

-- File where the data is stored
local data_filepath = vim.fn.stdpath 'log' .. '/activity_tracker.json'

-- Variable to keep track of current activity status
local is_active = true

-- Keeps track of the last time an activity was recorded
local last_activity_timestamp = os.time()

local current_bufnr = nil

local current_buf_filepath = nil

local function verbose_print(msg)
  if vim.g.activity_tracker_verbose > 0 then
    print('[activity-tracker.nvim]: ' .. msg)
  end
end

local function handle_inacitivity()
  if not is_active then
    return
  end

  if (os.time() - last_activity_timestamp) > (vim.g.activity_tracker_inactivity_threshold_minutes * 60) then
    verbose_print 'Stopping due to inactivity'
    M.stop_timer(true)
    is_active = false

    print('inactivity detected for buffer ' .. current_buf_filepath .. ' at ' .. os.date '%Y-%m-%d %H:%M:%S' .. ', last active at ' .. last_activity_timestamp)
  end
end

local function load_usage_data()
  local file = io.open(data_filepath, 'r')
  if file then
    local file_data = file:read '*a'
    file:close()
    usage_data = vim.json.decode(file_data)
  end
end

-- Save entries to json file
local function save_usage_data()
  local encoded_data = vim.json.encode(usage_data)
  local file = io.open(data_filepath, 'w')
  if file then
    file:write(encoded_data)
    file:close()
  end
end

function M.start_timer(bufnr)
  local filepath = vim.api.nvim_buf_get_name(bufnr)

  if filepath == '' or filepath == nil then
    return
  end

  is_active = true
  last_activity_timestamp = os.time()
  current_bufnr = bufnr
  current_buf_filepath = filepath

  -- TODO: get git project name
  -- TODO: get buffer filetype

  if not usage_data[current_day][filepath] then
    -- Create filepath log if it doesn't exist yet
    usage_data[current_day][filepath] = {
      -- TODO: add buf filetype and git name
      current_entry = last_activity_timestamp,
      exit = nil,
      total_elapsed_time_sec = 0,
      total_keystrokes = 0,
    }
  else
    -- When starting a new timer on a file that already has logs, we just chenage the current_entry
    usage_data[current_day][filepath].current_entry = last_activity_timestamp
  end

  verbose_print('Timer started for ' .. current_buf_filepath .. ' (buffer ' .. current_bufnr .. ') at ' .. os.date('%c', last_activity_timestamp))
end

function M.stop_timer(use_last_activity)
  -- TODO: check if entry is larger than N seconds
  -- so that for example if I open a buffer for 3 seconds no entry will be added for it
  local filepath = current_buf_filepath
  local current_time

  if filepath == '' or filepath == nil then
    return
  end

  if use_last_activity then
    current_time = last_activity_timestamp
  else
    current_time = os.time()
  end

  if usage_data[current_day][filepath] then
    local data = usage_data[current_day][filepath]
    data.exit = current_time
    data.total_elapsed_time_sec = data.total_elapsed_time_sec + data.exit - data.current_entry
    verbose_print('Timer stopped for ' .. current_buf_filepath .. ' (buffer ' .. current_bufnr .. ') at ' .. os.date('%c', current_time))
  else
    verbose_print('No data was found for ' .. filepath .. '. No entries have been recorded and there is no timer to be stopped.')
  end

  save_usage_data()
end

function M.on_keystroke(bufnr)
  local filepath = vim.api.nvim_buf_get_name(bufnr)

  if filepath == '' or filepath == nil then
    return
  end

  if not is_active then
    M.start_timer(bufnr)
  end

  if usage_data[current_day][filepath] then
    local data = usage_data[current_day][filepath]
    data.total_keystrokes = data.total_keystrokes + 1
  end

  last_activity_timestamp = os.time()
  current_bufnr = bufnr
  current_buf_filepath = filepath
end

function M.setup(opts)
  local function set_default(opt, default)
    local prefix = 'activity_tracker_'
    if vim.g[prefix .. opt] ~= nil then
      return
    elseif opts[opt] ~= nil then
      vim.g[prefix .. opt] = opts[opt]
    else
      vim.g[prefix .. opt] = default
    end
  end

  -- TODO: set options
  set_default('verbose', 1)
  set_default('inactivity_checks_per_sec', 1)
  set_default('inactivity_threshold_minutes', 2)

  -- Load stored data

  load_usage_data()

  if current_day ~= nil and usage_data[current_day] == nil then
    usage_data[current_day] = {}
  end

  -- Add autocommands

  local augroup = vim.api.nvim_create_augroup('activity_tracker', { clear = true })

  vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = augroup,
    callback = function()
      M.start_timer(vim.api.nvim_get_current_buf())
    end,
  })

  vim.api.nvim_create_autocmd({ 'BufLeave', 'QuitPre' }, {
    group = augroup,
    callback = function()
      M.stop_timer(false)
    end,
  })

  vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'CursorMoved', 'CursorMovedI' }, {
    group = augroup,
    callback = function()
      M.on_keystroke(vim.api.nvim_get_current_buf())
    end,
  })

  -- Check for inactivity every N seconds
  local timer = vim.loop.new_timer()
  timer:start(
    0,
    vim.g.activity_tracker_inactivity_checks_per_sec * 1000,
    vim.schedule_wrap(function()
      handle_inacitivity()
    end)
  )
end

return M
