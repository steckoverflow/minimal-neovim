return {
	"folke/snacks.nvim", -- GitHub repository
	priority = 1000, -- Load early (provides core UI functionality)
	lazy = false, -- Don't lazy-load (we want dashboard on startup)
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				header = [[
 █████                                          
░░███                                           
 ░███████   █████ ████  ███████  █████          
 ░███░░███ ░░███ ░███  ███░░███ ███░░           
 ░███ ░███  ░███ ░███ ░███ ░███░░█████          
 ░███ ░███  ░███ ░███ ░███ ░███ ░░░░███         
 ████ █████ ░░████████░░███████ ██████          
░░░░ ░░░░░   ░░░░░░░░  ░░░░░███░░░░░░           
                       ███ ░███                 
                      ░░██████                  
                       ░░░░░░                   
                      █████                     
                     ░░███                      
 ████████    ██████  ███████                    
░░███░░███  ███░░███░░░███░                     
 ░███ ░███ ░███ ░███  ░███                      
 ░███ ░███ ░███ ░███  ░███ ███                  
 ████ █████░░██████   ░░█████                   
░░░░ ░░░░░  ░░░░░░     ░░░░░                    
                                               
     █████                                      
    ░░███                                       
  ███████  ████████  █████ ████  ███████  █████ 
 ███░░███ ░░███░░███░░███ ░███  ███░░███ ███░░  
░███ ░███  ░███ ░░░  ░███ ░███ ░███ ░███░░█████ 
░███ ░███  ░███      ░███ ░███ ░███ ░███ ░░░░███
░░████████ █████     ░░████████░░███████ ██████ 
 ░░░░░░░░ ░░░░░       ░░░░░░░░  ░░░░░███░░░░░░  
                                ███ ░███        
                               ░░██████         
                                ░░░░░░          
]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = {
			enabled = true,
		},
		picker = {
			enabled = true,
			sources = {
				files = { hidden = true }, -- Include hidden files (dotfiles) in file search
				grep = { hidden = true }, -- Include hidden files in grep search
			},
			matcher = {
				frecency = true, -- Rank results by frequency + recency of access
			},
		},
		notifier = {
			enabled = true,
			timeout = 3000, -- Auto-dismiss after 3 seconds
		},
		lazygit = {
			enabled = true,
		},
		-- Show vertical lines at indentation levels
		indent = {
			enabled = true,
		},
		-- Better vim.ui.input() prompts (used by plugins for user input)
		input = {
			enabled = true,
		},
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" },
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		-- Highlight other occurrences of word under cursor
		words = {
			enabled = true,
		},
	},
	keys = {
		-- ─────────────────────────────
		-- Debug - nvim-dap
		-- ─────────────────────────────
		{
			"<leader>dr",
			function()
				require("dap").continue()
			end,
			desc = "Run/Continue",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Set Breakpoint w/condition",
		},
		{
			"<leader>dp",
			function()
				require("dap").pause()
			end,
			desc = "Pause",
		},
		{
			"<leader>dq",
			function()
				require("dap").terminate()
			end,
			desc = "[q]uit Debugging",
		},
		{
			"<leader>dR",
			function()
				require("dapui").toggle()
			end,
			desc = "DAP-UI Toggle",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "Eval",
		},

		-- ─────────────────────────────
		-- Pickers & explorer
		-- ─────────────────────────────
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>uN",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification Picker",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[f]ind [b]uffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[f]ind [c]onfig File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- grep / search
		{
			"<leader>fB",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		-- {
		-- 	"<leader>fgb",
		-- 	function()
		-- 		Snacks.picker.grep_buffers()
		-- 	end,
		-- 	desc = "Grep Open Buffers",
		-- },
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Word",
			mode = { "n", "x" },
		},

		-- git-related pickers
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
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
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
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
		-- misc search helpers
		{
			'<leader>s"',
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
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
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
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
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
			desc = "Search Plugin Spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Picker",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},

		-- ─────────────────────────────
		-- LSP navigation
		-- ─────────────────────────────
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
			desc = "Goto Type Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "Workspace Symbols",
		},

		-- ─────────────────────────────
		-- Misc / UI
		-- ─────────────────────────────
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss Notifications",
		},
		-- Neovim news window
		{
			"<leader>N",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
				})
			end,
			desc = "Neovim News",
		},

		-- ─────────────────────────────
		-- GitSigns
		-- ─────────────────────────────
		{
			"]c",
			function()
				require("gitsigns").nav_hunk("next")
			end,
			desc = "Next Git Hunk",
		},
		{
			"[c",
			function()
				require("gitsigns").nav_hunk("prev")
			end,
			desc = "Prev Git Hunk",
		},
		{
			"<leader>hs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Stage Hunk",
			mode = { "n", "v" },
		},
		{
			"<leader>hr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset Hunk",
			mode = { "n", "v" },
		},
		{
			"<leader>hS",
			function()
				require("gitsigns").stage_buffer()
			end,
			desc = "Stage Buffer",
		},
		{
			"<leader>hu",
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			desc = "Undo Stage Hunk",
		},
		{
			"<leader>hR",
			function()
				require("gitsigns").reset_buffer()
			end,
			desc = "Reset Buffer",
		},
		{
			"<leader>hp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview Hunk",
		},
		{
			"<leader>hb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Full Blame Line",
		},
		{
			"<leader>tb",
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			desc = "Toggle Line Blame",
		},
		{
			"<leader>hd",
			function()
				require("gitsigns").diffthis()
			end,
			desc = "Diff This",
		},
		{
			"<leader>hD",
			function()
				require("gitsigns").diffthis("~")
			end,
			desc = "Diff This ~",
		},
		{
			"<leader>td",
			function()
				require("gitsigns").toggle_deleted()
			end,
			desc = "Toggle Deleted",
		},
	},
}
