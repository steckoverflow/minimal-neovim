local map = vim.keymap.set

-- Misc
map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- BUFFER NAVIGATION
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>q", "<C-w>q", { desc = "Close window" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Split window keymaps
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", ":split<CR>", { desc = "Horizontal split" })

-- SAVE, WRITE, CLOSE
map("n", "<leader>w", function()
	if vim.api.nvim_buf_get_name(0) == "" then
		vim.ui.input({
			prompt = "Enter file name: ",
		}, function(name)
			if name and name ~= "" then
				vim.cmd("write " .. vim.fn.fnameescape(name))
			end
		end)
	else
		vim.cmd.write()
	end
end, { desc = "Save Buffer" })

-- This is supposed to save and exit Neovim
map("n", "<leader>x", function()
	-- Close all terminal buffers first
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
	vim.cmd("wqa")
end, { desc = "Kill terminals and exit" })

-- map("n", "<leader>q", function()
-- 	Snacks.bufdelete(0)
-- end, { desc = "Close Buffer" })

-- SEARCH
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- VISUAL MODE INDENTING
-- =============================================================================
-- When indenting in visual mode, stay in visual mode (don't exit)
-- Default behavior exits visual mode after < or >, which is annoying
map("v", "<", "<gv") -- Indent left and reselect
map("v", ">", ">gv") -- Indent right and reselect

-- LINE MOVEMENT
-- =============================================================================
-- Move current line or selection up/down using Alt + j/k
-- == re-indents the line after moving to match surrounding context
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
-- In visual mode, use :m command with marks to move selection
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- PASTE IMPROVEMENT
-- =============================================================================
-- When pasting over a selection, don't yank the replaced text
-- "_d deletes to the black hole register (discards text)
-- P pastes before cursor
map("v", "p", '"_dP')

-- SCROLLING
-- =============================================================================
-- Keep cursor centered when scrolling half-pages and searching
-- zz centers the cursor line on screen
map("n", "<C-d>", "<C-d>zz") -- Scroll down half page, center cursor
map("n", "<C-u>", "<C-u>zz") -- Scroll up half page, center cursor
map("n", "n", "nzzzv") -- Next search result, center cursor, open folds
map("n", "N", "Nzzzv") -- Previous search result, center cursor, open folds
