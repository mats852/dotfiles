local dap = require("dap")
local dapui = require('dapui')
local daptext = require("nvim-dap-virtual-text")
local dap_vscode = require('dap.ext.vscode')

require("config.debugger.go")
require("config.debugger.lldb")

local remap = require("config.keymap")
local nnoremap = remap.nnoremap

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🔵', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='👉', texthl='', linehl='', numhl=''})

daptext.setup()
dapui.setup()
dap_vscode.load_launchjs(nil, { lldb = { 'rust', 'c', 'cpp' } })

dap.defaults.terminate_on_exit = false

dap.listeners.after.event_terminated["dapui_config"] = function()
  -- You can comment out this line to prevent dap-ui from closing automatically
  -- dapui.close()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

nnoremap("<Home>", function()
  dapui.toggle(1)
end)

nnoremap("<End>", function()
  dapui.toggle(2)
end)

nnoremap("<leader>5", function()
  dap.continue()
end)

nnoremap("<leader>6", function()
  dap.close()
end)

nnoremap("<Up>", function()
  dap.continue()
end)

nnoremap("<Down>", function()
  dap.step_over()
end)

nnoremap("<Right>", function()
  dap.step_into()
end)

nnoremap("<Left>", function()
  dap.step_out()
end)

nnoremap("<Leader>b", function()
  dap.toggle_breakpoint()
end)

nnoremap("<Leader>B", function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

nnoremap("<leader>dc", function()
  dap.run_to_cursor()
end)

nnoremap("<leader>dl", function()
  dap.run_last()
end)
