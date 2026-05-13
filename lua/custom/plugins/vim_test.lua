return {'vim-test/vim-test',
config = function()
	local g = vim.g
		
	g["test#strategy"] = "dispatch"
end
}

