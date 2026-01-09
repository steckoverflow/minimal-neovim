-- =============================================================================
-- git.lua - Git Integration with gitsigns.nvim
-- =============================================================================
-- gitsigns shows git change indicators in the sign column (added, modified,
-- deleted lines) and provides hunk-based operations (stage, reset, preview).
-- For full git operations, we use Lazygit via snacks.nvim (<leader>gg).
-- https://github.com/lewis6991/gitsigns.nvim
-- =============================================================================

return {
  "lewis6991/gitsigns.nvim", -- GitHub repository
  event = { "BufReadPost", "BufNewFile" }, -- Load when opening files

  opts = {
    -- =========================================================================
    -- SIGN COLUMN INDICATORS
    -- =========================================================================
    -- Icons shown in the sign column for different change types
    signs = {
      add = { text = "▎" }, -- New lines (green by default)
      change = { text = "▎" }, -- Modified lines (yellow)
      delete = { text = "" }, -- Deleted lines (shown at deletion point)
      topdelete = { text = "" }, -- Deleted lines at file top
      changedelete = { text = "▎" }, -- Changed then deleted
      untracked = { text = "▎" }, -- New file not yet tracked by git
    },

    -- Signs for staged changes (shown differently than unstaged)
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },

    -- =========================================================================
    -- ON_ATTACH - Buffer-local Keymaps
    -- =========================================================================
    -- Called when gitsigns attaches to a buffer (i.e., file is in a git repo)
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns -- Get gitsigns module

      -- Helper to create buffer-local keymaps
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- -----------------------------------------------------------------------
      -- HUNK NAVIGATION
      -- -----------------------------------------------------------------------
      -- Navigate between changes (hunks) in the file
      map("n", "]h", function()
        -- In diff mode, use Vim's built-in ]c navigation
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next") -- Go to next hunk
        end
      end, "Next Hunk")

      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev") -- Go to previous hunk
        end
      end, "Prev Hunk")

      -- -----------------------------------------------------------------------
      -- STAGING & RESETTING
      -- -----------------------------------------------------------------------
      -- Stage hunk (add to git index) - works on current hunk
      map("n", "<leader>ghs", gs.stage_hunk, "Stage Hunk")
      -- Reset hunk (discard changes) - works on current hunk
      map("n", "<leader>ghr", gs.reset_hunk, "Reset Hunk")
      -- Visual mode: stage/reset selected lines (partial hunk staging)
      map("v", "<leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
      map("v", "<leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")
      -- Stage entire buffer (all changes in file)
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      -- Undo last hunk stage (unstage)
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      -- Reset entire buffer (discard all changes in file)
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")

      -- -----------------------------------------------------------------------
      -- PREVIEW & BLAME
      -- -----------------------------------------------------------------------
      -- Preview hunk changes inline (shows what changed)
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      -- Show git blame for current line (who changed it and when)
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      -- Show blame for entire buffer in a split
      map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")

      -- -----------------------------------------------------------------------
      -- DIFF
      -- -----------------------------------------------------------------------
      -- Show diff of current file against index (staged version)
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      -- Show diff against last commit (~)
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")

      -- -----------------------------------------------------------------------
      -- TEXT OBJECT
      -- -----------------------------------------------------------------------
      -- Select hunk as a text object (works with operators like d, y, c)
      -- Example: vih = select inner hunk, dih = delete inner hunk
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
  },
}

