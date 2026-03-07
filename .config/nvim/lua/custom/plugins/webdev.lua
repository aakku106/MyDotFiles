return {
  { 'windwp/nvim-ts-autotag' },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
      require('colorizer').setup {
        filetypes = { '*' },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = false,
          css = true,
          css_fn = true,
          tailwind = true,
          mode = 'background',
        },
      }
    end,
  },
}
