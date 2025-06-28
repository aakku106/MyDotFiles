# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# ---- Eza (better ls) -----

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
# alias ls="eza --color=always --long --git  --icons=always "


# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify


# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PATH=~/.console-ninja/.bin:$PATH



export DOTNET_ROOT=/usr/local/share/dotnet
export PATH=$DOTNET_ROOT:$PATH
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# YAZI__SETUp
export EDITOR=nvim
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


if command -v figlet > /dev/null; then
  neofetch
  echo
  figlet -f slant "Welcome back, Master CCN"
  RANDOM_QUOTES=(
    "🔥 Your chakra is fully charged. Time to code like a Hokage Dattebyo!!!"
    "🍜 Fueled by Ichiraku Ramen. Let's debug, dattebayo!"
    "Know Pain, Accept pain"
    "Know Pain, Accept pain"
    "💻 Shadow Clone Jutsu loaded. Ready to multi-task!"
  )
  echo "${RANDOM_QUOTES[$RANDOM % ${#RANDOM_QUOTES[@]}]}"
fi
#=========================
#
#
 typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # write code . to opean folder in vsCOde from terminal 
# ---------Alias-----------#

alias g='git'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m '
alias gp='git push'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias dotcommit="git add . && git commit -m '.'"
alias dk='docker'
alias c="clear"
alias nv="nvim"
alias la="lazygit"
alias wee="caffeinate -d"
alias weee="caffeinate -d"
alias b="zsh"
