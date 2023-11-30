local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}
lspconfig.lua_ls.setup{}
lspconfig.pyright.setup {on_attach = on_attach,settings = {pyright = {autoImportCompletion = true,},python = {analysis = {autoSearchPaths = true,diagnosticMode = 'openFilesOnly',useLibraryCodeForTypes = true,typeCheckingMode = 'off'}}}}
