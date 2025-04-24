return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n","<leader>a", mark.add_file)
        vim.keymap.set("n","<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n","<C-n>",function() ui.nav_file(1)end)
        vim.keymap.set("n","<C-m>",function() ui.nav_file(2)end)
        vim.keymap.set("n","<C-f>",function() ui.nav_file(3)end)
        vim.keymap.set("n","<C-l>",function() ui.nav_file(4)end)

        vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
        vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
        vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
        vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

        vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")

    end,
}
