---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'doomchad',
  transparency=true,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
