local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "js", "ts", "tsx", "json" } },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- shell
  b.formatting.shfmt,

  -- general
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
