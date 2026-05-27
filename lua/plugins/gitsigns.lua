return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- keymaps are set per-buffer via on_attach so they only bind in files
    -- that gitsigns is actually tracking (skips non-git buffers, terminals, etc.)
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- hunk navigation
      -- jump to next changed hunk in this buffer
      map("n", "]h", function()
        gs.nav_hunk("next")
      end, "Next Hunk")
      -- jump to previous changed hunk in this buffer
      map("n", "[h", function()
        gs.nav_hunk("prev")
      end, "Prev Hunk")

      -- previews (the "what was this line before?" answers)
      -- inline diff: old lines appear above the new lines, right in the buffer
      map("n", "<leader>hp", gs.preview_hunk_inline, "Preview Hunk (inline)")
      -- floating popup version of the same diff
      map("n", "<leader>hP", gs.preview_hunk, "Preview Hunk (popup)")
      -- toggle showing ALL deleted lines as virtual text, file-wide
      map("n", "<leader>hd", gs.toggle_deleted, "Toggle Deleted Lines")
      -- toggle word-level highlighting within changed lines
      map("n", "<leader>hw", gs.toggle_word_diff, "Toggle Word Diff")
      -- blame popup for the current line (commit, author, message)
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame Line")
      -- open a split showing this file's old (HEAD) version side-by-side
      map("n", "<leader>hD", gs.diffthis, "Diff Against HEAD")
    end,
  },
}
