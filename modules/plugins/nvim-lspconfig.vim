lua <<EOF
local lsp = require "lspconfig"
local coq = require "coq"

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())
lsp.tsserver.setup(coq.lsp_ensure_capabilities())
lsp.gopls.setup(coq.lsp_ensure_capabilities())
EOF

lua <<EOF
require"typescript".setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    disable_formatting = false, -- disable tsserver's formatting capabilities
    debug = false, -- enable debug logging for commands
})
EOF
