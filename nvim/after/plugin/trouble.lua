local remap = require("config.keymap")
local nnoremap = remap.nnoremap

local trouble = require("trouble")

nnoremap('<leader>tt', function()
  trouble.toggle()
end)
