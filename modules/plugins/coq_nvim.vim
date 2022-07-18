lua <<EOF
vim.g.coq_settings = {
    auto_start = "shut-up",
    ["keymap.pre_select"] = false,
    ["completion.always"] = true,
    ["completion.smart"] = true,
    display = {
        preview = {
            border = "rounded"
        }
    }
}
EOF
