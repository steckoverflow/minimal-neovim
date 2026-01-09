return {
	"echasnovski/mini.pairs", -- Auto-insert matching brackets, quotes, etc.
	version = false, -- Use latest commit (mini.nvim convention)
	event = "InsertEnter", -- Load when entering insert mode
	opts = {
		-- Pairs that will be auto-closed
		-- Each pair: { open, close, options }
		modes = { insert = true, command = false, terminal = false },
		-- Skip autopair when next character is one of these
		skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
		-- Skip autopair when the cursor is inside these treesitter nodes
		skip_ts = { "string" },
		-- Skip autopair when next character is closing pair and there are more
		-- closing pairs than opening pairs
		skip_unbalanced = true,
		-- Better handling for markdown code blocks
		markdown = true,
	},
}
