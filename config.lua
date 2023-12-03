-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "kanagawa-dragon"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.treesitter.ensure_installed = {
  "python",
  "javascript",
  "lua",
}
vim.opt.linebreak = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 5
vim.opt.lazyredraw = true


require "plugins"
require "keys"
require "lsp"
require "testing"
require "debugging"
require "emmet"
