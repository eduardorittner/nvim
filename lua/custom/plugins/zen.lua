-- Adds zen-mode, a distraction free mode

return {
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 0.7,
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>zz', ':ZenMode<CR>')
    end,
  },
}
