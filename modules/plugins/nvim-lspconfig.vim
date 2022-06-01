lua <<EOF
local lsp = require "lspconfig"
local coq = require "coq"
local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}))
lsp.tsserver.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}))
lsp.gopls.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}))

lsp.terraformls.setup(coq.lsp_ensure_capabilities({}))
EOF

lua <<EOF
require"typescript".setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    disable_formatting = false, -- disable tsserver's formatting capabilities
    debug = false, -- enable debug logging for commands
})
EOF

autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
