local overrides = require "custom.configs.overrides"

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
      "nvim-telescope/telescope-dap.nvim",
    },
    opts = {
      extensions_list = { "themes", "terms", "project", "dap" },
      extensions = {
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  { "tommcdo/vim-exchange", lazy = false },
  { "AndrewRadev/switch.vim", lazy = false },
  { "tribela/vim-transparent", lazy = false },
  { "AndrewRadev/sideways.vim", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
  { "luochen1990/rainbow", lazy = false },

  "NvChad/nvcommunity",
  { import = "nvcommunity.git.lazygit" },
  { import = "nvcommunity.editor.autosave" },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      -- require "plugins.dap"
      local dap = require "dap"
      local dapui = require "dapui"

      -- Add listeners to automatically open and close dapui
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end

      -- vscode-js-debug (js-debug-adapter in Mason)
      require("dap-vscode-js").setup {
        debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
        debugger_cmd = { "js-debug-adapter" },
        adapters = {
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
        },
      }

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { "/Users/sullrich/Downloads/js-debug/src/dapDebugServer.js", "${port}" },
        },
      }

      -- add configuration for typescript and javascript
      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            name = "Deno launch",
            request = "launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}",
            -- runtimeExecutable = vim.fn.getenv "HOME" .. "/.deno/bin/deno",
            runtimeArgs = {
              "run",
              "--inspect-wait",
              "--allow-all",
            },
            attachSimplePort = 9229,
          },
        }
      end
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "󱓞 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "󰇉 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "jghauser/kitty-runner.nvim",
    lazy = false,
    config = function()
      require("kitty-runner").setup()
    end,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
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
        disable_move = true,
        week_header = {
          enable = false,
        },
        shortcut = {
          {
            icon = "  ",
            icon_hl = "DashboardIconPrimary",
            desc = "Projects",
            group = "DashboardPrimary",
            action = "Telescope project",
            key = "p",
          },
          {
            icon = "󰋚  ",
            icon_hl = "DashboardIconPrimary",
            desc = "Recent",
            group = "DashboardPrimary",
            action = "Telescope oldfiles",
            key = "r",
          },
          {
            icon = "  ",
            icon_hl = "DashboardIconPrimary",
            desc = "Grep",
            group = "DashboardPrimary",
            action = "Telescope live_grep",
            key = "g",
          },
          {
            icon = "󰍉  ",
            icon_hl = "DashboardIconPrimary",
            desc = "Find",
            group = "DashboardPrimary",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = "  ",
            icon_hl = "DashboardIconSecondary",
            desc = "Config",
            group = "DashboardSecondary",
            action = "e $MYVIMRC",
            key = "c",
          },
          {
            icon = "󰚰  ",
            icon_hl = "DashboardIconSecondary",
            desc = "Update",
            group = "DashboardSecondary",
            action = "Lazy update",
            key = "u",
          },
          {
            icon = "󰛯  ",
            icon_hl = "DashboardIconSecondary",
            desc = "Health",
            group = "DashboardSecondary",
            action = "checkhealth",
            key = "h",
          },
          {
            icon = "󰩈  ",
            icon_hl = "DashboardIconPrimary",
            desc = "Quit",
            group = "DashboardPrimary",
            action = "qa",
            key = "q",
          },
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
          local date = os.date "%A, %d. %B %Y %H:%M:%S"
          return { "", date }
        end,
      },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
  },
}

return plugins
