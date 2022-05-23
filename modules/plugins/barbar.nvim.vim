" Move to previous/next
nnoremap <silent>    <M-,> :BufferPrevious<CR>
nnoremap <silent>    <M-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <M-<> :BufferMovePrevious<CR>
nnoremap <silent>    <M->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <M-1> :BufferGoto 1<CR>
nnoremap <silent>    <M-2> :BufferGoto 2<CR>
nnoremap <silent>    <M-3> :BufferGoto 3<CR>
nnoremap <silent>    <M-4> :BufferGoto 4<CR>
nnoremap <silent>    <M-5> :BufferGoto 5<CR>
nnoremap <silent>    <M-6> :BufferGoto 6<CR>
nnoremap <silent>    <M-7> :BufferGoto 7<CR>
nnoremap <silent>    <M-8> :BufferGoto 8<CR>
nnoremap <silent>    <M-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <M-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <M-c> :BufferClose<CR>

lua << EOF
require"nvim-tree.events".on_tree_open(function ()
    require('bufferline.state').set_offset(31, "File Tree")
end)

require"nvim-tree.events".on_tree_close(function ()
    require('bufferline.state').set_offset(0)
end)
EOF

