local setup = function()
  require('which-key').add {
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>b', group = '[B]uffer' },
    { '<leader>f', group = '[F]ile' },
    { '<leader>h', group = '[H]arpoon' },
  }
end

return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      setup()
    end,
  },
}
