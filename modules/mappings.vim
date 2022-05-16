nnoremap <space> <nop>
let mapleader = ","
"let maplocalleader = ","

nnoremap <leader>wm :tab sp<CR>
nnoremap <leader>bD :bdelete!<CR>
nnoremap <leader>wo :only<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>bo :call <SID>delete_hidden_buffers()<CR>
nnoremap <leader>zz :call <SID>correct_to_first_spelling_suggestion()<CR>
nnoremap <leader>tw :call <SID>trim_trailing_whitespace()<CR>
tnoremap jk <c-\><c-n>
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>

function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

function! s:correct_to_first_spelling_suggestion()
  normal! 1z=
endfunction

function! s:trim_trailing_whitespace()
  %s/\s\+$//e
endfunction

" Use Alt+Arrow keys to navigate windows.
nnoremap <M-Up>        <C-W>k
nnoremap <M-Down>      <C-W>j
nnoremap <M-Left>      <C-W>h
nnoremap <M-Right>     <C-W>l

" Use Shift+Arrow keys to move around windows
nnoremap <S-Up>      <C-W>K
nnoremap <S-Down>    <C-W>J
nnoremap <S-Left>    <C-W>H
nnoremap <S-Right>   <C-W>L

" Copy to clipboard
vmap <C-c> :w !pbcopy<CR><CR>

nnoremap <leader>, :lua vim.lsp.buf.code_action()<CR>
