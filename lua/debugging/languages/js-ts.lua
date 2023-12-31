local dap = require('dap')
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

-- require("dap-vscode-js").setup {
--   node_path = "node",
--   debugger_path = mason_path .. "packages/js-debug-adapter",
--   debugger_cmd = { "js-debug-adapter" },
--   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
-- }

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" }
}

local dapNode = {
  name = 'Launch',
  type = 'node2',
  request = 'launch',
  program = '${file}',
  cwd = vim.loop.cwd(),
  sourceMaps = true,
  protocol = 'inspector',
  console = 'integratedTerminal',
}

dap.configurations.javascript = { dapNode }
dap.configurations.typescript = { dapNode }
