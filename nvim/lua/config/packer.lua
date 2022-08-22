vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Languages
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nelsyeung/twig.vim'
  use 'stephpy/vim-php-cs-fixer'

  -- LSP, Syntax, Lint
  use 'dense-analysis/ale'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'raimondi/delimitmate'
  use 'L3MON4D3/LuaSnip'

  -- File navigation
  use 'dyng/ctrlsf.vim'
  use 'junegunn/fzf'
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'

  -- UI
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'bling/vim-airline'
  use 'edkolev/tmuxline.vim'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline-themes'
  use 'preservim/vimux'
  use 'sindrets/diffview.nvim'

  -- Utils
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'janko/vim-test'

  -- Color Schemes
  use 'ayu-theme/ayu-vim'
  use 'dracula/vim'
  use 'morhetz/gruvbox'
  use 'sainnhe/everforest'
  use 'sainnhe/sonokai'
  use 'liuchengxu/space-vim-dark'
end)
