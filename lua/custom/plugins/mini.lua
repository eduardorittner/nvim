return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require 'custom.configs.mini'
    end,
  },
}
