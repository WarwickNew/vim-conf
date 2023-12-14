local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'folke/lazy.nvim',
  'ellisonleao/gruvbox.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  'akinsho/toggleterm.nvim',
  -- keybind tooltip
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- fzf
  {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- TODO
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  -- Lsp
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  },
  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  {
    "L3MON4D3/LuaSnip",
    version = "2.*", -- Replace <CurrentMajor> by the latest released major
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  -- Org Mode
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    --event = 'VeryLazy',
    --config = function()
      ---- Load treesitter grammar for org
      --require('orgmode').setup_ts_grammar()

      ---- Setup treesitter
      --require('nvim-treesitter.configs').setup({
      --  highlight = {
      --    enable = true,
      --    additional_vim_regex_highlighting = { 'org' },
      --  },
      --  ensure_installed = { 'org' },
      --})

      ---- Setup orgmode
      --require('orgmode').setup({
      --  org_agenda_files = '~/.vimwiki/**/*',
      --  org_default_notes_file = '~/.vimwiki/refile.org',
      --})
      ---- Setup nvim-cmp
      --require('cmp').setup({
      --  sources = { { name = 'orgmode' } }
      --})
    --end,
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
