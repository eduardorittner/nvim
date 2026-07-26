return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>g', ':tab Git<CR>', { desc = '[G]it status (full screen)' })
    end,
  },
}
