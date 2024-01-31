local remap = require("config.keymap")
local nnoremap = remap.nnoremap

vim.cmd([[
  let test#strategy = 'vimux'
  let test#go#gotest#options = {
    \ 'nearest': '-v',
  \}
]])

nnoremap('<F9>', function()
  vim.cmd('TestNearest')
end)

nnoremap('<F10>', function()
  vim.cmd('TestFile')
end)
