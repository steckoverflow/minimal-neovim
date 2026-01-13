return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = {
			auto_install = true,
			ensure_installed = {
				-- Primary development languages
				"python",
				"lua",
				"go",
				"gomod",
				"gosum",
				"typescript",
				"javascript",
				"tsx",
				"html",
				"css",
				"svelte",
				-- Commonly used formats
				"json",
				"yaml",
				"toml",
				"markdown",
				"markdown_inline",
				"bash",
				"vim",
				"vimdoc",
				"regex",
				"query",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)

			-- Enable treesitter-based highlighting
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	
}
