---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = {":w <CR>", "Save"},
    ["<C-s>"] = {":w <CR>", "Save"},
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<D-s>"] = {":w <CR>", "Save"},
    ["<C-s>"] = {":w <CR>", "Save"},
  },
}

-- more keybinds!

return M
