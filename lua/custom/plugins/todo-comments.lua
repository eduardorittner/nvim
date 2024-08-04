return {
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      highlight = { comments_only = false },
      keywords = {
        MACA = { icon = '🍏', color = 'hint' },
        MIAU = { icon = '🐈', color = 'hint' },
        AMORZINHO = { icon = '♥', color = '#FC47A5' },
        WAIT = { icon = ' ', color = 'hint' },
        TIME = { icon = ' ' },
        color = 'hint',
      },
    },
  },
}
