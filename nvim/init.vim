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
"  Appearance settings
" -------------------------------------

set termguicolors
set background=dark
set t_Co=256
syntax enable

set guifont=Iosevka:h16

hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic


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

set completeopt=menuone,noselect        " Set completeopt to have a better completion experience
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
  set fileencoding=utf-8                " the encoding written to file
endif
set encoding=utf-8                      " the encoding displayed


" -------------------------------------
"  Remaps
" -------------------------------------

" To behave like other commands, to EOL
nnoremap Y y$

" Keep cursor position
noremap J mzJ`z

" Keep selection in center of screen
noremap n nzzzv
noremap N Nzzzv

" Creates change breakpoint at punctuation mark
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==


" -------------------------------------
"  Plugins Settings 
" -------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" Languages
" ------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nelsyeung/twig.vim'
Plug 'stephpy/vim-php-cs-fixer'

" LSP, Syntax, Lint
" ------------------------
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'raimondi/delimitmate'

" File navigation
" ------------------------
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'

" UI
" ------------------------
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utils
" ------------------------
Plug 'janko/vim-test'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'

" Color Schemes
" ------------------------
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf'

call plug#end()


" -------------------------------------
"  Colorscheme
" -------------------------------------

colorscheme sonokai


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
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "phpactor" }
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


" ===== nvim-compe =====
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.treesitter = v:true
let g:compe.source.tmux = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <TAB>     pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>            pumvisible() ? "\<C-p>" : "\<C-h>"

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

