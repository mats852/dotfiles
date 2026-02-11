local dap = require('dap')

-- Swift debugging requires Swift-aware lldb-dap
-- Setup: ln -sf ~/.swiftly/bin/lldb-dap ~/.local/bin/lldb-dap-swift

dap.adapters.swift_lldb = {
  type = 'executable',
  command = vim.fn.expand('~/.swiftly/bin/lldb-dap'),
  name = 'swift_lldb',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
}

dap.configurations.swift = {
  {
    name = 'Launch',
    type = 'swift_lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
