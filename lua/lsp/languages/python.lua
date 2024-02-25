local lspconfig = require "lspconfig"
local lspmanager = require "lvim.lsp.manager"
local formatters = require "lvim.lsp.null-ls.formatters"

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "ruff_lsp"
end, lvim.lsp.automatic_configuration.skipped_servers)

lspmanager.setup("pyright", {
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        ignore = { "*" }
      }
    }
  }
})

lspconfig.ruff_lsp.setup({ filetypes = { "python" } })

formatters.setup {
  { name = "djlint", filetypes = { "htmldjango" } },
}
