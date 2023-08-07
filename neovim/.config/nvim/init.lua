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
  -- tokyonight colorscheme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    --opts = { style="night" },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
    end,
  },

  -- telescope
  { 
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },

  "nvim-telescope/telescope-project.nvim",

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

  {
    'numToStr/Comment.nvim', 
    config = function()
      require("Comment").setup()
    end
  },

  "github/copilot.vim",
  
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  },

  -- lsp shit begins
  "neovim/nvim-lspconfig",

  {
    'windwp/nvim-autopairs',
    even = 'InsertEnter',
    opts = {},
  },

  "tpope/vim-surround",

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
vim.wo.number = true -- show line numbers
vim.o.hlsearch = false -- disable search highlight
vim.o.mouse = "a" -- enable mouse support
vim.o.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.o.undofile = true -- enable undo file
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- ignore case when searching lowercase only
vim.wo.signcolumn = "yes" -- always show sign column

vim.o.updatetime = 250 -- faster completion
vim.o.timeout = true -- enable timeout
vim.o.timeoutlen = 300 -- faster timeout wait time

vim.o.completeopt = "menuone,noselect" -- completion options
vim.o.termguicolors = true -- enable 24-bit RGB colors


-- telescope
local tc = require('telescope')
tc.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    project = {
      hidden_files = true,
    },
  },
}
tc.load_extension('fzf')
tc.load_extension('project')

-- which key
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      h = { "<cmd>Telescope find_files hidden=true<cr>", "Find Files including hidden" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep Files" }, 
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    },
    h = {
      name = "+help",
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    },
    p = { "<cmd>Telescope project<cr>", "Projects" },
  },

})

-- lualine
require("lualine").setup({
  options = {
    theme = "dracula-nvim",
  },
})


-- lsp party
local lsp = require("lspconfig")
-- deno shit
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

lsp.denols.setup{}
lsp.pyright.setup{}
lsp.pylsp.setup{}


