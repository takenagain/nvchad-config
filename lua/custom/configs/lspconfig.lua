local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "tsserver", "html", "cssls", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {
        "--config=~/Documents/docwize/docwize2/py-api/pyprojct.toml",
      },
    },
  },
}
