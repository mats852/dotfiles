local nvim_lsp = require('lspconfig')
local remap = require("config.keymap")
local cmp = require("cmp")
local luasnip = require("luasnip")
local inoremap = remap.inoremap
local nnoremap = remap.nnoremap

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        return
      end
      fallback()
    end
    , { 'i', 'c' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
        return
      end
      fallback()
    end
    , { 'i', 'c' }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


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

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
  _config = _config or {}

  _setup = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
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
  'clangd',
  'erlangls',
  'html',
  'gopls',
  'intelephense',
  'java_language_server',
  'kotlin_language_server',
  'lua_ls',
  'rust_analyzer',
  'tsserver',
}

for _, server in ipairs(servers) do
  nvim_lsp[server].setup(config())
end
