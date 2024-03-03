-- Hardmode
-- Disables "easier" but inefficient movements such
-- as 'h', 'j', 'k', 'l', etc.

vim.g.HardmodeOn = false
vim.g.HardmodeMsg = "Hardmode is set - ':call Easymode()' to quit"

local function Hardmode()
  vim.g.HardmodeOn = true
  vim.keymap.set({ "n", "v" }, "h", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v" }, "j", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v" }, "k", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v" }, "l", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v" }, "+", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v" }, "-", ":echo HardmodeMsg<CR>")

  vim.keymap.set({ "n", "v", "i" }, "<Left>", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v", "i" }, "<Right>", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v", "i" }, "<Up>", ":echo HardmodeMsg<CR>")
  vim.keymap.set({ "n", "v", "i" }, "<Down>", ":echo HardmodeMsg<CR>")
  print("Hardmode set")
end

local function Easymode()
  vim.g.HardmodeOn = false
  vim.keymap.del({ "n", "v" }, "h")
  vim.keymap.del({ "n", "v" }, "j")
  vim.keymap.del({ "n", "v" }, "k")
  vim.keymap.del({ "n", "v" }, "l")
  vim.keymap.del({ "n", "v" }, "+")
  vim.keymap.del({ "n", "v" }, "-")

  vim.keymap.del({ "n", "v", "i" }, "<Left>")
  vim.keymap.del({ "n", "v", "i" }, "<Right>")
  vim.keymap.del({ "n", "v", "i" }, "<Up>")
  vim.keymap.del({ "n", "v", "i" }, "<Down>")
  print("Easymode set")
end


vim.g.Hardmode = function()
  Hardmode()
end

vim.g.Easymode = function()
  Easymode()
end

vim.g.ToggleHardmode = function()
  if vim.g.HardmodeOn then
    Hardmode()
  else
    Easymode()
  end
end
