local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.git_files,{})
vim.keymap.set('n', '<leader>sw', function()
	builtin.grep_string({search = vim.fn.input("Find Word > ")});
end)

