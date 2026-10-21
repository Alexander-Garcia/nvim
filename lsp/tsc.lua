-- tsc.lua
-- TypeScript 7 native language server (`tsc --lsp`), formerly the `tsgo` preview.
--
-- Install with:
--   :MasonInstall tsc
--
-- cmd, filetypes and root_dir come from nvim-lspconfig's lsp/tsc.lua, which this
-- file is merged on top of. Its root_dir picks the first binary that supports
-- `--lsp` (TS >= 7) from node_modules/.bin/{tsc,tsgo} or $PATH, so projects still
-- pinned to TypeScript 5/6 fall back to the Mason-installed tsc.

---@type vim.lsp.Config
return {
  settings = {
    -- Upstream moved these from "typescript" to the "js/ts" key for TS 7.
    ["js/ts"] = {
      inlayHints = {
        parameterNames = {
          enabled = "literals",
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
}
