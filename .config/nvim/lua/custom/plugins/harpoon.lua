return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    local keymap = vim.keymap.set
    local list = harpoon:list()

    -- Add file to harpoon list
    keymap('n', '<leader>a', function()
      list:add()
    end, { desc = 'Harpoon: Add file' })

    -- Toggle Harpoon menu
    keymap('n', '<leader>j', function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = 'Harpoon: Toggle menu' })

    -- Navigate files
    keymap('n', '<leader>1', function()
      list:select(1)
    end, { desc = 'Harpoon: Go to file 1' })
    keymap('n', '<leader>2', function()
      list:select(2)
    end, { desc = 'Harpoon: Go to file 2' })
    keymap('n', '<leader>3', function()
      list:select(3)
    end, { desc = 'Harpoon: Go to file 3' })
    keymap('n', '<leader>4', function()
      list:select(4)
    end, { desc = 'Harpoon: Go to file 4' })
  end,
}
