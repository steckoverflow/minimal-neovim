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
		vim.cmd("tabdo wincmd =")
		-- Return to the original tab
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- CLOSE HELPER WINDOWS WITH 'q'
-- =============================================================================
-- Allow pressing 'q' to close certain non-editing buffers.
-- This is more intuitive than :q or :close for help/info windows.
autocmd("FileType", {
	group = augroup("close_with_q", { clear = true }),
	pattern = {
		"help", -- Help documentation (:help)
		"lspinfo", -- LSP server info (:LspInfo)
		"notify", -- Notification popups
		"qf", -- Quickfix list (:copen)
		"checkhealth", -- Health check results (:checkhealth)
		"man", -- Man pages
	},
	callback = function(event)
		-- Don't show this buffer in buffer list
		vim.bo[event.buf].buflisted = false
		-- Map 'q' to close the window (buffer-local mapping)
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
