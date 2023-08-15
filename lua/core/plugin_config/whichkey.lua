local whichkey = require("whichkey_setup")
-- lsp format
vim.g.formatfix = function()
  vim.lsp.buf.format { async = true }
end
-- TODO fix <cmd> based instructions
local keymap = {
  t = 'Toggle Terminal',
  l = {
    name = '+lsp',
    e = { "vim.diagnostic.open_float", 'Diagnostic Float' },
    n = { "vim.diagnostic.goto_next", 'Next Diagnostic' },
    N = { "vim.diagnostic.goto_prev", 'Previous Diagnostic' },
    j = { "vim.diagnostic.setloclist", 'Diagnostic List' },
    --- Dynamic to each buffer potential TODO?
    D = { "vim.lsp.buf.declaration", 'Declaration' },
    d = { "vim.lsp.buf.definition", 'Definition' },
    k = { "vim.lsp.buf.hover", 'Hover' },
    i = { "vim.lsp.buf.implementation", 'Implementation' },
    t = { "vim.lsp.buf.type_definition", 'Type Definition' },
    R = { "vim.lsp.buf.rename", 'Rename' },
    a = { "vim.lsp.buf.code_action", 'Code Action' },
    r = { "vim.lsp.buf.references", 'References' },
    f = { "<cmd>lua vim.g.formatfix()<CR>", 'Format' },

  },
  f = {
    name = '+find (telescope)',
    f = {"<cmd>Telescope find_files<CR>",'Find'},
    o = {"<cmd>Telescope oldfiles<CR>",'Old Files'},
    g = {"<cmd>Telescope live_grep<CR>",'Grep'},
    h = {"<cmd>Telescope help_tags<CR>",'Help Tags'},
  },
  g = {
    name = '+git',
    g = { '<Cmd>Telescope git_commits<CR>', 'Commits' },
    b = { '<Cmd>Telescope git_branches<CR>', 'Branches' },
    s = { '<Cmd>Telescope git_status<CR>', 'Status' },
  }
}

whichkey.config {
  hide_statusline = false,
  default_keymap_settings = {
    silent = true,
    noremap = true,
  },
  default_mode = 'n',
}

whichkey.register_keymap('leader', keymap)
