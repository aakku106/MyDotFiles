<!-- @format -->

# 🔧 Dotfiles

A comprehensive and modern macOS development environment configuration, featuring a personalized Naruto-themed terminal setup with powerful development tools.

## ✨ Features

- **Modern Terminal Setup**: Alacritty and Kitty terminal configurations with transparency and blur effects
- **Powerful Shell**: Zsh with Powerlevel10k theme, autosuggestions, and syntax highlighting
- **Window Management**: AeroSpace tiling window manager for efficient workspace organization
- **Development Tools**: Neovim, tmux, and extensive VS Code configuration
- **Package Management**: Automated Homebrew setup with 150+ curated packages
- **Personalized Experience**: Naruto-themed welcome messages and custom aliases
- **Modular Configuration**: Well-organized, maintainable configuration files

## 🚀 Quick Start

### Prerequisites

- macOS (tested on latest versions)
- [Homebrew](https://brew.sh/) installed
- Zsh shell (default on macOS)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/aakku106/.dotfiles.git ~/.dotfiles
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

## 📁 Structure

```text
.dotfiles/
├── .config/              # Application configurations
│   ├── aerospace/        # Window manager config
│   ├── alacritty/        # Terminal emulator config
│   ├── kitty/           # Alternative terminal config
│   └── nvim/            # Neovim configuration
├── zsh/                 # Zsh shell configurations
│   ├── aliases/         # Command aliases
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

## 🛠️ Tools & Applications

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
- **System Info**: neofetch, htop
- **Productivity**: AeroSpace window manager, Raycast launcher

### Fonts

- MesloLGS Nerd Font Mono
- Symbols Only Nerd Font

## ⚡ Key Features

### Git Shortcuts

```bash
g     # git
gs    # git status
ga    # git add .
gc    # git commit -m
gp    # git push
```

### System Navigation

```bash
cd    # zoxide smart navigation
l     # eza with icons and git info
c     # clear
nv    # neovim
la    # lazygit
```

### Special Commands

```bash
naruto-mode    # Launch kitty with Naruto theme
dotcommit      # Quick commit for dotfiles
wee/weee       # Keep system awake
```

### Theme Customization

- **Terminal Welcome**: ASCII art with rotating Naruto quotes
- **Color Schemes**: Tokyo Night, Catppuccin-inspired themes
- **Transparency**: 70% opacity with blur effects across terminals
- **Powerline**: Beautiful prompt with git status and system info

## 🔄 Maintenance

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

## 🎨 Customization

### Modifying Themes

- **Terminal themes**: Edit `.config/alacritty/alacritty.toml` or `.config/kitty/kitty.conf`
- **Shell prompt**: Run `p10k configure` to customize Powerlevel10k
- **Tmux theme**: Modify the tokyo-night plugin settings in `.tmux.conf`

### Adding New Aliases

Add custom aliases to the appropriate file in `zsh/aliases/`:

- `git.zsh` - Git-related commands
- `docker.zsh` - Docker commands
- `geneeral.zsh` - General system commands

### Installing Additional Packages

Add new packages to `Brewfile` and run:

```bash
brew bundle install
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your own use. If you have suggestions for improvements or find any issues, please open an issue or submit a pull request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Amazing Zsh theme
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Neovim configuration base
- [Oh My Zsh](https://ohmyz.sh/) community - Shell configuration inspiration
- [Homebrew](https://brew.sh/) - Package management for macOS
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) - Tiling window manager

---

**Note**: This configuration is personalized for macOS development. Some features may need adjustment for different systems or preferences.
