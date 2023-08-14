require("rmc")


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
      name = "+files",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      e = { "<cmd>Ex<cr>", "netrw"},
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
lsp.lua.setip{}


