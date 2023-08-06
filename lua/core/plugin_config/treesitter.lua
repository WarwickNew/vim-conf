require('nvim-treesitter.configs').setup({
  -- list of languages to grab
  ensure_installed = 'all',

  -- how to install them
  sync_install = false,
  auto_install = true,

  -- enable highlight
  highlight = {enable = true}
})
