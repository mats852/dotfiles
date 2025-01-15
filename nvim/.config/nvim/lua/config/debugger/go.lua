local nnoremap = require("config.keymap").nnoremap

local dap = require("dap")
local dapgo = require("dap-go")

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

dap.adapters.go = dap.adapters.delve

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
    buildFlags = dapgo.get_build_flags,
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
    buildFlags = dapgo.get_build_flags,
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
    buildFlags = dapgo.get_build_flags,
  }
}

nnoremap('<F8>', function()
  dapgo.debug_test()
end)
