local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dp"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dR"] = { "<CMD>lua require('dap').run_to_cursor() <CR>", "Run to Cursor" },
    ["<leader>dU"] = { "<CMD>lua require('dapui').toggle() <CR>", "Toggle UI" },
    ["<leader>dd"] = { "<CMD>lua require('dap').disconnect() <CR>", "Disconnect" },
    ["<leader>de"] = { "<CMD>lua require('dapui').eval() <CR>", "Evaluate" },
    ["<leader>dg"] = { "<CMD>lua require('dap').session() <CR>", "Get Session" },
    ["<leader>dh"] = { "<CMD>lua require('dap.ui.widgets').hover() <CR>", "Hover" },
    ["<leader>dS"] = { "<CMD>lua require('dap.ui.widgets').scopes() <CR>", "Scopes" },
    ["<leader>di"] = { "<CMD>lua require('dap').step_into() <CR>", "Step Into" },
    ["<leader>do"] = { "<CMD>lua require('dap').step_over() <CR>", "Step Over" },
    ["<leader>du"] = { "<CMD>lua require('dap').step_out() <CR>", "Step Out" },
    ["<leader>db"] = { "<CMD>lua require('dap').step_back() <CR>", "Step Back" },
    ["<leader>dP"] = { "<CMD>lua require('dap').pause.toggle() <CR>", "Toggle Pause" },
    ["<leader>dq"] = { "<CMD>lua require('dap').close() <CR>", "Close" },
    ["<leader>dr"] = { "<CMD>lua require('dap').repl.toggle() <CR>", "Toggle Repl" },
    ["<leader>dc"] = { "<CMD>lua require('dap').continue() <CR>", "Continue" },
    ["<leader>dx"] = { "<CMD>lua require('dap').terminate() <CR>", "Terminate" },
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
