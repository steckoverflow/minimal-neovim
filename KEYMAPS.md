# Neovim Keymaps Reference

This document lists all custom keymaps organized by functionality. Keymaps are defined in `lua/config/keymaps.lua` and various plugin files.

## Legend

| Mode | Description |
|------|-------------|
| `n` | Normal mode |
| `v` | Visual mode |
| `x` | Visual block mode |
| `i` | Insert mode |
| `o` | Operator-pending mode |

---

## General

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `jk` | i | Exit Insert Mode | keymaps.lua |
| `<Esc>` | n | Clear search highlight | keymaps.lua |

## Buffer (`<leader>b`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>bd` | n | Delete buffer | keymaps.lua |
| `<S-h>` | n | Previous buffer | keymaps.lua |
| `<S-l>` | n | Next buffer | keymaps.lua |

## Window Navigation

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<C-h>` | n | Go to left window | keymaps.lua |
| `<C-j>` | n | Go to lower window | keymaps.lua |
| `<C-k>` | n | Go to upper window | keymaps.lua |
| `<C-l>` | n | Go to right window | keymaps.lua |
| `<leader>q` | n | Close window | keymaps.lua |
| `<leader>\|` | n | Vertical split | keymaps.lua |
| `<leader>-` | n | Horizontal split | keymaps.lua |

## Save/Write/Exit

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>w` | n | Save buffer (prompts for name if new) | keymaps.lua |
| `<leader>x` | n | Kill terminals and exit Neovim | keymaps.lua |

## Code (`<leader>c`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>ca` | n, v | Code action | lsp.lua |
| `<leader>cf` | n | Format buffer | conform.lua |

## Debug (`<leader>d`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>dr` | n | Run/Continue | snacks.lua |
| `<leader>di` | n | Step Into | snacks.lua |
| `<leader>do` | n | Step Over | snacks.lua |
| `<leader>dO` | n | Step Out | snacks.lua |
| `<leader>db` | n | Toggle Breakpoint | snacks.lua |
| `<leader>dB` | n | Set Breakpoint w/condition | snacks.lua |
| `<leader>dp` | n | Pause | snacks.lua |
| `<leader>dq` | n | Quit Debugging | snacks.lua |
| `<leader>dR` | n | DAP-UI Toggle | snacks.lua |
| `<leader>de` | n | Eval | snacks.lua |
| `<leader>dl` | n | Diagnostic loclist | lsp.lua |

## Find (`<leader>f`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>fb` | n | Find buffers | snacks.lua |
| `<leader>fc` | n | Find config file | snacks.lua |
| `<leader>ff` | n | Find files | snacks.lua |
| `<leader>fg` | n | Find git files / Grep | snacks.lua |
| `<leader>fp` | n | Projects | snacks.lua |
| `<leader>fr` | n | Recent files | snacks.lua |
| `<leader>fB` | n | Buffer lines | snacks.lua |
| `<leader>fw` | n, x | Grep word under cursor | snacks.lua |

## Git (`<leader>g`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>gg` | n | Lazygit | snacks.lua |
| `<leader>gb` | n | Git branches | snacks.lua |
| `<leader>gl` | n | Git log | snacks.lua |
| `<leader>gL` | n | Git log line | snacks.lua |
| `<leader>gs` | n | Git status | snacks.lua |
| `<leader>gS` | n | Git stash | snacks.lua |
| `<leader>gd` | n | Git diff (hunks) | snacks.lua |
| `<leader>gf` | n | Git log file | snacks.lua |

## Git Hunk (`<leader>h`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>hs` | n, v | Stage hunk | snacks.lua |
| `<leader>hr` | n, v | Reset hunk | snacks.lua |
| `<leader>hS` | n | Stage buffer | snacks.lua |
| `<leader>hu` | n | Undo stage hunk | snacks.lua |
| `<leader>hR` | n | Reset buffer | snacks.lua |
| `<leader>hp` | n | Preview hunk | snacks.lua |
| `<leader>hb` | n | Full blame line | snacks.lua |
| `<leader>hd` | n | Diff this | snacks.lua |
| `<leader>hD` | n | Diff this ~ | snacks.lua |
| `ih` | o, x | Select hunk (text object) | git.lua |

## Search (`<leader>s`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>s"` | n | Registers | snacks.lua |
| `<leader>s/` | n | Search history | snacks.lua |
| `<leader>sa` | n | Autocmds | snacks.lua |
| `<leader>sc` | n | Command history | snacks.lua |
| `<leader>sC` | n | Commands | snacks.lua |
| `<leader>sd` | n | Diagnostics | snacks.lua |
| `<leader>sD` | n | Buffer diagnostics | snacks.lua |
| `<leader>sh` | n | Help pages | snacks.lua |
| `<leader>sH` | n | Highlights | snacks.lua |
| `<leader>si` | n | Icons | snacks.lua |
| `<leader>sj` | n | Jumps | snacks.lua |
| `<leader>sk` | n | Keymaps | snacks.lua |
| `<leader>sl` | n | Location list | snacks.lua |
| `<leader>sm` | n | Marks | snacks.lua |
| `<leader>sM` | n | Man pages | snacks.lua |
| `<leader>sp` | n | Search plugin spec | snacks.lua |
| `<leader>sq` | n | Quickfix list | snacks.lua |
| `<leader>sR` | n | Resume picker | snacks.lua |
| `<leader>ss` | n | LSP symbols | snacks.lua |
| `<leader>sS` | n | Workspace symbols | snacks.lua |
| `<leader>st` | n | Search todos | todo-comments.lua |
| `<leader>sT` | n | Search Todo/Fix/Fixme | todo-comments.lua |
| `<leader>su` | n | Undo history | snacks.lua |

## Toggle (`<leader>t`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>tb` | n | Toggle line blame | snacks.lua |
| `<leader>td` | n | Toggle deleted | snacks.lua |

## UI (`<leader>u`)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader>un` | n | Dismiss notifications | snacks.lua |
| `<leader>uN` | n | Notification picker | snacks.lua |
| `<leader>uC` | n | Colorschemes | snacks.lua |

## Quick Access

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<leader><space>` | n | Smart find files | snacks.lua |
| `<leader>,` | n | Buffers | snacks.lua |
| `<leader>/` | n | Grep | snacks.lua |
| `<leader>:` | n | Command history | snacks.lua |
| `<leader>e` | n | File explorer | snacks.lua |
| `<leader>n` | n | Notification history | snacks.lua |
| `<leader>N` | n | Neovim news | snacks.lua |
| `<leader>rn` | n | Rename symbol | lsp.lua |

## LSP Navigation

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `gd` | n | Go to definition | snacks.lua |
| `gD` | n | Go to declaration | snacks.lua |
| `gr` | n | References | snacks.lua |
| `gI` | n | Go to implementation | snacks.lua |
| `gi` | n | Go to implementation (LSP) | lsp.lua |
| `gy` | n | Go to type definition | snacks.lua |
| `K` | n | Hover documentation | lsp.lua |
| `gl` | n | Show diagnostic | lsp.lua |

## Diagnostics Navigation

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `[d` | n | Previous diagnostic | lsp.lua |
| `]d` | n | Next diagnostic | lsp.lua |
| `[c` | n | Previous git hunk | snacks.lua |
| `]c` | n | Next git hunk | snacks.lua |
| `[t` | n | Previous todo comment | todo-comments.lua |
| `]t` | n | Next todo comment | todo-comments.lua |

## Visual Mode Editing

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<` | v | Indent left (stay in visual) | keymaps.lua |
| `>` | v | Indent right (stay in visual) | keymaps.lua |
| `p` | v | Paste without yanking replaced text | keymaps.lua |

## Line Movement

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<A-j>` | n | Move line down | keymaps.lua |
| `<A-k>` | n | Move line up | keymaps.lua |
| `<A-j>` | v | Move selection down | keymaps.lua |
| `<A-k>` | v | Move selection up | keymaps.lua |

## Scrolling (Centered)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<C-d>` | n | Scroll down half page (centered) | keymaps.lua |
| `<C-u>` | n | Scroll up half page (centered) | keymaps.lua |
| `n` | n | Next search result (centered) | keymaps.lua |
| `N` | n | Previous search result (centered) | keymaps.lua |

## Completion (Insert Mode)

| Keymap | Mode | Description | Source |
|--------|------|-------------|--------|
| `<Tab>` | i | Accept completion | blink.lua |
| `<C-n>` | i | Select next completion | blink.lua |
| `<C-p>` | i | Select previous completion | blink.lua |
| `<C-space>` | i | Show/toggle documentation | blink.lua |
| `<C-e>` | i | Hide completion | blink.lua |
| `<C-k>` | i | Show/hide signature | blink.lua |

---

## Which-Key Groups

The following leader key groups are configured in which-key for discoverability:

| Prefix | Group Name | Modes |
|--------|-----------|-------|
| `<leader>b` | Buffer | n |
| `<leader>c` | Code | n, v |
| `<leader>d` | Debug | n |
| `<leader>f` | Find | n |
| `<leader>g` | Git | n |
| `<leader>h` | Git Hunk | n, v |
| `<leader>s` | Search | n, v |
| `<leader>t` | Toggle | n |
| `<leader>u` | UI | n |
