# Neovim Configuration Dependencies

This document lists all plugins used in this Neovim configuration, their purposes, and categories.

## Plugin Manager

| Plugin | Repository | Purpose |
|--------|------------|---------|
| lazy.nvim | `folke/lazy.nvim` | Modern plugin manager for Neovim with lazy-loading support |

## Core UI & Experience

| Plugin | Repository | Purpose |
|--------|------------|---------|
| snacks.nvim | `folke/snacks.nvim` | All-in-one utility plugin providing dashboard, file explorer, picker (fuzzy finder), notifications, lazygit integration, indent guides, statusline, and more |
| tokyonight.nvim | `folke/tokyonight.nvim` | Color scheme with multiple style variants (night, storm, day, moon) |
| which-key.nvim | `folke/which-key.nvim` | Displays available keybindings in a popup as you type |
| smear-cursor.nvim | `sphamba/smear-cursor.nvim` | Animated cursor trail effect for visual feedback on cursor movement |
| mini.icons | `echasnovski/mini.icons` | Icon provider for UI elements |
| nvim-web-devicons | `nvim-tree/nvim-web-devicons` | File type icons for various plugins |

## LSP & Completion

| Plugin | Repository | Purpose |
|--------|------------|---------|
| nvim-lspconfig | `neovim/nvim-lspconfig` | Quickstart configurations for Neovim's built-in LSP client |
| mason.nvim | `williamboman/mason.nvim` | Portable package manager for LSP servers, DAP servers, linters, and formatters |
| blink.cmp | `saghen/blink.cmp` | Fast and feature-rich autocompletion plugin with LSP integration |
| friendly-snippets | `rafamadriz/friendly-snippets` | Collection of snippets for various programming languages |

## Code Intelligence

| Plugin | Repository | Purpose |
|--------|------------|---------|
| nvim-treesitter | `nvim-treesitter/nvim-treesitter` | Treesitter integration for better syntax highlighting, indentation, and code understanding |
| conform.nvim | `stevearc/conform.nvim` | Lightweight formatter plugin supporting multiple formatters per filetype |
| todo-comments.nvim | `folke/todo-comments.nvim` | Highlight and search for TODO, FIXME, BUG, and other comment annotations |

## Debugging (DAP)

| Plugin | Repository | Purpose |
|--------|------------|---------|
| nvim-dap | `mfussenegger/nvim-dap` | Debug Adapter Protocol client for Neovim |
| nvim-dap-ui | `rcarriga/nvim-dap-ui` | UI for nvim-dap providing variable watches, breakpoints, call stack, and REPL |
| nvim-nio | `nvim-neotest/nvim-nio` | Async I/O library required by nvim-dap-ui |
| nvim-dap-virtual-text | `theHamsta/nvim-dap-virtual-text` | Displays variable values as inline virtual text during debugging |
| nvim-dap-python | `mfussenegger/nvim-dap-python` | Python debugging support via debugpy |
| nvim-dap-go | `leoluz/nvim-dap-go` | Go debugging support via Delve |
| nvim-dap-vscode-js | `mxsdev/nvim-dap-vscode-js` | JavaScript/TypeScript debugging adapter |
| vscode-js-debug | `microsoft/vscode-js-debug` | VS Code's JavaScript debugger used by nvim-dap-vscode-js |
| one-small-step-for-vimkind | `jbyuki/one-small-step-for-vimkind` | Lua/Neovim plugin debugging support |

## Git Integration

| Plugin | Repository | Purpose |
|--------|------------|---------|
| gitsigns.nvim | `lewis6991/gitsigns.nvim` | Git signs in the sign column (added/modified/deleted lines), hunk operations, and blame |

## Editing Enhancements

| Plugin | Repository | Purpose |
|--------|------------|---------|
| mini.pairs | `echasnovski/mini.pairs` | Auto-insert matching brackets, quotes, and other pairs |

## Utility Libraries

| Plugin | Repository | Purpose |
|--------|------------|---------|
| plenary.nvim | `nvim-lua/plenary.nvim` | Lua utility functions used as a dependency by multiple plugins |

## Summary by Category

| Category | Count |
|----------|-------|
| Plugin Manager | 1 |
| Core UI & Experience | 6 |
| LSP & Completion | 4 |
| Code Intelligence | 3 |
| Debugging (DAP) | 9 |
| Git Integration | 1 |
| Editing Enhancements | 1 |
| Utility Libraries | 1 |
| **Total** | **26** |

## Configured Language Support

This configuration provides full LSP, formatting, and debugging support for:

| Language | LSP Server | Formatter | Debugger |
|----------|-----------|-----------|----------|
| Lua | lua-language-server | stylua | one-small-step-for-vimkind |
| TypeScript/JavaScript | vtsls | prettierd/prettier | vscode-js-debug |
| Go | gopls | gofumpt | delve (via nvim-dap-go) |
| Python | ruff, ty | ruff | debugpy |
| HTML | html-lsp | prettierd/prettier | - |
| CSS/SCSS/Less | css-lsp | prettierd/prettier | - |
| Svelte | svelte-language-server | prettierd/prettier | - |
