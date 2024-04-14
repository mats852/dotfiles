local remap = require("config.keymap")
local nnoremap = remap.nnoremap

-- vim.cmd([[
--   let g:ale_fix_on_save = 1
--   let g:ale_fixers = {
--   \ '*': ['remove_trailing_lines', 'trim_whitespace'],
--   \ 'javascript': ['eslint'],
--   \ 'typescript': ['eslint'],
--   \ 'vue': ['eslint'],
--   \ 'php': ['php_cs_fixer'],
--   \ 'go': ['gofmt', 'goimports', 'gofumpt'],
--   \ 'rust': ['rustfmt'],
--   \ 'kotlin': ['ktlint'],
--   \ 'c': ['clang-format'],
--   \ }
-- ]])
--
-- nnoremap("<F12>", "<Plug>(ale_fix)")
