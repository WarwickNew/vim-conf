local whichkey = require("which-key")
-- TODO fix <cmd> based instructions
local keymap = {
  t = 'Toggle Terminal',
  l = {
    name = '+lsp',
    e = { "<cmd>lua vim.diagnostic.open_float()<cr>", 'Diagnostic Float' },
    n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", 'Next Diagnostic' },
    N = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", 'Previous Diagnostic' },
    j = { "<cmd>lua vim.diagnostic.setloclist()<cr>", 'Diagnostic List' },
    --- Dynamic to each buffer potential TODO?
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", 'Declaration' },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", 'Definition' },
    k = { "<cmd>lua vim.lsp.buf.hover()<cr>", 'Hover' },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", 'Implementation' },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", 'Type Definition' },
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", 'Rename' },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", 'Code Action' },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", 'References' },
    f = { function() vim.lsp.buf.format { async = true } end, 'Format' },

  },
  f = {
    name = '+find (telescope)',
    f = { "<cmd>Telescope find_files<CR>", 'Find' },
    o = { "<cmd>Telescope oldfiles<CR>", 'Old Files' },
    g = { "<cmd>Telescope live_grep<CR>", 'Grep' },
    h = { "<cmd>Telescope help_tags<CR>", 'Help Tags' },
  },
  g = {
    name = '+git',
    g = { '<Cmd>Telescope git_commits<CR>', 'Commits' },
    b = { '<Cmd>Telescope git_branches<CR>', 'Branches' },
    s = { '<Cmd>Telescope git_status<CR>', 'Status' },
  },
  T = {
    name = '+todo',
    j = { '<Cmd>TodoLocList<CR>', 'List TODO:\'s in buffer' },
    T = { '<Cmd>TodoTelescope<CR>', 'Search TODO:\'s' },
    n = { function() require("todo-comments").jump_next() end, 'Jump to next TODO:' },
    N = { function() require("todo-comments").jump_prev() end, 'Jump to previous TODO:' },
  },
  w = {
    name = '+window',
    w = 'Pick Window',
    s = "Split window",
    v = "Split window vertically",
    q = "Quit a window",
    T = "Break out into a new tab",
    x = "Swap current with next",
    ["-"] = "Decrease height",
    ["+"] = "Increase height",
    ["<lt>"] = "Decrease width",
    [">"] = "Increase width",
    ["|"] = "Max out the width",
    ["="] = "Equally high and wide",
    h = "Go to the left window",
    l = "Go to the right window",
    k = "Go to the up window",
    j = "Go to the down window",
  },
  o = {
    name = '+org mode',
  },
  m = {
    '<Cmd>DarkLightSwitch<CR>', 'Toggle dark mode'
  },
  v = {
    name = '+obsidian Vault',
    i = {'<Cmd>e ~/Sync/wiki/index.md<CR>', 'Open Index'},
    o = {'<Cmd>ObsidianOpen<CR>', 'Obsidian Open'},
    n = {'<Cmd>ObsidianNew<CR>', 'New Note'},
    q = {'<Cmd>ObsidianQuickSwitch<CR>', 'Quick Switch with fzf'},
    f = {'<Cmd>ObsidianFollowLink<CR>', 'Follow Link'},
    b = {'<Cmd>ObsidianBacklinks<CR>', 'List Backlinks'},
    d = {'<Cmd>ObsidianToday<CR>', 'Open Daily Note'},
    y = {'<Cmd>ObsidianYesterday<CR>', 'Open Yesterdays Note'},
    t = {'<Cmd>ObsidianTomorrow<CR>', 'Open Tomorrows Note'},
    T = {'<Cmd>ObsidianTemplate<CR>', 'Open Template'},
    s = {'<Cmd>ObsidianSearch<CR>', 'Search Notes'},
    l = {'<Cmd>ObsidianLink<CR>', 'Link Current Selection'},
    L = {'<Cmd>ObsidianLinkNew<CR>', 'Link New Note from Current Selection'},
    w = {'<Cmd>ObsidianWorkspace<CR>', 'Switch Workspace'},
    p = {'<Cmd>ObsidianPasteImg<CR>', 'Paste Image'},
    r = {'<Cmd>ObsidianRename<CR>', 'Rename Note'},
  }
}
-- Map window keys to leader w
vim.cmd [[nmap <leader>w <C-w>]]

whichkey.setup {
  hide_statusline = false,
  default_keymap_settings = {
    silent = true,
    noremap = true,
  },
  default_mode = 'n',
}

whichkey.register(keymap, { prefix = '<leader>' })
