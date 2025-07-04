return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup { options = { theme = 'jellybeans', globalstatus = true, disabled_filetypes = { 'NvimTree' } } }
  end,
}
