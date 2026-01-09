local opt = vim.opt

-- Critical
opt.number = true -- absolute numbers
opt.wrap = false
opt.clipboard = "unnamedplus"
opt.mouse = "a" -- Enable mouse support in all modes
-- a = all modes (normal, visual, insert, command-line)
-- Useful for scrolling, selecting, and resizing splits

-- Tabs
opt.tabstop = 2 -- Number of spaces a <Tab> character displays as
opt.shiftwidth = 2 -- Number of spaces for auto-indent (>>, <<, ==)
opt.softtabstop = 2 -- Number of spaces <Tab> inserts in insert mode
opt.expandtab = true -- Convert tabs to spaces when typing
opt.smartindent = true -- Auto-indent new lines based on syntax (e.g., after {)

-- Search
opt.ignorecase = true -- Ignore case when searching (e.g., /foo matches FOO)
opt.smartcase = true -- Override ignorecase if search contains uppercase
opt.hlsearch = true -- Highlight all matches of the search pattern
opt.incsearch = true -- Show matches incrementally as you type the pattern

-- Appearance
opt.laststatus = 0 -- Disable statusline (0 = never show)
opt.termguicolors = true -- Enable 24-bit RGB colors (required for modern themes)
opt.signcolumn = "yes" -- Always show sign column (prevents text shifting)
opt.cursorline = true -- Highlight the line containing the cursor
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor when scrolling
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor

-- Splits
opt.splitright = true -- Open vertical splits to the right of current window
opt.splitbelow = true -- Open horizontal splits below current window

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace over everything in insert mode
-- indent: backspace over auto-indent
-- eol: backspace over line breaks (join lines)
-- start: backspace over start of insert

-- Undofile and backup
opt.undofile = true -- Persist undo history to disk (survives closing file)
-- Undo files are stored in ~/.local/state/nvim/undo/
opt.swapfile = false -- Don't create swap files (we have undo history)
opt.backup = false -- Don't create backup files before saving

-- Timing
opt.updatetime = 250 -- Milliseconds of idle time before CursorHold event fires
-- Lower value means faster response for things like hover documentation
opt.timeoutlen = 300 -- Milliseconds to wait for mapped key sequence to complete
-- Affects which-key popup delay

-- Completion
opt.completeopt = "menu,menuone,noselect" -- Completion menu behavior
-- menu: show popup menu even for one match
-- menuone: show menu even with only one match
-- noselect: don't auto-select first item (user must choose)

-- Visual
opt.conceallevel = 2 -- Hide markup characters in markdown/latex
-- 0: show all, 1: conceal with replacement char, 2: hide completely

-- Show invisible characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Window title
opt.title = true -- Show file info in terminal/window title
opt.titlestring = "%t%m - NVIM" -- %t = filename, %m = modified flag [+]
