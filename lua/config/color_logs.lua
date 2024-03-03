vim.g.colorLogs = function()
  vim.api.nvim_command("highlight default HighlightLogs guifg=#ff007c")
  vim.api.nvim_command("highlight default HighlightLogsDone guifg=green")

  if not vim.api.nvim_buf_get_option(0, "filetype") == "netrw" then
    return
  end

  local path = vim.api.nvim_buf_get_name(0)

  if not string.match(path, "/docs/logs/") then
    return
  end

  local lines = vim.fn.getbufline("%", 1, "$")
  for key, value in pairs(lines) do
    if key >= 7 then
      if string.match(value, "%.md$") then
        local filename = path .. "/" .. value
        local file = vim.fn.readfile(filename)
        local match = "^" .. value .. "$"
        if not (#file == 3) then
          vim.fn.matchadd("HighlightLogsDone", match, -1)
        else
          vim.fn.matchadd("HighlightLogs", match, -1)
        end
      end
    end
  end
end
