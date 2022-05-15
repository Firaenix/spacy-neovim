lua << EOF
require"nvim-tree.events".on_tree_open(function ()
    require('bufferline.state').set_offset(31, "File Tree")
end)

require"nvim-tree.events".on_tree_close(function ()
    require('bufferline.state').set_offset(0)
end)
EOF

