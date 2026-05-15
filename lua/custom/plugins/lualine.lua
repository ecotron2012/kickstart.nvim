local function gh(repo) return 'https://github.com/' .. repo end

local dependencies = {gh 'nvim-tree/nvim-web-devicons',}
vim.pack.add(dependencies)

vim.pack.add{gh 'nvim-lualine/lualine.nvim'}

require('lualine').setup {
  options = { theme = 'jellybeans', globalstatus = true, disabled_filetypes = { 'NvimTree' } },
}
