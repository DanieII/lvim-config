local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

formatters.setup {
  { command = "prettier", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css" } },
}
linters.setup { { command = "eslint", filetypes = { "javascript" } } } -- .eslintrc.js file should be added to the project or home directory
