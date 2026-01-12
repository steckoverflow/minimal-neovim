local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- HIGHLIGHT ON YANK
autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }), -- Clear group on re-source
	callback = function()
		-- Use IncSearch highlight group, flash for 200ms
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- AUTO-RESIZE SPLITS
autocmd("VimResized", {
	group = augroup("resize_splits", { clear = true }),
	callback = function()
		-- Remember current tab to return to it
		local current_tab = vim.fn.tabpagenr()
		-- Equalize splits in all tabs
		-- Map 'q' to close the window (buffer-local mapping)
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
