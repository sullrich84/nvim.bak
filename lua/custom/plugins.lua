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
    "chrisgrieser/nvim-alt-substitute",
    event = "CmdlineEnter",
    opts = true,
  },

  { "tommcdo/vim-exchange", lazy = false },
  { "AndrewRadev/switch.vim", lazy = false },
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

      -- add configuration for typescript and javascript
      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            name = "Deno launch",
            request = "launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = vim.fn.getenv "HOME" .. "/.deno/bin/deno",
            -- runtimeArgs = { "run", "--inspect-brk" },
            runtimeArgs = { "run", "--inspect=127.0.0.1:9229", "--allow-all" },
            attachSimplePort = 9229,
          },
          {
            name = "Deno attach",
            request = "attach",
            type = "pwa-node",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            runtimeExecutable = vim.fn.getenv "HOME" .. "/.deno/bin/deno",
          },
          {
            name = "Deno launch ?",
            request = "launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = vim.fn.getenv "HOME" .. "/.deno/bin/deno",
            runtimeArgs = { "run", "--inspect-brk" },
            attachSimplePort = 9229,
          },
        }
      end
    end,
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
