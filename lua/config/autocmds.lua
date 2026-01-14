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

