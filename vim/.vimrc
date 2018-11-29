" -------------------------------------
"  Maintainer:
"     Mathieu St-Vincent 
"
"  Inspired_by:
"     https://github.com/dwieeb
" -------------------------------------


" -------------------------------------
"  General settings
" -------------------------------------

set nocompatible
filetype off                  " required
filetype plugin indent on     " required 

" -------------------------------------
"  Plugins Settings 
" -------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" UI and functionalities
" ------------------------

Plugin 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf'
Plugin 'raimondi/delimitmate'
Plugin 'quramy/tsuquyomi'





" Languages
" ------------------------

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
" Elm
Plugin 'elmcast/elm-vim'
" Html
Plugin 'digitaltoad/vim-jade'
Plugin 'othree/html5.vim'
" PHP
Plugin 'stanangeloff/php.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'nelsyeung/twig.vim'
" Styling
Plugin 'tpope/vim-haml'                 " Haml, Sass, SCSS
Plugin 'groenewege/vim-less'
" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'moll/vim-node'
Plugin 'isruslan/vim-es6'
Plugin 'elzr/vim-json'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mxw/vim-jsx'
" Markdown
Plugin 'suan/vim-instant-markdown'
" Liquid
Plugin 'tpope/vim-liquid'



" Color Schemes
" ------------------------
Plugin 'MenkeTechnologies/VimColorSchemes'
Plugin 'joshdick/onedark.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'whatyouhide/vim-gotham'
Plugin 'cocopon/iceberg.vim'

call vundle#end()


" Enablers and settings
" ------------------------

" Autostart Deoplete
let g:deoplete#enable_at_startup = 1

" Set NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Enable Emmet
let g:user_emmet_mode='a'               "enable all function in all mode.

" JSX enabled in .js files
let g:jsx_ext_required = 0

" Php overriding highlighting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Enable FZF
set rtp+=/usr/local/opt/fzf

" NERDTree show hidden files
let NERDTreeShowHidden=1

" Make TSX files work plez
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

" Make .twig files work
autocmd BufNewFile,BufRead *.twig setlocal filetype=html.twig.js.css

" Make Elixir files work
autocmd BufNewFile,BufRead *.ex, *.exs, .eex setlocal filetype=elixir

" -------------------------------------
"  END Plugins Settings 
" -------------------------------------



" -------------------------------------
"  Appearance settings
" -------------------------------------

syntax on
set background=dark
colorscheme onedark

let g:onedark_termcolors=256
let g:airline_theme='onedark'

" set true colors and add vim specific fixes
set termguicolors
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set t_Co=256

set guifont=OperatorMono-Book:h18
" For italic on operator mono
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic


" -------------------------------------
"  Interface settings
" -------------------------------------

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
set expandtab                           " use tabs instead of spaces
set nojoinspaces                        " use one space, not two, after punctuation
set shiftround                          " shift to next tabstop
set shiftwidth=4                        " amount of space used for indentation
set softtabstop=4                       " appearance of tabs
set tabstop=4                           " use four spaces for tabs
"
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
"  Autocmd Rules
" -------------------------------------

" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END
