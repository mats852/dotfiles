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

" Infect !
execute pathogen#infect()

" Filetype plugins
filetype plugin on
filetype indent on

" Set autoread when a file is changed from the outside
set autoread

" Show current position
set ruler

" Configure workspace so it works as it should
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Ignore case when searching
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" -------------------------------------
"  Appearance settings
" -------------------------------------

syntax enable
set background=dark
set t_Co=256
let g:molokai_original = 1
colorscheme molokai

let g:airline_theme = 'molokai'

" Font style
if has('gui_running')
  set guifont=Inconsolata:h11
endif

" Windows GVIM plugin enabler
set laststatus=2
set ttimeoutlen=50 

" -------------------------------------
"  File & backup settings
" -------------------------------------

set nobackup
set nowb
set noswapfile

" -------------------------------------
"  Text settings
" -------------------------------------

" Use spaces, damn it!
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nowrap
set textwidth=0

" -------------------------------------
"  Keyboard shortcuts
" -------------------------------------

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<SR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
