local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt,
  
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- shell
  b.formatting.shfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
