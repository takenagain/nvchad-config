local options = {
  ensure_installed = {
    "lua-language-server",
    "html-lsp",
    "prettierd",
    "rust-analyzer",
    "debugpy",
    "css-lsp",
    "typescript-language-server",
    "eslint-lsp",
    "ruff",
    "ruff-lsp",
    "js-debug-adapter",
    "codelldb",
    "go-debug-adapter",
    "pyright",
    "black",
    "gopls",
    "docker-compose-language-service",
    "dockerfile-language-service",
    "json-lsp",
    "nginx-language-service",
    "sqlls",
    "sql-formatter",
    "rustfmt",
  }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options
