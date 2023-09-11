local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dp"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    {
      "<leader>dR",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to Cursor",
    },
    {
      "<leader>dE",
      function()
        require("dapui").eval(vim.fn.input "[Expression] > ")
      end,
      desc = "Evaluate Input",
    },
    {
      "<leader>dC",
      function()
        require("dap").set_breakpoint(vim.fn.input "[Condition] > ")
      end,
      desc = "Conditional Breakpoint",
    },
    {
      "<leader>dU",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle UI",
    },
    {
      "<leader>db",
      function()
        require("dap").step_back()
      end,
      desc = "Step Back",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<leader>dd",
      function()
        require("dap").disconnect()
      end,
      desc = "Disconnect",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      mode = { "n", "v" },
      desc = "Evaluate",
    },
    {
      "<leader>dg",
      function()
        require("dap").session()
      end,
      desc = "Get Session",
    },
    {
      "<leader>dh",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Hover Variables",
    },
    {
      "<leader>dS",
      function()
        require("dap.ui.widgets").scopes()
      end,
      desc = "Scopes",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause.toggle()
      end,
      desc = "Pause",
    },
    {
      "<leader>dq",
      function()
        require("dap").close()
      end,
      desc = "Quit",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>ds",
      function()
        require("dap").continue()
      end,
      desc = "Start",
    },
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dx",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    ["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
    ["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap})<cr>", "Test Method DAP" },
    ["df"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
    ["dF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')}, {strategy = 'dap'})<cr>", "Test Class DAP" },
    ["dl"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')}, {last = true})<cr>", "Test Last" },
    ["dL"] = {
      "<cmd>lua require('neotest').run.run({vim.fn.expand('%')}, {last = true, strategy = 'dap'})<cr>",
      "Test Last DAP",
    },
    ["dp"] = {
      "<cmd>lua require('neotest').run.run({vim.fn.expand('%')}, {last = true, strategy = 'dap'})<cr>",
      "Debug Last DAP",
    },
    ["ds"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop Test" },
    ["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>tr"] = { ":Trouble", "Trouble" },
  },
}

return M
