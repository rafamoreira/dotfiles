return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function ()
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
    end
  }
}
