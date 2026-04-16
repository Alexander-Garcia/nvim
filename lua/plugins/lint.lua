return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    require("lint").linters.pylint.cmd = "python"
    require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }

    local function has_biome_config(bufnr)
      return vim.fs.find({ "biome.json", "biome.jsonc" }, {
        upward = true,
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
      })[1] ~= nil
    end

    -- Base linters — eslint_d is the default for JS/TS
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

        -- In Biome projects, skip eslint_d — Biome LSP handles linting
        local js_filetypes = {
          javascript = true,
          typescript = true,
          javascriptreact = true,
          typescriptreact = true,
          vue = true,
        }
        if js_filetypes[ft] and has_biome_config(bufnr) then
          return
        end

        lint.try_lint()
      end,
    })

    vim.api.nvim_create_user_command("LintInfo", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local filetype = vim.bo.filetype
      local linters = require("lint").linters_by_ft[filetype]
      local biome = has_biome_config(bufnr)

      if biome then
        print("Linters for " .. filetype .. ": biome (via LSP, nvim-lint skipped)")
      elseif linters then
        print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
      else
        print("No linters configured for filetype: " .. filetype)
      end
    end, {})

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Lint" })
  end,
}
