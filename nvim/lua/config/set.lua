-- Files
vim.opt.autoread = true
vim.opt.errorbells = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 1000 

-- Edition
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.showmatch = true
vim.opt.scrolloff = 5
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Interface
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.shortmess:append("c")
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
