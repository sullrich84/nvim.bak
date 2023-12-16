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
  DashboardHeader = { fg = "#b7bdf8" }, -- Logo
  DashboardFooter = { fg = "#5b6078", italic = true }, -- Footer
  -- DashboardDesc = { fg = "#5b6078" }, -- no effect
  -- DashboardKey = { fg = "#5b6078" }, -- no effect
  -- DashboardIcon = { fg = "#5b6078" }, -- no effect
  DashboardShortCut = { fg = "#cad3f5" }, -- all top links and hotkeys
  DashboardShortCutIcon = { fg = "#c6a0f6" }, -- top row icons
  DashboardFiles = { fg = "#8087a2" }, -- all file links
  ---
  DashboardProjectTitle = { fg = "#ee99a0", italic = true, bold = true }, -- label "recent projects"
  DashboardProjectTitleIcon = { fg = "#ee99a0" }, -- icon "recent projects"
  DashboardProjectIcon = { fg = "#ee99a0" }, -- link icons under "recent projects"
  DashboardMruTitle = { fg = "#7dc4e4", italic = true, bold = true }, -- label "recent files" 
  DashboardMruIcon = { fg = "#7dc4e4" }, -- icon "recent files"
  --- 
  DashboardPrimary = { fg = "#cad3f5" },
  DashboardSecondary = { fg = "#5b6078", italic = true },
}

return M
