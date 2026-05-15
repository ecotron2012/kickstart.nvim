vim.pack.add { 'https://github.com/xiyaowong/transparent.nvim' }

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	callback = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
})

require('transparent').setup {
	groups = {
		'Normal',
		'NormalNC',
		'Comment',
		'Constant',
		'Special',
		'Identifier',
		'Statement',
		'PreProc',
		'Type',
		'Underlined',
		'Todo',
		'String',
		'Function',
		'Conditional',
		'Repeat',
		'Operator',
		'Structure',
		'LineNr',
		'NonText',
		'SignColumn',
		'CursorLine',
		'CursorLineNr',
		'StatusLine',
		'StatusLineNC',
		'EndOfBuffer',
	},
	-- table: additional groups that should be cleared
	extra_groups = {},
	-- table: groups you don't want to clear
	exclude_groups = {},
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
}
