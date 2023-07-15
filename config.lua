-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

lvim.colorscheme = "kanagawa-dragon"

lvim.plugins = {
  { "rebelot/kanagawa.nvim" },
}

lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "prettier" },
  { name = "djlint" },
}
lvim.format_on_save.enabled = true
require 'lspconfig'.tailwindcss.setup {}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

lvim.keys.normal_mode["L"] = ":bnext<cr>"
lvim.keys.normal_mode["H"] = ":bprev<cr>"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "html" })
local opts = {
  filetypes = { "html", "htmldjango" }
}
require("lvim.lsp.manager").setup("html", opts)
