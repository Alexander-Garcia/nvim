---@module 'snacks'
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          pattern = "!node_modules !dist ",
          hidden = true,
          ignored = true,
        },
        grep = {
          hidden = true,
          ignored = false,
          args = {
            "--glob",
            "!*-lock.json",
          },
        },
      },
    },
  },
  keys = {
    -- ============================================================
    -- Find (<leader>f) — pickers that locate a thing
    -- ============================================================

    -- find files by name in the project
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    -- grep across the project (live ripgrep)
    {
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    -- grep the word under cursor (normal) or visual selection (visual)
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep word/selection",
      mode = { "n", "x" },
    },
    -- open buffers (files currently loaded in this nvim session)
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    -- recently opened files (across sessions, from shada/oldfiles)
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent Files",
    },
    -- git-changed files in working tree (was <leader>gs)
    {
      "<leader>fc",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Changed Files",
    },
    -- fuzzy-find a line in the current buffer
    {
      "<leader>fl",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    -- grep across all currently-open buffers
    {
      "<leader>fL",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    -- LSP symbols in the current file (functions, classes, etc.)
    {
      "<leader>fs",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    -- LSP symbols across the whole workspace
    {
      "<leader>fS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    -- list all keymaps (built-in and your own)
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    -- search nvim's :help docs
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    -- jump to a saved mark (positions you've bookmarked with mX)
    {
      "<leader>fm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    -- the jumplist: every cursor jump you've made (Ctrl-o / Ctrl-i history)
    {
      "<leader>fj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    -- all diagnostics (LSP errors/warnings) in the workspace
    {
      "<leader>fd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    -- diagnostics for just the current buffer
    {
      "<leader>fD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    -- browse the quickfix list (a list of locations gathered from grep/LSP/etc.)
    {
      "<leader>fq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    -- undo history as a picker (preview + restore any past state)
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    -- reopen the last picker right where you left it
    {
      "<leader>f.",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume Last Picker",
    },
    -- notification history
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },

    -- ============================================================
    -- Git (<leader>g)
    -- ============================================================

    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },

    -- ============================================================
    -- Search (<leader>s) — discovery / introspection
    -- ============================================================

    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },

    -- ============================================================
    -- LSP (g…)
    -- ============================================================

    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
  },
}
