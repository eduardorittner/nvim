local setup = function()
  require('mini.ai').setup { n_lines = 500 }
  require('mini.surround').setup()
end

return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      setup()
    end,
  },
}
