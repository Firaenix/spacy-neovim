lua require('telescope').load_extension('fzf')

" Find files using Telescope command-line sugar.
nnoremap <leader>fs <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

