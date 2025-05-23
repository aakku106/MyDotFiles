return {
  'ThePrimeagen/vim-be-good',
  cmd = { 'VimBeGood' },
  init = function()
    -- optional: offset for relative difficulty
    vim.g.vim_be_good_delete_me_offset = 25
    -- optional: enable logging
    -- vim.g.vim_be_good_log_file = 1
  end,
}
