-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "denols","tsserver" , "gopls"}
local util = require "lspconfig/util"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end


-- deno
lspconfig["denols"].setup({
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  init_options = {
    lint = false,
    unstable = false,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.nest.land"] = true,
          ["https://crux.land"] = true,
          ["https://jsr.io/"] = true,
        },
      },
    },
  },

  on_attach = on_attach,
})


-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

--astro
lspconfig["astro"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {"astro"},
})

---phpactor
lspconfig.phpactor.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

--svelte
lspconfig["svelte"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
  filetypes = {"svelte"}
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.gopls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

