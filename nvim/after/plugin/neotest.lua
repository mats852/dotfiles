local neotest = require('neotest')
local remap = require("config.keymap")
local nnoremap = remap.nnoremap

local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

neotest.setup({
  adapters = {
    require('neotest-go'),
    require('neotest-plenary'),
  },
  experimental = {
    test_table = true,
  },
  args = {"-count=1", "-timeout=60s"},
})

nnoremap('<F9>', function()
  neotest.run.run()
end)

nnoremap('<F10>', function()
  neotest.run.run(vim.fn.expand('%'))
end)

nnoremap('<leader>dr', function()
  neotest.run.run({strategy = 'dap'})
end)
