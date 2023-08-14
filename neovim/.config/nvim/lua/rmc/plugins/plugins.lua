return {
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

  "tpope/vim-fugitive",

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

  {
     "m4xshen/hardtime.nvim",
     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
     opts = {}
  },
}
