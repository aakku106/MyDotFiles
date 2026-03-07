# Neovim Configuration

A modern, minimal Neovim setup based on Kickstart.nvim with LSP, completion, and productivity tools for development.

## Quick Start

```bash
# Check health
:checkhealth

# Install/update plugins
:Lazy

# Update LSP servers
:Mason
```

## Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration
├── lua/
│   ├── kickstart/plugins/      # Core plugins (gitsigns, autopairs, etc.)
│   └── custom/plugins/         # Custom additions (harpoon, lazygit, copilot)
└── README.md                   # This file
```

## Key Bindings

Leader key: `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | Normal | Clear search highlights |
| `<Esc><Esc>` | Terminal | Exit terminal mode |
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit file |
| `<leader>x` | Normal | Save and quit |
| `<leader>q` | Normal | Open diagnostic quickfix list |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Move to left window |
| `<C-l>` | Normal | Move to right window |
| `<C-j>` | Normal | Move to lower window |
| `<C-k>` | Normal | Move to upper window |

### Telescope (Search)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sf` | Normal | Search files |
| `<leader>sg` | Normal | Live grep (search in files) |
| `<leader>sw` | Normal | Search current word |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>sr` | Normal | Resume last search |
| `<leader>sh` | Normal | Search help |
| `<leader>sk` | Normal | Search keymaps |
| `<leader>ss` | Normal | Search Telescope pickers |
| `<leader>s.` | Normal | Search recent files |
| `<leader>sn` | Normal | Search Neovim config files |
| `<leader>s/` | Normal | Search in open files |
| `<leader><leader>` | Normal | Switch buffers |
| `<leader>/` | Normal | Fuzzy search in current buffer |

### LSP (Code Intelligence)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Go to references |
| `gI` | Normal | Go to implementation |
| `gD` | Normal | Go to declaration |
| `<leader>D` | Normal | Type definition |
| `<leader>ds` | Normal | Document symbols |
| `<leader>ws` | Normal | Workspace symbols |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal/Visual | Code actions |
| `<leader>f` | Normal | Format buffer |
| `<leader>th` | Normal | Toggle inlay hints |

### Git (Gitsigns)

| Key | Mode | Action |
|-----|------|--------|
| `]c` | Normal | Next git change |
| `[c` | Normal | Previous git change |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hS` | Normal | Stage buffer |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hR` | Normal | Reset buffer |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line |
| `<leader>hd` | Normal | Diff against index |
| `<leader>hD` | Normal | Diff against last commit |
| `<leader>tb` | Normal | Toggle blame line |
| `<leader>tD` | Normal | Toggle deleted preview |
| `<leader>lg` | Normal | Open LazyGit |

### Harpoon (File Marks)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | Normal | Add file to harpoon |
| `<leader>j` | Normal | Toggle harpoon menu |
| `<leader>1` | Normal | Go to harpoon file 1 |
| `<leader>2` | Normal | Go to harpoon file 2 |
| `<leader>3` | Normal | Go to harpoon file 3 |
| `<leader>4` | Normal | Go to harpoon file 4 |

### Completion (Insert Mode)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | Insert | Accept completion |
| `<C-Space>` | Insert | Trigger completion |
| `<down>` / `<up>` | Insert | Navigate completion items |
| `<C-b>` / `<C-f>` | Insert | Scroll completion docs |
| `<C-l>` | Insert | Jump to next snippet placeholder |
| `<C-h>` | Insert | Jump to previous snippet placeholder |
| `<C-j>` | Insert | Accept Copilot suggestion |

### Mini.nvim

| Operator | Action | Example |
|----------|--------|---------|
| `sa` | Add surrounding | `saiw"` - surround word with quotes |
| `sd` | Delete surrounding | `sd"` - delete surrounding quotes |
| `sr` | Replace surrounding | `sr"'` - replace " with ' |

Text objects: `ai` / `ii` - works with functions, classes, etc.

## LSP Servers

Configured language servers:
- **clangd** - C/C++
- **ts_ls** - JavaScript/TypeScript
- **tailwindcss** - Tailwind CSS
- **html** - HTML
- **cssls** - CSS
- **lua_ls** - Lua

Install/manage servers via `:Mason`

## Formatters

Auto-format on save (except C/C++):
- **stylua** - Lua
- **black** - Python
- **prettier** - JavaScript/TypeScript

Manual format: `<leader>f`

## Plugin Overview

**Core:**
- lazy.nvim - Plugin manager
- nvim-lspconfig - LSP client
- nvim-cmp - Completion engine
- telescope.nvim - Fuzzy finder
- nvim-treesitter - Syntax parsing

**Productivity:**
- gitsigns.nvim - Git integration
- lazygit.nvim - Git TUI
- harpoon - Quick file navigation
- copilot.vim - AI code completion
- conform.nvim - Code formatting

**UI/UX:**
- which-key.nvim - Keymap hints
- mini.nvim - Text objects, surround, statusline
- tokyonight.nvim - Color scheme
- indent-blankline - Indent guides

**Tools:**
- nvim-autopairs - Auto-close brackets
- nvim-ts-autotag - Auto-close HTML/JSX tags
- todo-comments.nvim - Highlight TODO/FIXME
- nvim-colorizer - Color preview

Full plugin list: `:Lazy`

## Training Mode

Arrow keys are disabled to build muscle memory for hjkl navigation.

Practice vim motions: `:VimBeGood`

## Customization

- **Add LSP servers:** Edit `servers` table in init.lua, then run `:Mason`
- **Add plugins:** Create file in `lua/custom/plugins/`
- **Modify keymaps:** Search for `vim.keymap.set` in init.lua
- **Change theme:** Edit colorscheme section in init.lua (currently Night Drift custom theme)

## Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Manage plugins |
| `:Mason` | Manage LSP servers |
| `:checkhealth` | Check configuration |
| `:ConformInfo` | View formatter status |
| `:LazyGit` | Open LazyGit |
| `:VimBeGood` | Practice vim motions |

## Notes

- Config is ~615 lines (cleaned from Kickstart's 769)
- Format on save enabled for most languages (disable in conform config)
- Diagnostic signs use Nerd Font icons
- Clipboard syncs with system clipboard
- Undo history persists between sessions
