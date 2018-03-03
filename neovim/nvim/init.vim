" -------------------------------------
"  Maintainer:
"     Mathieu St-Vincent
" -------------------------------------
"
"  " -------------------------------------
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


if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
endif

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'raimondi/delimitmate'
Plugin 'junegunn/fzf'

" Languages
Plugin 'othree/html5.vim'
Plugin 'stanangeloff/php.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'isruslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-haml'                 " Haml, Sass, SCSS
Plugin 'elzr/vim-json'
Plugin 'chase/vim-ansible-yaml'
Plugin 'moll/vim-node'
Plugin 'suan/vim-instant-markdown'

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'crusoexia/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'sonph/onehalf'
Plugin 'whatyouhide/vim-gotham'
Plugin 'cocopon/iceberg.vim'

call vundle#end()

" Set NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Enable deoplete
let g:deoplete#enable_at_startup = 1

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


" Enable Python
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'


" -------------------------------------
"  END Plugins Settings 
" -------------------------------------





" -------------------------------------
"  Appearance settings
" -------------------------------------

syntax enable
set background=dark
set t_Co=256
colorscheme gruvbox 


" set true colors and add vim specific fixes
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum


" -------------------------------------
"  Interface settings
" -------------------------------------

set guifont=OperatorMono-Book:h16
" For italic on operator mono
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

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
set tabstop=4                           " use two spaces for tabs

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
"  Keyboard shortcuts
" -------------------------------------

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<SR>
function! <SID>SynStack()
if !exists("*synstack")
return
endif
echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,
"name")')
endfunc
