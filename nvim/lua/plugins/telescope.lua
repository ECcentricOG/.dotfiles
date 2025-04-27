return {
    { 
        "nvim-telescope/telescope-ui-select.nvim",
        config = function() 
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.5",

        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        config = function()
            require('telescope').setup({})

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
            vim.keymap.set('n', '<leader>sl', function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set('n', '<leader>sw', function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set('n', '<leader>sg', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
        end
    }
}
