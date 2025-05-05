return {
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			require('mini.ai').setup() -- Extend and create a/i textobjects 
			require('mini.basics').setup() -- basic settings and features
			require('mini.bracketed').setup() -- Go forward/backward with square brackets
			require('mini.cursorword').setup() -- Autohighlight word under cursor 
			require('mini.files').setup() -- File manager
			require('mini.icons').setup() 
			require('mini.notify').setup() -- show notifications in a floating window
			require('mini.operators').setup() -- Text edit operators
			require('mini.pairs').setup() 
			require('mini.splitjoin').setup() -- Split and join arguments. Toggle with `gS`
			require('mini.statusline').setup() 
			require('mini.surround').setup() -- Surround actions
		end
	}
}
