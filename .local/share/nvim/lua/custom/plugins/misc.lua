return {
  {
    'tpope/vim-fugitive',
  },
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = '[U]ndo tree' },
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<leader>c',
      },
      opleader = {
        line = '<leader>c',
      },
    },
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
}
