require("obsidian").setup({
  workspaces = {
    {
      name = "vault",
      path = "~/Sync/wiki",
    },
  },
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
  },
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "diary",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "Templates/daily_note"
  },
  templates = {
    subdir = "Templates",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
})
