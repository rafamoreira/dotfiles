vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        --opts = { style="night" },
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    { 
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { 
                    "c", 
                    "elixir", 
                    "heex", 
                    "html",
                    "javascript", 
                    "lua", 
                    "python",
                    "query", 
                    "vim", 
                    "vimdoc", 
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end

    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

}, {}
)
-- require("tokyonight").setup({style="night"})
-- require("lazy").setup("plugins", {})
-- require("lazy").setup({
-- 	"folke/which-key.nvim",
--   -- { "folke/neoconf.nvim", cmd = "Neoconf" },
--   -- "folke/neodev.nvim", 
-- })

-- configs
vim.wo.number = true

-- telescope
--
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
-- vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>th', builtin.help_tags, {})

-- which key
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        f = {
            name = "+file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            g = { "<cmd>Telescope live_grep<cr>", "Grep Files" }, 
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        },
        h = {
            name = "+help",
            h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        },
    },
})
