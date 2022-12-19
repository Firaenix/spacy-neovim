lua <<EOF
local lsp = require "lspconfig"
local coq = require "coq"
local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}))

lsp.denols.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
}))

lsp.tsserver.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
  root_dir = lsp.util.root_pattern("package.json", "yarn.lock"),
}))

lsp.svelte.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}))

lsp.tailwindcss.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
  root_dir = lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
}))

lsp.emmet_ls.setup(coq.lsp_ensure_capabilities({
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
}))
--

lsp.gopls.setup(coq.lsp_ensure_capabilities({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}))

lsp.terraformls.setup(coq.lsp_ensure_capabilities({}))
EOF

autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()



lua << EOF
local border_vertical   = "║"
local border_horizontal = "═"
local border_topleft    = "╔"
local border_topright   = "╗"
local border_botleft    = "╚"
local border_botright   = "╝"
local border_juncleft   = "╠"
local border_juncright  = "╣"

local if_nil = vim.F.if_nil

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  }
})

vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
]]

vim.lsp.diagnostic.show_line_diagnostics = function(opts, bufnr, line_nr, client_id)
    opts = opts or {}
    opts.severity_sort = if_nil(opts.severity_sort, true)

    local show_header = if_nil(opts.show_header, true)

    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

    local lines = {}
    local highlights = {}
    if show_header then
        table.insert(lines, "Diagnostics:")
        table.insert(highlights, {0, "Bold"})
    end

    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
    if vim.tbl_isempty(line_diagnostics) then return end

    for i, diagnostic in ipairs(line_diagnostics) do
        local prefix = string.format("%d. ", i)
        local hiname = vim.lsp.diagnostic._get_floating_severity_highlight_name(diagnostic.severity)
        assert(hiname, 'unknown severity: ' .. tostring(diagnostic.severity))

        local message_lines = vim.split(diagnostic.message, '\n', true)

        local columns = api.nvim_get_option('columns')
        local popup_max_width = math.floor(columns - (columns * 2 / 10))
        local stripped_max_width = {}

        for _, line in ipairs(message_lines) do
            local len = line:len()

            if len > popup_max_width then
                for j=1,math.ceil(len / popup_max_width) do
                    table.insert(stripped_max_width, string.sub(line, 1 + ((j-1) * popup_max_width), (j * popup_max_width)))
                end
            else
                table.insert(stripped_max_width, line)
            end
        end

        message_lines = stripped_max_width

        table.insert(lines, prefix..message_lines[1])
        table.insert(highlights, {#prefix + 1, hiname})
        for j = 2, #message_lines do
            table.insert(lines, message_lines[j])
            table.insert(highlights, {2, hiname})
        end
    end

    local max_length = 0

    for _, line in ipairs(lines) do
        local len = line:len()
        if len > max_length then
            max_length = len
        end
    end

    for i, line in ipairs(lines) do
        local len = line:len()
        lines[i] = string.format('%s%s%s%s', border_vertical, line, string.rep(" ", max_length - len), border_vertical)
    end

    table.insert(lines, 1, border_topleft..string.rep(border_horizontal, max_length)..border_topright)
    table.insert(lines, border_botleft..string.rep(border_horizontal, max_length)..border_botright)

    local popup_bufnr, winnr = vim.lsp.util.open_floating_preview(lines, 'plaintext')
    for i, hi in ipairs(highlights) do
        local prefixlen, hiname = unpack(hi)
        -- Start highlight after the prefix
        api.nvim_buf_add_highlight(popup_bufnr, -1, hiname, i, prefixlen+2, max_length + 4)
    end

    return popup_bufnr, winnr
end
EOF
