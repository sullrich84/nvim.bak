local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = { ":w <CR>", "Save" },
    ["<esc>"] = { ":noh <CR>", "Clear history", opts = { silent = true } },
  },
  v = {
    [">"] = { ">gv", "indent", opts = { silent = true } },
    ["<D-s>"] = { ":w <CR>", "Save", opts = { silent = true } },
  },
  i = {
    ["<C-s>"] = { "<esc>:w <CR>", "Save", opts = { silent = true } },
  },
}

M.telescope = {
  n = {
    ["<leader>tp"] = {
      ":lua require'telescope'.extensions.project.project{}<CR>",
      "Open projects view",
      opts = { noremap = true, silent = true },
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { ":LazyGit <CR>", "Open LazyGit", opts = { silent = true } },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Open LazyGit", opts = { silent = true } },
  },
}

M.ui = {
  n = {
    ["<leader>ul"] = { ":set norelativenumber number <CR>", "Toggle number", opts = { silent = true } },
    ["<leader>uL"] = { ":set nonumber relativenumber <CR>", "Toggle relative number", opts = { silent = true } },
  },
}

return M
