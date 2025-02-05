local setup = function()
  require('oil').setup {
    columns = { 'icon', 'mtime', 'size' },
    keymaps = {
      ['<C-h>'] = false,
      ['`'] = false,
    },
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
  }

  -- Open parent directory
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
end

return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      setup()
    end,
  },
}
