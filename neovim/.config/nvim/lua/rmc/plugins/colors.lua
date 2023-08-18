return {
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'dracula'
    end,

  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
  },
}
