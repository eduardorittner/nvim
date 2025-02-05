return {
  'ThePrimeagen/harpoon',
  lazy = false,
  branch = 'harpoon2',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]ppend' })

    vim.keymap.set('n', '<leader>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [M]enu' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon select 1' })

    vim.keymap.set('n', '<C-1>', function()
      harpoon:list():select(1)
    end)

    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon select 2' })

    vim.keymap.set('n', '<C-2>', function()
      harpoon:list():select(2)
    end)

    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon select 3' })

    vim.keymap.set('n', '<C-3>', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon select 4' })

    vim.keymap.set('n', '<C-4>', function()
      harpoon:list():select(4)
    end)
  end,
}
