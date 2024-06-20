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
    --branch = "0.1.x",
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
  },
  {
    'akinsho/org-bullets.nvim',
    dependencies = { { 'nvim-orgmode/orgmode' } },
  },
  {
    "ranjithshegde/orgWiki.nvim",
    dependencies = { { 'nvim-orgmode/orgmode' } },
  },
  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Lightmode switcher
  'eliseshaffer/darklight.nvim',
  -- Mini tools
  {
    'echasnovski/mini.animate',
    version = false,
    config = function()
      local animate = require('mini.animate')
      animate.setup({
        scroll = { timing = animate.gen_timing.linear({ duration = 50, unit = 'total' }) },
        cursor = { enable = false }
      })
    end

  }
}

local opts = {}

require("lazy").setup(plugins, opts)
