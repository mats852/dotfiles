" -------------------------------------
"  Maintainer:
"     Mathieu St-Vincent
" -------------------------------------

" -------------------------------------
"  General settings
" -------------------------------------

set nocompatible
filetype off
filetype plugin indent on


" -------------------------------------
"  Interface settings
" -------------------------------------

set mouse=a                             " Activates the mouse
set ruler                               " Show current position
set number                              " First set number
set relativenumber                      " Show relative line number hybrid
set backspace=indent,eol,start          " Configure workspace so it works as it should
set whichwrap+=<,>,h,l                  
set magic                               " For regular expressions turn magic on
set showmatch                           " Show matching brackets when text indicator is over them
set mat=2                               " How many tenths of a second to blink when matching brackets
set scrolloff=5                         " keep at least 5 lines above/below
set noerrorbells                        " No annoying sound on errors
set novisualbell
set tm=500
set re=0


" -------------------------------------
"  File & backup settings
" -------------------------------------

set autoread                            " update file when changed outside of vim
set autoindent                          " copy indentation from the previous line for new line
set history=200                         " store last 200 commands as history
set nobackup                            " don't save backups
set noerrorbells                        " no error bells please
set noswapfile                          " no swapfiles
set nowritebackup                       " don't save a backup while editing
set lazyredraw                          " see if this fixes the slowness
set ttyfast                             " indicates a fast terminal connection
set undodir=~/.local/share/nvim/undodir " set undofile location
set undofile                            " maintain undo history between sessions
set undolevels=1000                     " store 1000 undos


" -------------------------------------
"  Text settings
" -------------------------------------

" set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set completeopt=menuone,noselect
set shortmess+=c                        " Avoid showing message extra message when using completion
set nowrap                              " don't wrap my text !
set expandtab                           " use spaces instead of tabs
set nojoinspaces                        " use one space, not two, after punctuation
set shiftround                          " shift to next tabstop
set shiftwidth=2                        " amount of space used for indentation
set softtabstop=2                       " appearance of tabs
set tabstop=2                           " use four spaces for tabs

" Text options
set formatoptions-=cro                  " prevent next line comments

" searching
set hlsearch                            " highlight search matches
set ignorecase                          " set case insensitive searching
set incsearch                           " find as you type search
set smartcase                           " case sensitive searching when not all lowercase

" character encoding
if !&readonly && &modifiable
  set fileencoding=utf-8              " the encoding written to file
endif
set encoding=utf-8                    " the encoding displayed


" -------------------------------------
"  Plugins Settings 
" -------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" Languages
" ------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nelsyeung/twig.vim'
Plug 'stephpy/vim-php-cs-fixer'

" Automation
" ------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/syntastic'
Plug 'janko/vim-test'
Plug 'junegunn/fzf'
Plug 'dyng/ctrlsf.vim'

" UI
" ------------------------
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" Utils
" ------------------------
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'aquach/vim-http-client'

" Color Schemes
" ------------------------
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/sonokai'

call plug#end()


" Plugin settings
" ------------------------

" ===== LSPs =====
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  require'completion'.on_attach(client, bufnr)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "intelephense" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" ===== TreeShitter =====
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ===== vim-test =====
let test#strategy = ''
map <F9> :TestNearest<CR>
map <F10> :TestFile<CR>


" ===== completion-nvim =====
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ===== w0rp/ALE =====
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'vue': ['eslint'],
\ 'php': ['php_cs_fixer'],
\ }

nmap <F12> <Plug>(ale_fix)

" ===== Quramy/tsuquyomi =====
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" ===== NERDTree =====
map <C-n> :NERDTreeToggle<CR>

" ===== FZF =====
set rtp+=/usr/local/opt/fzf
map <C-f> :FZF<CR>

" ===== CtrlSF =====
nnoremap <leader>r :exec ":CtrlSF ".input("CtrlSF pattern: ")<CR>

" ===== NERDTree show hidden files =====
let NERDTreeShowHidden=1

" ===== airblade vim gutter =====
set updatetime=100


" Syntax highlighting
" ------------------------

" Make Vue files work
autocmd BufRead,BufNewFile *.vue setfiletype html

" Make .twig files work
autocmd BufNewFile,BufRead *.twig set filetype=html.twig

autocmd FileType php setlocal autoindent expandtab shiftwidth=4 softtabstop=4

" -------------------------------------
"  END Plugins Settings 
" -------------------------------------




" -------------------------------------
"  Appearance settings
" -------------------------------------

set background=dark
set t_Co=256
syntax enable

" set true colors and add vim specific fixes
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" color scheme
let ayucolor="dark"
colorscheme ayu

" Fonts
set guifont=Iosevka:h16

" For italic on operator mono
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic


" -------------------------------------
"  Autocmd Rules
" -------------------------------------

" The PC is fast enough, do syntax highlight syncing from start unless 1000 lines
" augroup vimrc-sync-fromstart
"   autocmd!
"   autocmd BufEnter * :syntax sync maxlines=1500
" augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

