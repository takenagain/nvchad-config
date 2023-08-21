local options = {
  ensure_installed = {
    -- General
    "lua-language-server",
    "json-lsp",
    "nginx-language-server",

    -- Rust
    "rust-analyzer",
    "codelldb",

    -- Javascript
    "html-lsp",
    "prettierd",
    "eslint-lsp",
    "js-debug-adapter",
    "typescript-language-server",
    "css-lsp",

    -- Python 
    "debugpy",
    "pyright",
    "black",
    "ruff",
    "ruff-lsp",
    "mypy",

    -- Golang
    "gopls",
    "go-debug-adapter",

    -- Docker
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- SQL
    "sqlls",
    "sql-formatter",
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
