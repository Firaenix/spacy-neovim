lua << EOF 
  vim.ui.select = require"popui.ui-overrider"
  vim.ui.input = require"popui.input-overrider"
EOF 

nnoremap ,d :lua require'popui.diagnostics-navigator'()<CR>
