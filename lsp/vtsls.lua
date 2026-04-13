-- vtsls.lua
-- vtsls is ONLY used for Vue files (hybrid mode with vue_ls).
-- For JS/TS/React, tsgo handles everything.
--
-- MASON INSTALL NEEDED:
--   :MasonInstall vtsls

local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

return {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "vue" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
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
