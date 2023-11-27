-- local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-project.nvim",
    },
    opts = {
      extensions_list = { "themes", "terms", "project" },
      extensions = {
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
        },
      },
    },
  },

  {
    "chrisgrieser/nvim-alt-substitute",
    event = "CmdlineEnter",
    opts = true,
  },

  { "tommcdo/vim-exchange", lazy = false },
  { "mg979/vim-visual-multi", lazy = false },
  { "AndrewRadev/switch.vim", lazy = false },
  { "AndrewRadev/sideways.vim", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-speeddating", lazy = false },

  "NvChad/nvcommunity",
  { import = "nvcommunity.git.lazygit" },
  { import = "nvcommunity.editor.autosave" },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      theme = "hyper",
      config = {
        header = {
          "",
          "",
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
          "",
        },
        week_header = {
          enable = false,
        },
        shortcut = {
          { icon = " ", desc = "Projects", group = "Question", action = "Telescope project", key = "p" },
          { icon = "󰋚 ", desc = "Recent", group = "Question", action = "Telescope oldfiles", key = "r" },
          { icon = " ", desc = "Grep", group = "Number", action = "Telescope live_grep", key = "g" },
          { icon = "󰍉 ", desc = "Find", group = "Number", action = "Telescope find_files", key = "f" },
          { icon = " ", desc = "Config", group = "@comment", action = "e $MYVIMRC", key = "c" },
          { icon = "󰚰 ", desc = "Update", group = "@comment", action = "Lazy update", key = "u" },
          { icon = "󰛯 ", desc = "Health", group = "@comment", action = "checkhealth", key = "h" },
          { icon = "󰩈 ", desc = "Quit", group = "@error", action = "qa", key = "q" },
        },
        packages = {
          enabled = false,
        },
        project = {
          enable = true,
          limit = 8,
          icon = " ",
          label = " Recent Projects:",
          action = "Telescope find_files cwd=",
        },
        mru = {
          enable = true,
          limit = 8,
          icon = "󰋚 ",
          label = " Recent files:",
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local footer = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          return { "", footer }
        end,
      },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
  },
}

return plugins
