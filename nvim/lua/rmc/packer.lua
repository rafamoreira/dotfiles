-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'Mofiqul/dracula.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use 'jose-elias-alvarez/null-ls.nvim'

    -- use 'mfussenegger/nvim-dap'

    --   use { 'neoclide/coc.nvim', branch = 'release', }
    --
    --
    use 'tpope/vim-fugitive'

    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }


end)
