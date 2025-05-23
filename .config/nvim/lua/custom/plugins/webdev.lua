return {
  -- HTML, CSS, JS/TS support
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },

  -- Treesitter (syntax highlighting)
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'html', 'css', 'javascript', 'typescript', 'tsx' },
      highlight = { enable = true },
      autotag = { enable = true },
    },
  },
  { 'windwp/nvim-ts-autotag' }, -- auto-close JSX/HTML tags
  { 'windwp/nvim-autopairs' }, -- auto-close brackets

  -- Formatter (Prettier)
  { 'stevearc/conform.nvim' },

  -- Tailwind highlight and color hex codes
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

  -- Snippets
  { 'rafamadriz/friendly-snippets' },
}
