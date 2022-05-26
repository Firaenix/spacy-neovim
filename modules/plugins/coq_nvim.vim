lua <<EOF
vim.g.coq_settings = {
    auto_start = "shut-up",
    ["keymap.pre_select"] = false,
    ["completion.always"] = false,
    ["completion.smart"] = false
}
EOF
