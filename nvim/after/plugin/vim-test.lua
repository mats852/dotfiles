local remap = require("config.keymap")
local nnoremap = remap.nnoremap

vim.cmd([[
  let test#strategy = 'vimux'
  let test#go#gotest#options = {
    \ 'nearest': '-v',
  \}
]])

nnoremap("<F9>", ":TestNearest<CR>")
nnoremap("<F10>", ":TestFile<CR>")
