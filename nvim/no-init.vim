" ===== TreeShitter =====
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ===== vim-test =====
map <F9> :TestNearest<CR>
map <F10> :TestFile<CR>
let test#strategy = 'vimux'
let test#go#gotest#options = {
  \ 'nearest': '-v',
\}

" ===== w0rp/ALE =====
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'vue': ['eslint'],
\ 'php': ['php_cs_fixer'],
\ 'go': ['gofmt', 'goimports'],
\ 'kotlin': ['ktlint'],
\ }

nmap <F12> <Plug>(ale_fix)

" ===== FZF =====
set rtp+=/usr/local/opt/fzf
map <C-f> :FZF<CR>

" ===== CtrlSF =====
nnoremap <leader>r :exec ":CtrlSF ".input("CtrlSF pattern: ")<CR>

