return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local project = require("core.project")

    lint.linters.pylint.cmd = "python"
    lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local ft = vim.bo[bufnr].filetype
        if project.js_filetypes[ft] and project.has_biome_config(bufnr) then
          return
        end
        lint.try_lint()
      end,
    })

    vim.api.nvim_create_user_command("LintInfo", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local ft = vim.bo[bufnr].filetype
      if project.js_filetypes[ft] and project.has_biome_config(bufnr) then
        print("Linters for " .. ft .. ": biome (via LSP, nvim-lint skipped)")
      else
        local linters = lint.linters_by_ft[ft]
        if linters then
          print("Linters for " .. ft .. ": " .. table.concat(linters, ", "))
        else
          print("No linters configured for filetype: " .. ft)
        end
      end
    end, {})

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Lint" })
  end,
}
