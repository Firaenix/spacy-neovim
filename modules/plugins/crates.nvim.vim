lua <<EOF
require('crates').setup({
    popup = {
        autofocus = true,
        show_version_date = true
    },
    src = {
        coq = {
            enabled = true,
            name = "crates.nvim",
        },
    },
})
EOF

nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
