# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-~/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#===========================
#      CONFIG SOURCING
#===========================

# → General exports (EDITOR, DOTNET vars, etc.)
source ~/.dotfiles/zsh/export.zsh

# → PATH updates (GOPATH, VSCode path, yazi path, etc.)
source ~/.dotfiles/zsh/paths.zsh

# → Plugins (fzf, thefuck, zoxide, syntax-highlighting, autosuggestions, etc.)


#===========================
#     POWERLEVEL10K THEME
#===========================

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#===========================
#      TERMINAL WELCOME
#===========================

if command -v fastfetch > /dev/null; then
  fastfetch
elif command -v neofetch > /dev/null; then
  neofetch
fi

echo
RANDOM_QUOTES=(
  "🔥 Your chakra is fully charged. Time to code like a Hokage Dattebyo!!!"
  "🍜 Fueled by Ichiraku Ramen. Let's debug, dattebayo!"
  "⚡ Know Pain, Accept pain"
  "💻 Shadow Clone Jutsu loaded. Ready to multi-task!"
  "🌀 Believe it! Your code will change the world!"
  "🦊 The Nine-Tails of debugging are with you!"
)
RANDOM_INDEX=$(( RANDOM % ${#RANDOM_QUOTES[@]} + 1 ))
echo "${RANDOM_QUOTES[$RANDOM_INDEX]}"
echo


source ~/.dotfiles/zsh/plugins.zsh
source ~/.dotfiles/zsh/aliases/geneeral.zsh
source ~/.dotfiles/zsh/aliases/git.zsh
source ~/.dotfiles/zsh/aliases/python.zsh
source ~/.dotfiles/zsh/aliases/docker.zsh
