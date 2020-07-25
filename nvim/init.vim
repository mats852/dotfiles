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
"  Plugins Settings 
" -------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" Automation
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf'
Plug 'janko/vim-test'
" UI
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
" Utils
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'

" Languages
" ------------------------

" A lot of languages syntax & indent
Plug 'sheerun/vim-polyglot'
" Typescript
Plug 'quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
" PHP
Plug 'stanangeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'nelsyeung/twig.vim'


" Color Schemes
" ------------------------
Plug 'phanviet/vim-monokai-pro'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()


" ===== vim-test =====
let test#strategy = 'neovim'
map <F9> :TestNearest
map <F10> :TestFile


" ===== w0rp/ALE =====
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'vue': ['eslint']
\ }

nmap <F12> <Plug>(ale_fix)


" ===== NERDTree =====
map <C-n> :NERDTreeToggle<CR>


" ===== Enable FZF =====
set rtp+=/usr/local/opt/fzf
map <C-f> :FZF<CR>


" ===== NERDTree show hidden files =====
let NERDTreeShowHidden=1


" ===== Highlighting =====

" Make Vue files work
autocmd BufRead,BufNewFile *.vue setfiletype html

" Make .twig files work
autocmd BufNewFile,BufRead *.twig set filetype=html.twig

" Php overriding highlighting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


" -------------------------------------
"  END Plugins Settings 
" -------------------------------------





" -------------------------------------
"  Appearance settings
" -------------------------------------

syntax enable
set background=dark
set t_Co=256
colorscheme dracula 


" set true colors and add vim specific fixes
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum


" -------------------------------------
"  Interface settings
" -------------------------------------

set guifont=OperatorMono-Book:h16
" For italic on operator mono
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic


set mouse=a                             " Activates the mouse
set ruler                               " Show current position
set backspace=indent,eol,start          " Configure workspace so it works as it should
set whichwrap+=<,>,h,l                  
set magic                               " For regular expressions turn magic on
set showmatch                           " Show matching brackets when text indicator is over them
set mat=2                               " How many tenths of a second to blink when matching brackets
set scrolloff=5                         " keep at least 5 lines above/below
set noerrorbells                        " No annoying sound on errors
set novisualbell
set tm=500


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
set undodir=~/.vim/undodir              " set undofile location
set undofile                            " maintain undo history between sessions
set undolevels=1000                     " store 1000 undos


" -------------------------------------
"  Text settings
" -------------------------------------

set nowrap                              " don't wrap my text !

" Use spaces, damn it!
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
"  Autocmd Rules
" -------------------------------------

" The PC is fast enough, do syntax highlight syncing from start unless 1000 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=1500
augroup END

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
