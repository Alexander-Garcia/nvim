-- Overrides merged on top of nvim-lspconfig's lsp/biome.lua.
-- Narrower than upstream: no astro, html or svelte.
---@type vim.lsp.Config
return {
  filetypes = {
    "css",
    "graphql",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescriptreact",
    "vue",
  },
}
