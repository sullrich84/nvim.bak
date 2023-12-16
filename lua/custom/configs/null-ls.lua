local null_ls = require "null-ls"
local utils = require "null-ls.utils"
local b = null_ls.builtins

local sources = {
  b.formatting.deno_fmt.with {
    root_dir = utils.root_pattern("deno.json", "deno.jsonc"),
    extra_args = { "--no-semicolons" },
    condition = function(utils)
      return utils.root_has_file { "deno.json", "deno.jsonc" }
    end,
  },

  b.formatting.prettier.with {
    root_dir = utils.root_pattern "package.json",
    condition = function(utils)
      return utils.root_has_file { "package.json" }
    end,
  },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- shell
  b.formatting.shfmt,

  -- python
  b.formatting.black
}

null_ls.setup {
  debug = true,
  sources = sources,
}
