local nvim_lsp = require('lspconfig')

local remap = require("config.keymap")
local nnoremap = remap.nnoremap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  nnoremap("gD", function()
      vim.lsp.buf.declaration()
  end)
  nnoremap("gd", function()
      vim.lsp.buf.definition()
  end)
  nnoremap("K", function()
      vim.lsp.buf.hover()
  end)
  nnoremap("gi", function()
      vim.lsp.buf.implementation()
  end)
  nnoremap("<C-k>", function()
      vim.lsp.buf.signature_help()
  end)
  nnoremap("<space>wa", function()
      vim.lsp.buf.add_workspace_folder()
  end)
  nnoremap("<space>wr", function()
      vim.lsp.buf.remove_workspace_folder()
  end)
  nnoremap("<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  nnoremap("<space>D", function()
      vim.lsp.buf.type_definition()
  end)
  nnoremap("<space>rn", function()
      vim.lsp.buf.rename()
  end)
  nnoremap("<space>ca", function()
      vim.lsp.buf.code_action()
  end)
  nnoremap("gr", function()
      vim.lsp.buf.references()
  end)
  nnoremap("<space>e", function()
      vim.lsp.diagnostic.show_line_diagnostics()
  end)
  nnoremap("[d", function()
      vim.lsp.diagnostic.goto_prev()
  end)
  nnoremap("]d", function()
      vim.lsp.diagnostic.goto_next()
  end)
  nnoremap("<space>q", function()
      vim.lsp.diagnostic.set_loclist()
  end)
  nnoremap("<space>f", function()
      vim.lsp.buf.formatting()
  end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local function config(_config)
  _config = _config or {}

  _setup = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  for k,v in pairs(_config) do _setup[k] = v end

  return _setup
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "html",
  "tsserver",
  "gopls",
  "intelephense",
  "erlangls",
  "kotlin_language_server",
  "java_language_server",
}

for _, server in ipairs(servers) do
  nvim_lsp[server].setup(config())
end

-- Custom configurations
