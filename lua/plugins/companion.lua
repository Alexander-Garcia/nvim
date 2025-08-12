return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    "ravitemer/mcphub.nvim",
  },
  init = function()
    local progress = require("fidget.progress")

    -- Store active progress handles
    local handles = {}

    local function store_progress_handle(id, handle)
      handles[id] = handle
    end

    local function pop_progress_handle(id)
      local handle = handles[id]
      handles[id] = nil
      return handle
    end

    local function format_adapter(adapter)
      local parts = {}
      table.insert(parts, adapter.formatted_name)
      if adapter.model and adapter.model ~= "" then
        table.insert(parts, "(" .. adapter.model .. ")")
      end
      return table.concat(parts, " ")
    end

    local function create_progress_handle(request)
      return progress.handle.create({
        message = "  Sending...",
        lsp_client = {
          name = format_adapter(request.data.adapter),
        },
      })
    end

    local function report_exit_status(handle, request)
      if request.data.status == "success" then
        handle.message = "✔ Completed"
      elseif request.data.status == "error" then
        handle.message = " Error"
      else
        handle.message = "󰜺 Cancelled"
      end
    end

    local group = vim.api.nvim_create_augroup("codecompanion.spinner", {})

    -- When a CodeCompanion request starts
    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      group = group,
      callback = function(request)
        local handle = create_progress_handle(request)
        store_progress_handle(request.data.id, handle)
      end,
    })

    -- When a CodeCompanion request finishes
    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestFinished",
      group = group,
      callback = function(request)
        local handle = pop_progress_handle(request.data.id)
        if handle then
          report_exit_status(handle, request)
          handle:finish()
        end
      end,
    })
  end,
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      chat = {
        auto_scroll = true,
        window = {
          position = "right",
        },
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
  keys = {
    {
      "<leader>cp",
      "<cmd>CodeCompanionActions<CR>",
      desc = "Open action palette",
      mode = { "n", "v" },
    },
    {
      "<leader>ct",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle le chat buffer",
      mode = { "n", "v" },
    },
    {
      "<leader>cc",
      "<cmd>CodeCompanionChat<CR>",
      desc = "Open le chat buffer",
      mode = { "n", "v" },
    },
    {
      "<leader>ca",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "Add code to chat buffer",
      mode = { "v" },
    },
    {
      "<leader>ci",
      function()
        vim.ui.input({ prompt = "Prompt: " }, function(prompt)
          if prompt and prompt ~= "" then
            vim.cmd("'<,'>CodeCompanion " .. prompt)
          end
        end)
      end,
      desc = "Inline code edits",
      mode = { "v" },
    },
  },
}
