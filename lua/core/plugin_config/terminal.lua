require("toggleterm").setup({
  hide_numbers = true,
  start_in_insert = true,
  shell = vim.o.shell,
})

-- Get out of terminal!
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Open terminal keymap
vim.keymap.set('n', '<leader>t', ":ToggleTerm<CR>",{noremap = true, silent = true})
