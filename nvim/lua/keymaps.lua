local map = vim.keymap.set

map('n', '<leader>e', ':Neotree toggle reveal<cr>')
map('n', '<leader>tf', ':Neotree reveal_file=<cfile> reveal_force_cwd<cr>')
map('n', '<leader>gr', ':call CommitFileAndTestFile()<CR>')
map('n', '<leader>x', ':b#<CR> :bd#<CR>')

map('n', '<leader>o', ':Octo<CR>')

map('n', '<leader>gh', ':Gitsigns preview_hunk<CR>')
map('n', '<leader>a', ':call MiniSplitjoin.toggle()<CR>')

map('', '<leader>Sa', function() require("scissors").addNewSnippet() end, { desc = "Snippet: Add"})
-- map('v', '<leader>Sa', function() require("scissors").addNewSnippet() end, { desc = "Snippet: Add"})
map('n', '<leader>Se', function() require("scissors").editSnippet() end, { desc = "Snippet: Edit"})
-- map('v', '<leader>Se', function() require("scissors").editSnippet() end, { desc = "Snippet: Edit"})

map("n", "<C-h>", "<cmd>wincmd h<cr>",  { desc = "navigate left or tab"  })
map("n", "<C-j>", "<cmd>wincmd j<cr>",  { desc = "navigate down"  })
map("n", "<C-k>", "<cmd>wincmd k<cr>",    { desc = "navigate up"    })
map("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "navigate right or tab" })

local builtin = require('telescope.builtin')

map('n', '<leader> ', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
map('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope live grep defaulting to word under cursor' })

-- Blink cursor column/row to visually locate the cursor
local timer = vim.loop.new_timer()
local blink = function()
  local cnt, blink_times = 0, 6

  timer:start(0, 100, vim.schedule_wrap(function()
    vim.cmd('set cursorcolumn! cursorline!')

    cnt = cnt + 1
    if cnt == blink_times then timer:stop() end
  end))
end
map('n', '<leader>cb', blink)

-- map("n", "<C-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { desc = "navigate left or tab"  })
-- map("n", "<C-j>", "<cmd>ZellijNavigateDown<cr>",  { desc = "navigate down"  })
-- map("n", "<C-k>", "<cmd>ZellijNavigateUp<cr>",    { desc = "navigate up"    })
-- map("n", "<C-l>", "<cmd>ZellijNavigateRightTab<cr>", { desc = "navigate right or tab" })

-- vim.cmd('command⋅Green⋅call⋅CommitFileAndTestFile()')
-- vim.api.nvim_create_user_command('Green', 'CommitFileAndTestFile()', {})
-- vim.api.nvim_create_user_command('Green', function(opts) print("hello world") end, {})
