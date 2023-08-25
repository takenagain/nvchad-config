local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dp"] = {"<cmd> DapToggleBreakpoint <CR>"},
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap_python").test_method()
      end
    },
  }
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>fx"] = { ":Trouble", "Trouble" },
  },
}

return M
