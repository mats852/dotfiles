local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  Nnoremap('gD', ':lua vim.lsp.buf.declaration()<CR>')
  Nnoremap('gd', ':lua vim.lsp.buf.definition()<CR>')
  Nnoremap('K', ':lua vim.lsp.buf.hover()<CR>')
  Nnoremap('gi', ':lua vim.lsp.buf.implementation()<CR>')
  Nnoremap('<C-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  Nnoremap('<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>')
  Nnoremap('<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>')
  Nnoremap('<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  Nnoremap('<space>D', ':lua vim.lsp.buf.type_definition()<CR>')
  Nnoremap('<space>rn', ':lua vim.lsp.buf.rename()<CR>')
  Nnoremap('<space>ca', ':lua vim.lsp.buf.code_action()<CR>')
  Nnoremap('gr', ':lua vim.lsp.buf.references()<CR>')
  Nnoremap('<space>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  Nnoremap('[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
  Nnoremap(']d', ':lua vim.lsp.diagnostic.goto_next()<CR>')
  Nnoremap('<space>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>')
  Nnoremap("<space>f", ":lua vim.lsp.buf.formatting()<CR>")
end

local function config(_config)
  _config = _config or {}

  _setup = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

  for k,v in pairs(_config) do _setup[k] = v end

  return _setup
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "html", "tsserver", "gopls", "intelephense", "erlangls", "kotlin_language_server" }
for _, server in ipairs(servers) do
  nvim_lsp[server].setup(config())
end

-- Custom configurations
nvim_lsp["elixirls"].setup(config({
  cmd = { "/opt/elixir-ls/language_server.sh" }
}))
