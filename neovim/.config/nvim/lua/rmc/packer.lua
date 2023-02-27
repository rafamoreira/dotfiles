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
    use 'nvim-telescope/telescope-project.nvim'

    use 'Mofiqul/dracula.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
    -- use 'mfussenegger/nvim-dap'

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

    -- Lua
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'         -- Required
    use 'hrsh7th/cmp-nvim-lsp'     -- Required
    use 'hrsh7th/cmp-buffer'       -- Optional
    use 'hrsh7th/cmp-path'         -- Optional
    use 'saadparwaiz1/cmp_luasnip' -- Optional
    use 'hrsh7th/cmp-nvim-lua'     -- Optional

    -- Snippets
    use 'L3MON4D3/LuaSnip'             -- Required
    use 'rafamadriz/friendly-snippets' -- Optional

    use 'wakatime/vim-wakatime'

    use 'github/copilot.vim'

    use 'cappyzawa/trim.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'Vimjas/vim-python-pep8-indent'

    use 'ActivityWatch/aw-watcher-vim'

    use 'camspiers/animate.vim'
    use 'camspiers/lens.vim'

    use 'ledger/vim-ledger'


    use {
        'ethanholz/nvim-lastplace',
        config = function()
            require('nvim-lastplace').setup()
        end
    }
    -- use "beauwilliams/focus.nvim"
    -- Or lazy load with `module` option. See further down for info on how to lazy load when using FocusSplit commands
    -- Or lazy load this plugin by creating an arbitrary command using the cmd option in packer.nvim
    -- use { 'beauwilliams/focus.nvim', cmd = { "FocusSplitNicely", "FocusSplitCycle" }, module = "focus",
    --     config = function()
    --         require("focus").setup({hybridnumber = true})
    --     end
    -- }
    use 'f-person/git-blame.nvim'
end)
