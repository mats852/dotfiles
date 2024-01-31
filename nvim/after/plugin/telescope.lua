local remap = require("config.keymap")
local nnoremap = remap.nnoremap

local telescope = require('telescope')
local telescope_builtin = require("telescope.builtin")
local telescope_actions = require('telescope.actions')
local trouble = require('trouble')
local trouble_telescope_provider = require('trouble.providers.telescope')

telescope.setup {
  defaults = {
    mappings = {
      i = { ['<c-t>'] = trouble.open_with_trouble },
      n = { ['<c-t>'] = trouble.open_with_trouble },
    },
  },
}

nnoremap('<leader>ff', function()
  telescope_builtin.find_files({ hidden = true })
end)

nnoremap('<leader>fs', function()
  telescope_builtin.live_grep()
end)

nnoremap('<leader>fb', function()
  telescope_builtin.buffers()
end)

nnoremap('<leader>fh', function()
  telescope_builtin.help_tags()
end)
