vim.pack.add { { src = 'https://github.com/lervag/vimtex', name = 'vimtex' } }

vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-xelatex' }
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
  out_dir = './.latexmk/out',
}

vim.keymap.set('n', '<localleader>l', function() vim.fn['vimtex#context#menu']() end, { desc = '+vimtex' })
