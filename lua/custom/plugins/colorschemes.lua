return {
  {
    'ellisonleao/gruvbox.nvim',
    dependencies = {
      -- Register other colorschemes as dependencies so they
      -- are all loaded at the same time
      'navarasu/onedark.nvim',
      'folke/tokyonight.nvim',
      'https://github.com/sainnhe/everforest',
    },
    lazy = false,
    priority = 1000,
    config = function()
      require 'custom.configs.colorscheme'
    end,
  },
}
