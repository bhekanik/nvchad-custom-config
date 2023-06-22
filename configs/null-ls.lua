local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  b.code_actions.gitsigns,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.eslint,   -- choosed deno for ts/js files cuz its very fast!
  b.diagnostics.eslint,
  b.code_actions.eslint_d,
  b.formatting.prettierd,
  b.formatting.prettier_eslint,
  b.formatting.prismaFmt,

  b.code_actions.refactoring,
  b.diagnostics.markdownlint,
  b.formatting.black,
  b.formatting.mdformat,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
