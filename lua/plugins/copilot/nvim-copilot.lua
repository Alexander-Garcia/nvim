return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  suggestion = { enabled = false },
  panel = { enabled = false },
  config = function()
    require("copilot").setup({})
  end,
}
