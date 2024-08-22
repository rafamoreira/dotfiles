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
      wk.add({
        {"<leader>f", group = "files" }, -- group
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n"},
        {"<leader>fe", "<cmd>Ex<cr>", desc = "netrw"},
        {"<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files including hidden" },
        {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
        {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>h", group = "help" },
        { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
        { "<leader>p", "<cmd>Telescope project<cr>", desc = "Projects" },
      })
    end
  }
}
