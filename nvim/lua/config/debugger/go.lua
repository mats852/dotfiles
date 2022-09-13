local nnoremap = require("config.keymap").nnoremap

local dap = require("dap")

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  }
}

local function debug_test(testname)
  dap.run({
      type = "delve",
      name = testname,
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
      args = {
        "-testify.m",
        testname,
      },
  })
end

nnoremap("<leader>dt", function()
  local testName = vim.fn.input("Test function name: ", "", "file")

  debug_test(testName)
end)
