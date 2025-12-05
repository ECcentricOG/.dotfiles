return {
  {
    "tpope/vim-dadbod",
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui_connections"
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
    config = function()
      vim.keymap.set("n", "<leader>db", "<cmd>DBUI<CR>", { desc = "Toggle DBUI" })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = {
      "tpope/vim-dadbod",
      "hrsh7th/nvim-cmp",
    },
  },
}

