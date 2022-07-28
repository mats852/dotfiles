local inoremap = require("config.keymap").inoremap
local nnoremap = require("config.keymap").nnoremap
local vnoremap = require("config.keymap").vnoremap

-- Netrm explorer
nnoremap("<leader>pv", ":Ex<CR>")

-- Don't suspend
nnoremap("<c-z>", "<nop>")

-- Screw your ex
nnoremap("Q", "<nop>")

-- To behave like other commands, to EOL
nnoremap("Y", "y$")

-- Keep cursor position
nnoremap("J", "mzJ`z")

-- Keep selection in center of screen
nnoremap ("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- Creates change breakpoint at punctuation mark
inoremap(", ,", "<c-g>u")
inoremap(". .", "<c-g>u")
inoremap("! !", "<c-g>u")
inoremap("? ?", "<c-g>u")

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
inoremap("<C-j>", "<esc>:m .+1<CR>==")
inoremap("<C-k>", "<esc>:m .-2<CR>==")
nnoremap("<leader>k", ":m .-2<CR>==")
nnoremap("<leader>j", ":m .+1<CR>==")
