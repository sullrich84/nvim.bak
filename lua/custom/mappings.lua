---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = {":w <CR>", "Save"},
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<D-s>"] = {":w <CR>", "Save"},
  },
  i = {
    ["<C-s>"] = {":w <CR>", "Save"}
  }
}

M.lazygit = {
  n = {
    ["<leader>gg"] = {"<cmd> LazyGit <CR>", "Open LazyGit"}
  }
}

-- more keybinds!

return M
