local nvim_lsp = require('lspconfig')
local remap = require("config.keymap")
local cmp = require("cmp")
local luasnip = require("luasnip")
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
  if client.server_capabilities.documentFormattingProvider then
    -- client.server_capabilities.documentFormattingProvider = false

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })

        -- if vim.bo.filetype == 'go' then
        --   vim.cmd('silent! %!goimports')
        -- end
      end
    })
  end

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

  local setup = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  }

  for k, v in pairs(_config) do
    setup[k] = v
  end

  return setup
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  clangd = {},
  elixirls = {
    cmd = { '/opt/elixir-ls/v0.23.0/language_server.sh' }
  },
  erlangls = {},
  eslint = {},
  gopls = {
    settings = {
      gopls = {
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        gofumpt = true,
      }
    }
  },
  -- html = {},
  intelephense = {},
  java_language_server = {},
  kotlin_language_server = {},
  lua_ls = {},
  ocamllsp = {},
  rust_analyzer = {},
  -- sourcekit = {
  --   on_attach = function(client, bufnr)
  --     on_attach(client, bufnr)
  --     -- Use swift format on save
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = vim.api.nvim_create_augroup("SwiftFormat", { clear = true }),
  --       buffer = bufnr,
  --       callback = function()
  --         bufnr = bufnr or vim.api.nvim_get_current_buf()
  --         local filepath = vim.api.nvim_buf_get_name(bufnr)
  --         local content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")

  --         -- Run swift format command
  --         local output = vim.fn.system("swift format --assume-filename " .. filepath, content)
  --         if vim.v.shell_error == 0 then
  --           local formatted = vim.split(output, "\n")
  --           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted)
  --         else
  --           vim.notify("Swift Format Error: " .. output, vim.log.levels.ERROR)
  --         end
  --       end
  --     })
  --   end
  -- },
  templ = {},
  terraformls = {},
  ts_ls = {},
  volar = {},
  zls = {},
}

for server, cfg in pairs(servers) do
  nvim_lsp[server].setup(config(cfg))
end

-- Templ files are not supported out of the box it seems
vim.filetype.add({ extension = { templ = "templ" } })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
