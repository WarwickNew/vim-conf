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
  }
}

whichkey.setup {
  hide_statusline = false,
  default_keymap_settings = {
    silent = true,
    noremap = true,
  },
  default_mode = 'n',
}

whichkey.register(keymap, { prefix = '<leader>' })
