local lsp_manager = require("lvim.lsp.manager")
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { command = "gdformat", filetypes = { "gdscript" } },
}
lsp_manager.setup("gdscript",
  {
    filetypes = { "gdscript" },
  })

-- Use lvim as an external editor for the godot engine
-- lvim --listen 127.0.0.1:55432 .
