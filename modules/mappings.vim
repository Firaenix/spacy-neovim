nnoremap <space> <nop>
let mapleader = ","

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

" Language Server stuff (Intellisense, etc)
vnoremap <silent> <leader>, :<c-u>lua vim.lsp.buf.range_code_action()<cr>
nnoremap <leader>, :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>i :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>? :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>p :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>DD :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>dd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>F :lua vim.lsp.buf.formatting_sync()<CR>

" Use Alt+Up/Down in Visual mode to move highlighted text
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Save and Load Sessions
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" Close tab buffer
nnoremap <silent> <C-w> <Cmd>BufferClose<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>

noremap <silent> <leader>** :DashWord<CR>
" Dont filter by file type
noremap <silent> <leader>!** :DashWord!<CR>
noremap <silent> <leader>* :Dash<CR>
" Dont filter by file type
noremap <silent> <leader>!* :Dash!<CR>

" Terminal setup
" Open a new terminal
nnoremap <silent> <leader>t :10sp term://zsh<CR>
" auto start in terminal mode
autocmd TermOpen * startinsert
" exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Navigate windows in Terminal mode
tnoremap <S-Up>      <C-W>K
tnoremap <S-Down>    <C-W>J
tnoremap <S-Left>    <C-W>H
tnoremap <S-Right>   <C-W>L
