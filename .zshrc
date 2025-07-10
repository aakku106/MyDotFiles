# Powerlevel10k Instant Prompt (keep at top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load other configs
ZSH_CUSTOM="$HOME/.dotfiles/zsh"
for file in "$ZSH_CUSTOM/"*.zsh; do source "$file"; done
for file in "$ZSH_CUSTOM/aliases/"*.zsh; do source "$file"; done

# Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Your welcome banner
if command -v figlet > /dev/null; then
  neofetch
  echo
  figlet -f slant "Welcome back, Master CCN"
  RANDOM_QUOTES=(
    "🔥 Your chakra is fully charged. Time to code like a Hokage Dattebyo!!!"
    "🍜 Fueled by Ichiraku Ramen. Let's debug, dattebayo!"
    "Know Pain, Accept pain"
    "💻 Shadow Clone Jutsu loaded. Ready to multi-task!"
  )
  echo "${RANDOM_QUOTES[$RANDOM % ${#RANDOM_QUOTES[@]}]}"
fi

