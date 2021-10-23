local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = { "pyright", "bashls", "html", "cssls", "jdtls" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attch = attach,
      capabilities = capabilities,
      -- root_dir = vim.loop.cwd, 
      flags = {
            debounce_text_changes = 150,
         },
    }
  end

  -- typescript
  lspconfig.tsserver.setup {
    on_attach = attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")
  }

  -- lua
  local system_name
  if vim.fn.has("mac") == 1 then
    system_name = "macOS"
  elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
  elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
  else
    print("Unsupported system for sumneko")
  end

-- set the path to the sumneko installation
  local sumneko_root_path = os.getenv('HOME')..'/.lsps/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (mostl ikely LuaJIT in the case of NeoVim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
        -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
        -- Make the server aware of NeoVim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
      -- Do not send telemtry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

end
return M
