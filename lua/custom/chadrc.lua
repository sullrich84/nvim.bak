---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "nightfox",
  theme_toggle = { "nightfox", "one_light" },

  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
    overriden_modules = nil,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
