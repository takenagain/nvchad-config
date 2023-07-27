local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.ruff,
  null_ls.builtins.diagnostics.ruff.with { extra_args = { "--max-line-length=180" } },
  lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
