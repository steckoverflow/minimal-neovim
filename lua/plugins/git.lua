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
			add = { text = "│" }, -- New lines
			change = { text = "│" }, -- Modified lines
			delete = { text = "_" }, -- Deleted lines (shown at deletion point)
			topdelete = { text = "‾" }, -- Deleted lines at file top
			changedelete = { text = "~" }, -- Changed then deleted
			untracked = { text = "┆" }, -- New file not yet tracked by git
		},

		-- Signs for staged changes (shown differently than unstaged)
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},

		-- =========================================================================
		-- ON_ATTACH - Buffer-local Text Object
		-- =========================================================================
		-- Keymaps are defined in snacks.lua under <leader>h* prefix
		-- This on_attach only sets up the hunk text object
		on_attach = function(buffer)
			-- Select hunk as a text object (works with operators like d, y, c)
			-- Example: vih = select inner hunk, dih = delete inner hunk
			vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", {
				buffer = buffer,
				silent = true,
				desc = "Select Hunk",
			})
		end,
	},
}
