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
  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,

})
