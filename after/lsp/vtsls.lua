-- vtsls.lua
-- Overrides merged on top of nvim-lspconfig's lsp/vtsls.lua (cmd, root_dir).
-- vtsls is ONLY used for Vue files (hybrid mode with vue_ls).
-- For JS/TS/React, tsc (TypeScript 7 native LSP) handles everything.
--
-- MASON INSTALL NEEDED:
--   :MasonInstall vtsls

local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

---@type vim.lsp.Config
return {
  filetypes = { "vue" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  },
  on_attach = function(client)
    -- Disable vtsls semantic tokens for .vue files so vue_ls owns them exclusively.
    -- This prevents duplicate or conflicting component highlights.
    if client.server_capabilities.semanticTokensProvider then
      client.server_capabilities.semanticTokensProvider.full = false
    end
  end,
}
