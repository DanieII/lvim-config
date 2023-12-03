local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

formatters.setup {
  { name = "black",  filetypes = { "python" } },
  { name = "djlint", filetypes = { "htmldjango" } },
}
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
}
