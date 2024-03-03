local augroup = vim.api.nvim_create_augroup("markdown", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },
  {
    group = augroup,
    pattern = { "*.md" },
    command = "set wrap",
  })
