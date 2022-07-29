local remap = require("config.keymap")
local nnoremap = remap.nnoremap

vim.opt.rtp:append("/usr/local/opt/fzf")

nnoremap("<C-f>", ":FZF<CR>")
