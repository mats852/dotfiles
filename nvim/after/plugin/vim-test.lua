local remap = require("config.keymap")
local nnoremap = remap.nnoremap

vim.cmd([[
  let test#strategy = 'vimux'
  let test#go#gotest#options = {
    \ 'nearest': '-v',
  \}
]])
