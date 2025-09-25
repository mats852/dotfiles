vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color Schemes
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- Programming
  use 'simrat39/rust-tools.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
    }
  }
  use 'nelsyeung/twig.vim'
  use 'stephpy/vim-php-cs-fixer'
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'mfussenegger/nvim-dap-python'
    }
  }
  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'nvim-neotest/nvim-nio',
      'mfussenegger/nvim-dap',
    }
  }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'leoluz/nvim-dap-go'
  use 'vim-test/vim-test'
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- LSP, Syntax, Lint
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

  -- use {
  --   'stevearc/oil.nvim',
  --   config = function()
  --     require("oil").setup()
  --   end,
  -- }

  -- UI
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",        -- optional

      "nvim-telescope/telescope.nvim", -- optional
    },
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
