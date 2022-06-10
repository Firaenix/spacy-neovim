:lua require("toggleterm").setup{}

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

nnoremap <silent><leader>t <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><leader>t <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
