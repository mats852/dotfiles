local remap = require("config.keymap")
local nnoremap = remap.nnoremap
local telescope = require("telescope.builtin")

nnoremap('<leader>ff', function()
  telescope.find_files({ hidden = true })
end)

nnoremap('<leader>fs', function()
  telescope.live_grep()
end)

nnoremap('<leader>fb', function()
  telescope.buffers()
end)

nnoremap('<leader>fh', function()
  telescope.help_tags()
end)
