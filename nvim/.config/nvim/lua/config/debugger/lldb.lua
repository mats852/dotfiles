local dap = require('dap')

dap.configurations.rust = dap.configurations.lldb
dap.configurations.c = dap.configurations.lldb
dap.configurations.cpp = dap.configurations.lldb
dap.configurations.zig = dap.configurations.lldb

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
  name = 'lldb',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
}
