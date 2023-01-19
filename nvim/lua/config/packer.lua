vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color Schemes
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- Programming
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nelsyeung/twig.vim'
  use 'stephpy/vim-php-cs-fixer'
  use 'mfussenegger/nvim-dap'
  use {'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap'}
  use 'theHamsta/nvim-dap-virtual-text'
  use 'leoluz/nvim-dap-go'
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-vim-test',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim'
    }
  }

  -- LSP, Syntax, Lint
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'dense-analysis/ale'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-git'
  use 'raimondi/delimitmate'
  use 'L3MON4D3/LuaSnip'

  -- Utils
  use 'nvim-lua/plenary.nvim'

  -- UI
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'ThePrimeagen/harpoon',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'preservim/vimux'
  use 'sindrets/diffview.nvim'
end)
