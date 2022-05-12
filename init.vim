function! Dot(path)
  return "~/.config/nvim/" . a:path
endfunction

for file in split(glob(Dot("modules/*.vim")), "\n")
  execute "source" file
endfor

if filereadable("~/.nvim.local.vim")
  source ~/.nvim.local.vim
endif

nmap <C-t> :NERDTreeToggle<CR>

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
