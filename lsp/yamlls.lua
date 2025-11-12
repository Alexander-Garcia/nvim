return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    yaml = {
      format = {
        enable = false,
      },
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
      },
    },
  },
}

