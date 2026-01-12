# Neovim Configuration

A modern, feature-rich Neovim configuration focused on productivity and a clean developer experience.

## Features

- **Modern Plugin Management** - Lazy-loaded plugins via [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP Support** - Full language server support for Lua, TypeScript/JavaScript, Go, Python, HTML, CSS, and Svelte
- **Autocompletion** - Fast completions with [blink.cmp](https://github.com/saghen/blink.cmp)
- **Debugging** - Integrated debugging via DAP for Python, Go, JavaScript/TypeScript, and Lua
- **Fuzzy Finding** - Powerful file/grep/symbol search with [snacks.nvim](https://github.com/folke/snacks.nvim) picker
- **Git Integration** - Lazygit integration, gitsigns for hunks, blame, and diff
- **Beautiful UI** - Tokyo Night theme, animated cursor, indent guides, and modern statusline
- **Format on Save** - Automatic formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)

## Requirements

- Neovim >= 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for live grep)
- Node.js (for JS/TS debugging and LSP)
- Language-specific tools installed via Mason

## Installation

### Backup existing config (if any)

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

### Clone this configuration

```bash
git clone <repo-url> ~/.config/nvim
```

### Start Neovim

```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch. Mason will install LSP servers, formatters, and debuggers.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point (sets leader key, loads config)
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Auto-commands (yank highlight, resize splits)
│   │   ├── keymaps.lua      # Global keymaps
│   │   ├── lazy.lua         # Lazy.nvim bootstrap and setup
│   │   └── options.lua      # Vim options (tabs, search, appearance)
│   └── plugins/
│       ├── blink.lua        # Autocompletion
│       ├── conform.lua      # Formatting
│       ├── dap.lua          # Debugging
│       ├── git.lua          # Gitsigns
│       ├── lsp.lua          # LSP configuration
│       ├── mini-pairs.lua   # Auto-pairs
│       ├── mini-statusline.lua # Statusline
│       ├── smear-cursor.lua # Cursor animation
│       ├── snacks.lua       # Dashboard, picker, explorer, notifications
│       ├── todo-comments.lua # TODO highlighting
│       ├── tokyonight.lua   # Colorscheme
│       ├── treesitter.lua   # Syntax highlighting
│       └── which-key.lua    # Keymap hints
├── DEPENDENCIES.md          # Full plugin list
└── KEYMAPS.md               # Complete keymap reference
```

## Key Mappings

Leader key: `<Space>`

### Quick Reference

| Keymap | Description |
|--------|-------------|
| `<leader><space>` | Smart find files |
| `<leader>e` | File explorer |
| `<leader>/` | Live grep |
| `<leader>ff` | Find files |
| `<leader>gg` | Lazygit |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `gd` | Go to definition |
| `K` | Hover documentation |

### Keymap Groups

Press `<leader>` and wait for which-key popup to see available commands:

| Prefix | Group |
|--------|-------|
| `<leader>b` | Buffer |
| `<leader>c` | Code |
| `<leader>d` | Debug |
| `<leader>f` | Find |
| `<leader>g` | Git |
| `<leader>h` | Git Hunk |
| `<leader>s` | Search |
| `<leader>t` | Toggle |
| `<leader>u` | UI |

See [KEYMAPS.md](KEYMAPS.md) for the complete keymap reference.

## Language Support

| Language | LSP | Formatter | Debugger |
|----------|-----|-----------|----------|
| Lua | lua_ls | stylua | osv |
| TypeScript/JavaScript | vtsls | prettierd | vscode-js-debug |
| Go | gopls | gofumpt | delve |
| Python | ruff, ty | ruff | debugpy |
| HTML | html-lsp | prettierd | - |
| CSS/SCSS/Less | css-lsp | prettierd | - |
| Svelte | svelte-language-server | prettierd | - |

## Plugins

This configuration includes **27 plugins**. See [DEPENDENCIES.md](DEPENDENCIES.md) for the complete list organized by category.

### Highlights

- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Dashboard, file explorer, fuzzy picker, notifications, lazygit, indent guides
- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Fast autocompletion with LSP, snippets, and path sources
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** - Debug Adapter Protocol with language-specific extensions
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Format on save with fallback formatters
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations and hunk operations

## Customization

### Adding a new plugin

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/my-plugin.nvim",
  event = "VeryLazy",  -- or other lazy-loading event
  opts = {
    -- plugin options
  },
}
```

### Adding keymaps

Add to `lua/config/keymaps.lua` or include in plugin spec:

```lua
vim.keymap.set("n", "<leader>xx", function()
  -- your action
end, { desc = "Description" })
```

### Changing options

Edit `lua/config/options.lua` for Vim options.

## Credits

Built with plugins from the Neovim ecosystem. Special thanks to:
- [folke](https://github.com/folke) for lazy.nvim, snacks.nvim, tokyonight, which-key, and todo-comments
- [saghen](https://github.com/saghen) for blink.cmp
- [echasnovski](https://github.com/echasnovski) for mini.nvim modules
