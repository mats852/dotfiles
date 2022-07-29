local remap = require("config.keymap")
local nnoremap = remap.nnoremap

vim.opt.rtp:append("/usr/local/opt/fzf")

nnoremap("<leader>r", function()
  vim.cmd([[
    :exec ":CtrlSF ".input("CtrlSF pattern: ")
  ]])
end)
