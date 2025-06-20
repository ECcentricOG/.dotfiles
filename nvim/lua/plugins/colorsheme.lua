function EccColors(color)
        -- color = color or "intellij-dark"
        color = color or "tokyonight-night"
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "kenoshen/intellij-dark.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        config = function()
            EccColors()
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            EccColors()
        end,
    }
}
