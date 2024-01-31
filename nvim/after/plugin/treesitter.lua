require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },

  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}
