-- This file holds all the non-plugin specific

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Comment lines
vim.keymap.set('n', '<leader><Tab><Tab>', 'gcc', { desc = 'Comment current line' })

-- Change windows with CTRL+<hjkl>
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize windows with CTRL+<Left-Right-Up-Down>
vim.keymap.set('n', '<M-Left>', '5<C-W><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-Right>', '5<C-W>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<M-Up>', '5<C-W>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-Down>', '5<C-W>-', { desc = 'Decrease window height' })

-- Retains visual mode when indenting and de-indenting
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })

-- Space alone is a nop
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Automatic line wrap navigation
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- File handling
vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })

-- Appends next line to current one
vim.keymap.set('n', 'J', 'mzJ`z')

-- Move with ctrl+u and ctrl+d while still maintaining same crosshair placement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search terms stay in the middle of the screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste without losing current yank
vim.keymap.set('x', '<leader>p', '"_d')

-- Copies to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Deletes to void
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<leader>bl', ':bl<CR>')
vim.keymap.set('n', '<leader>bL', ':blast<CR>')
vim.keymap.set('n', '<leader>bf', ':bf<CR>')

-- Replace word under cursor
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Split vertical window
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>')
vim.keymap.set('n', '<leader>vn', ':vne<CR>')

-- Call color logs
vim.keymap.set('n', '<space>cl', ':call colorLogs()<CR>')
