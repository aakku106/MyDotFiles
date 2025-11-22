<!-- @format -->

# Dotfiles ![](https://komarev.com/ghpvc/?username=dotFiles&abbreviated=true&base=70&label=Reppo+VIEWS&style=for-the-badge)

A comprehensive and modern macOS development environment configuration, featuring a personalized Naruto-themed terminal setup with powerful development tools.

## Features

- **Modern Terminal Setup**: Alacritty and Kitty terminal configurations with transparency and blur effects
- **Powerful Shell**: Zsh with Powerlevel10k theme, autosuggestions, and syntax highlighting
- **Window Management**: AeroSpace tiling window manager for efficient workspace organization
- **Development Tools**: Neovim, tmux, and extensive VS Code configuration
- **Package Management**: Automated Homebrew setup with 150+ curated packages
- **Personalized Experience**: Naruto-themed welcome messages and custom aliases
- **Modular Configuration**: Well-organized, maintainable configuration files

## Quick Start

### Prerequisites

- **macOS** (tested on latest versions) or **Linux** (most commands are compatible)
- **Package Manager**: [Homebrew](https://brew.sh/) for macOS/Linux
- **Shell**: Zsh (default on macOS, installable on Linux)
- **Windows Users**: Manual installation of equivalent tools required (see compatibility notes)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/aakku106/MyDotFiles ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install packages with Homebrew**

   ```bash
   brew bundle install
   ```

3. **Create symbolic links**

   ```bash
   chmod +x Install.sh
   ./Install.sh
   ```

4. **Restart your terminal or source the configuration**

   ```bash
   source ~/.zshrc
   ```

   or just press
   `b`

## Structure

```text
.dotfiles/
├── .config/              # Application configurations
│   ├── aerospace/        # Window manager config
│   ├── alacritty/        # Terminal emulator config
│   ├── kitty/           # Alternative terminal config
│   └── nvim/            # Neovim configuration
├── zsh/                 # Zsh shell configurations
│   ├── aliases/         # Command aliases
│   │   ├── git.zsh      # Git shortcuts and functions
│   │   ├── docker.zsh   # Docker aliases
│   │   ├── geneeral.zsh # General system aliases
│   │   └── python.zsh   # Python aliases
│   ├── export.zsh       # Environment variables
│   ├── paths.zsh        # PATH configurations
│   └── plugins.zsh      # Plugin initializations
├── .zshrc              # Main shell configuration
├── .tmux.conf          # Terminal multiplexer config
├── .gitconfig          # Git configuration
├── Brewfile            # Package definitions
├── Install.sh          # Installation script
└── UPDATE_BREW.sh      # Package update script
```

## Tools & Applications

### Development Tools

- **Editor**: Neovim with extensive plugin configuration
- **Version Control**: Git with custom aliases and GitHub CLI
- **Terminal Multiplexer**: tmux with vim navigation and session persistence
- **Package Managers**: Homebrew, npm, pip, luarocks

### Terminal & Shell

- **Shell**: Zsh with Powerlevel10k theme
- **Terminals**: Alacritty (primary), Kitty (with Naruto theme)
- **Enhancements**: fzf, zoxide, thefuck, autosuggestions, syntax highlighting

### System Utilities

- **File Management**: yazi, eza, bat, fd, ripgrep
- **System Info**: fastfetch (with neofetch fallback), htop
- **Productivity**: AeroSpace window manager, Raycast launcher

### Fonts

- MesloLGS Nerd Font Mono
- Symbols Only Nerd Font

## Key Features

### Git Shortcuts

```bash
g      # git
gi     # git init
gs     # git status (with bat formatting)
ga     # git add .
gc     # git commit -m
gp     # git pull
gb     # git branch (with bat formatting)
gco    # git checkout (interactive with fzf when no args)
gco -b # create new branch
gm     # git merge (interactive branch selector with fzf)
gd     # git diff (with bat formatting)
gl     # git log (with bat formatting)
add    # git add (interactive file picker with fzf when no args)
commit # auto commit with message
push   # auto commit + push + clear
clone  # git clone
gbd    # git branch -d (interactive branch selector with fzf)
gwt    # git worktree
gwta   # git worktree add
gwtr   # git worktree remove
gw     # git worktree list

# Identity switching
git_aakku  # Switch to aakku106 identity
rizzi      # Switch to tofu-10 (Rizzi) identity
```

### System Navigation & Utilities

```bash
cd       # zoxide smart navigation (interactive directory picker with fzf when no args)
c        # clear
e        # exit
nv       # neovim (interactive file picker with fzf when no args)
la       # lazygit
y        # yazi file manager
l        # eza with icons, git info, and bat formatting (compact)
ls       # clear + eza detailed list with all files + bat formatting
b        # reload zsh config (clear + source ~/.zshrc)
wee/weee # keep system awake (caffeinate)
naruto   # launch kitty with Naruto theme

# Python
py       # python3

# Docker
dk       # docker
```

### Smart Features

#### Interactive Directory Navigation with fzf

- Type `cd` without arguments to get an interactive directory selector using fzf
- Shows `..` option to go back to parent directory
- Shows only directories (no files) with colors
- Use `cd path` to directly navigate to any directory

#### Interactive File Picker with fzf

- Type `nv` without arguments to get an interactive file selector using fzf
- Use `nv file.txt` to directly open any file in neovim
- Preserves colors and icons from eza in the picker

#### Interactive Git Operations with fzf

- **`gco`** - Git checkout with interactive branch selector (or use `gco branch-name` directly)
- **`gm`** - Git merge with interactive branch selector
- **`add`** - Git add with interactive file picker (or use `add file.txt` directly)
- **`gbd`** - Git branch delete with interactive branch selector
- All interactive commands preserve colors and icons for better visibility

#### Git Identity Management

- Quickly switch between Git identities for different projects
- `git_aakku` - Personal identity
- `rizzi` - Collaborative identity

### Theme Customization

- **Terminal Welcome**: Fastfetch system info with rotating Naruto quotes
- **Random Quotes**: 6 motivational Naruto quotes that rotate on each shell start
- **Color Schemes**: Tokyo Night, Catppuccin-inspired themes
- **Transparency**: 70% opacity with blur effects across terminals
- **Powerline**: Powerlevel10k prompt with git status and system info

## Maintenance

### Update Packages

```bash
./UPDATE_BREW.sh
```

This script will:

- Check for outdated packages
- Update Homebrew
- Upgrade all installed packages
- Clean up old versions
- Run health diagnostics
- Log everything to `brew_update_log.txt`

### Backup Current Settings

Your existing configurations are automatically backed up when creating symbolic links.

## Customization

### Modifying Themes

- **Terminal themes**: Edit `.config/alacritty/alacritty.toml` or `.config/kitty/kitty.conf`
- **Shell prompt**: Run `p10k configure` to customize Powerlevel10k
- **Tmux theme**: Modify the tokyo-night plugin settings in `.tmux.conf`

### Adding New Aliases

Add custom aliases to the appropriate file in `zsh/aliases/`:

- `git.zsh` - Git-related commands and functions
- `docker.zsh` - Docker commands
- `geneeral.zsh` - General system commands and utilities
- `python.zsh` - Python-related commands

### Installing Additional Packages

Add new packages to `Brewfile` and run:

```bash
brew bundle install
```

## Contributing

Feel free to fork this repository and customize it for your own use. If you have suggestions for improvements or find any issues, please open an issue or submit a pull request.

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Amazing Zsh theme
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Neovim configuration base
- [Oh My Zsh](https://ohmyz.sh/) community - Shell configuration inspiration
- [Homebrew](https://brew.sh/) - Package management for macOS and Linux
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) - Tiling window manager

---

**Compatibility Notes**:

- **macOS**: Fully supported with all features
- **Linux**: Most commands and configurations are compatible. Homebrew works on Linux too! You can use the same `brew` commands, though some packages might have different names or you may occasionally need native package managers (`apt`, `yum`, `pacman`, etc.) for system-level dependencies
- **Bash Users**: Most tools and configurations are compatible with bash, but may require some tinkering since this setup is optimized for Zsh (aliases, prompt themes, and plugin configurations would need adaptation)
- **Windows**: Manual installation required. Consider using WSL2 with Ubuntu for better compatibility, or install Windows equivalents of the tools manually

**Windows Users**: This configuration is designed for Unix-like systems. For Windows, consider:

- Consider Switching to UNIX like system, yes it's time to switch
- Using WSL2 (Windows Subsystem for Linux) for near-native compatibility
- Installing Windows equivalents: PowerShell instead of Zsh, Windows Terminal, Scoop package manager
- Manual configuration of development tools
