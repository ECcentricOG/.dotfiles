return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.angularls.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = 'Hover'})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = 'Go to Definition'})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = 'Go to References'})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = 'Code Action'})
            vim.keymap.set('n', '<leader>vn', vim.lsp.buf.rename, {desc = 'Rename'})
        end,
    },
}
