local plugins = {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap_vscode = require "dap.ext.vscode"
      dap_vscode.load_launchjs()

      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_DEFAULT_ENV" or "/usr"
      local path = virtual .. "/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("core.utils").load_mappings "neotest"
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = {
              justMyCode = false,
              console = "integratedTerminal",
            },
            args = { "--log-level", "DEBUG", "--quiet" },
            runner = "pytest",
          },
          require "neotest-rust" {
            args = { "--no-capture" },
            dap_adapter = "lldb",
          },
        },
      }
    end,
  },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "rouge8/neotest-rust",
  },
  {
    "nvim-neotest/neotest-go",
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
    event = "InsertEnter",
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      -- FIXME: there has to be a better place to do this or a better way to set these defaults :(
      vim.cmd "set title"
      vim.cmd "set foldmethod=indent"

      -- autoread
      -- vim.cmd("set autoread")
      -- vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
      -- vim.cmd("autocmd FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None")
      vim.o.autoread = true
      vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
        command = "if mode() != 'c' | checktime | endif",
        pattern = { "*" },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require("core.utils").load_mappings "trouble"
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "jedrzejboczar/possession.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("possession").setup {
        autosave = {
          current = true,
          tmp = true,
          tmp_name = "tmp",
          on_load = true,
          on_quit = true,
        },
        plugins = {
          delete_hidden_buffers = false,
        },
      }
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp",
    config = true,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      {
        "<leader>vs",
        ",v",
        "<cmd>:VenvSelect<cr>",
        -- optional if you use a autocmd (see #🤖-Automate)
        "<leader>vc",
        "<cmd>:VenvSelectCached<cr>",
      },
    },
  },
  {
    "ActivityWatch/aw-watcher-vim",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = { follow_files = true },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,  -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk)
          map("n", "<leader>hr", gs.reset_hunk)
          map("v", "<leader>hs", function()
            gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end)
          map("v", "<leader>hr", function()
            gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end)
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis "~"
          end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      }
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        openai_params = {
          model = "gpt-3.5-turbo",
          max_tokens = 4096, -- max is 8192 for gpt-4
        },
        chat = {
          keymaps = {
            new_session = "<C-m>",
            select_session = "<C-Space>",
          },
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "danymat/neogen",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- config = true,
    config = function()
      require("neogen").setup {}
      require("core.utils").load_mappings "neogen"
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    "davidmh/cspell.nvim",
    lazy = false,
    -- config = function()
    --   require("cspell").setup {}
    -- end,
  },

  -- Dart
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("flutter-tools").setup {
        debugger = {          -- integrate with nvim dap + install dart code debugger
          enabled = true,
          run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
          register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_tools = {
          autostart = true,         -- autostart devtools server if not detected
          auto_open_browser = true, -- Automatically opens devtools in the browser
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
            -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
            -- this will show the currently selected project configuration
            project_config = true,
          },
        },
      }
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = false,
    config = function()
      require("core.utils").load_mappings "outline"
      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
}
return plugins
