local augroup = vim.api.nvim_create_augroup('markdown', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = augroup,
  pattern = { '*.md' },
  callback = function()
    vim.opt.wrap = true
    vim.opt.cursorline = false
  end,
})
