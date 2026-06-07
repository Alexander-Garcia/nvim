return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- @type snacks.Config
  opts = {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<C-/>",
      function()
        Snacks.terminal.toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle terminal",
    },
    -- Many terminals send <C-_> for Ctrl-/; map it to the same toggle.
    {
      "<C-_>",
      function()
        Snacks.terminal.toggle()
      end,
      mode = { "n", "t" },
      desc = "which_key_ignore",
    },
  },
}
