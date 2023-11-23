-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
  Comment = {
    italic = true,
  },
}

M.add = {
  --NvimTreeOpenedFolderName = { fg = "green", bold = true },
  DashboardHeader = { fg = "gray" },
  DashboardFooter = { fg = "gray" },
  DashboardShortCutIcon = { fg = "gray" },
  DashboardFiles = { fg = "gray" },
  ---
  DashboardProjectTitle = { fg = "gray" },
  DashboardProjectTitleIcon = { fg = "gray" },
  DashboardProjectIcon = { fg = "gray" },
  DashboardMruTitle = { fg = "gray" },
  DashboardMruIcon = { fg = "gray"},  
}

return M
