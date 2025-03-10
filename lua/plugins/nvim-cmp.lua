return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-cmdline", -- cmd line completions
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "zbirenbaum/copilot-cmp", -- copilot integration
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local mapTable = {
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(), -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }

    cmp.setup({
      enabled = function()
        -- Don't enable autocomplete inside of comments
        if
          require("cmp.config.context").in_treesitter_capture("comment") == true
          or require("cmp.config.context").in_syntax_group("Comment")
        then
          return false
        else
          return true
        end
      end,
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert(mapTable),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "copilot" }, -- integrate copilot into cmp
        { name = "nvim_lsp" }, -- lsp stuff first
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline({ ":" }, {
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
