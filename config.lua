-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.colorscheme = "kanagawa-dragon"

lvim.plugins = {
  "rebelot/kanagawa.nvim",
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "mxsdev/nvim-dap-vscode-js",
}

local lspconfig = require('lspconfig')
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

-- Testing and Debugging
local dap = require('dap')
lvim.builtin.dap.active = true

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F6>', require 'dap'.step_over)
vim.keymap.set('n', '<F7>', require 'dap'.step_into)
vim.keymap.set('n', '<F8>', require 'dap'.step_out)
vim.keymap.set('n', '<F9>', require 'dap'.clear_breakpoints)


require("dap-vscode-js").setup {
  node_path = "node",
  debugger_path = mason_path .. "packages/js-debug-adapter",
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
}

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath "data" .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" }
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.loop.cwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Debug Django
table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py',
  args = { 'runserver', '--noreload' },
})

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- Formatters and Linters
lvim.format_on_save.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black", args = { "--line-length", "150" } },
  { name = "djlint" },

}

lspconfig.tailwindcss.setup {}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "eslint", filetypes = { "javascript" } } }

-- Emmet
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "html", "htmldjango",
    "pug",
    "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})

-- Switching Between Buffers
lvim.keys.normal_mode["L"] = ":bnext<cr>"
lvim.keys.normal_mode["H"] = ":bprev<cr>"
