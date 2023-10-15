---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "nightfox",
  theme_toggle = { "nightfox" },

  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
    overriden_modules = nil,
  },

  nvdash = {
    load_on_startup = false,

    header = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣤⣴⡶⠖⢀⣀⣤⣤⣤⣀      ",
      " ⠀⠀⠀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⠛⣡⣴⣾⣿⣿⣿⣿⣿⣿⣷⡀   ",
      " ⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧   ",
      " ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⢻⣿⣿⣿⣿⠟⣉⠻⣿⣶⣿⡄  ",
      " ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⢿⣿⣿⣿⡀⠻⣷⣌⠙⢿⣧  ",
      " ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡙⠻⠿⠁⠀⠈⠙⠳⢄⡉  ",
      " ⠸⢸⣿⣿⣿⣿⣿⡿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⢀⣀⠀⠀⠀⣤⣈  ",
      " ⠀⠘⣿⣿⣿⣿⠋⠐⠿⠿⠿⠿⢃⠘⣿⣿⣿⣿⠀⢰⣿⡟⠀⠀⣰⣿⡟  ",
      " ⠀⠀⣿⣿⣿⣿⠀⣿⣿⡆⠀⠀⣾⠀⣿⣿⣿⣿⠀⠈⠻⣿⣿⣿⣿⡿⠁  ",
      " ⠀⠀⣿⣿⣿⣿⠀⣿⣿⣷⠀⠀⣿⡆⢸⣿⣿⣿⠀⠀⠀⠀⠉⠉⠁    ",
      " ⠀⠀⠛⠿⠿⠃⠀⠻⠿⠋⠀⠀⠻⠇⠘⠿⠿⠟⠀sully.vim ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
