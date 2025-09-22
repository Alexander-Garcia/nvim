return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    require("lint").linters.pylint.cmd = "python"
    require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }

    -- Helper to find nearest git root
    local function get_git_root()
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error == 0 then
        return git_root
      end
      return vim.fn.getcwd() -- fallback
    end

    -- Patch eslint_d to use git root as cwd
    local eslint_d = lint.linters.eslint_d
    eslint_d.cwd = function(_)
      return get_git_root()
    end

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
        -- use for debug: print("Linting triggered by autocmd for file: " .. vim.fn.expand("%"))
        lint.try_lint()
      end,
    })

    vim.api.nvim_create_user_command("LintInfo", function()
      local filetype = vim.bo.filetype
      local linters = require("lint").linters_by_ft[filetype]

      if linters then
        print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
      else
        print("No linters configured for filetype: " .. filetype)
      end
    end, {})

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Lint" })
  end,
}
