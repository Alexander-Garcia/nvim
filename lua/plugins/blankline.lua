  return { 
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local ibl = require("ibl")

      ibl.setup({
        scope = { enabled = false },
      })
    end,
  }
