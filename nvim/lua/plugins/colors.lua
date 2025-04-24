function EccColors(color)
	color = color or "intellij-dark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
--
--return {
--
--    {
--        "folke/tokyonight.nvim",
--        config = function()
--            EccColors()
--        end
--    },
--}

return {
    {
        "kenoshen/intellij-dark.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        config = function()
            EccColors()
        end,
    }
}
