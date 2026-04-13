-- vue_ls.lua
-- Vue Language Server (vue_ls) + vtsls Hybrid Mode
--
-- vue_ls handles Vue templates, component diagnostics, and CSS/HTML sections.
-- It requires vtsls to be attached to the same buffer to forward TypeScript
-- requests via the hybrid mode bridge (configured in lsp/vtsls.lua).
--
-- MASON INSTALL NEEDED:
--   :MasonInstall vue-language-server
--
-- ============================================================================

-- ── Component highlight (vue_ls >= 3.0.2) ────────────────────────────────────
-- vue_ls emits @lsp.type.component tokens for Vue components in templates.
-- Link to @type to get visible highlights (adjust to taste / your colorscheme).
vim.api.nvim_set_hl(0, "@lsp.type.component", { link = "@type" })

-- Disable definition provider on vue_ls so only vtsls handles gd
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "vue_ls" then
      client.server_capabilities.definitionProvider = false
    end
  end,
})

return {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_markers = { "package.json" },
}
