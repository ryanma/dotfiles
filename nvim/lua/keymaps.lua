vim.keymap.set('n', '<leader>e', MiniFiles.open)
vim.keymap.set('n', '<leader>gr', ':call CommitFileAndTestFile()<CR>')

-- vim.cmd('command⋅Green⋅call⋅CommitFileAndTestFile()')
-- vim.api.nvim_create_user_command('Green', 'CommitFileAndTestFile()', {})
-- vim.api.nvim_create_user_command('Green', function(opts) print("hello world") end, {})
