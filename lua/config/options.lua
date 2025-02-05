vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.guicursor = ''

-- Preview substitutions as you type
vim.opt.inccommand = 'split'

-- Show cursor line
vim.opt.cursorline = true

-- Disable mouse
vim.opt.mouse = ''
vim.opt.mousehide = true

-- Don't show mode since it's already in statusline
vim.opt.showmode = false

-- Set highlight on search
vim.o.hlsearch = false

-- Tab stop
vim.o.tabstop = 4

-- Make line numbers relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set minimum number of lines always visible below cursor
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 0

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help "clipboard"`
vim.o.clipboard = 'unnamedplus'

-- Minimum number of lines below cursor
vim.opt.scrolloff = 8

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Disable line wrapping
vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- How new splits should be added
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
