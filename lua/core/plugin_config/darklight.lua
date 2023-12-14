require('darklight').setup({
  mode = 'custom', -- Sets darklight to custom mode
  light_mode_callback = function() -- Function to call to set light mode
    vim.opt.background="light"
  end,
  dark_mode_callback = function() -- Function to call to set dark mode
    vim.opt.background="dark"
  end,
})
