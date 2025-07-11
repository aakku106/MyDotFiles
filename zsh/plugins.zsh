# Plugin setup
eval "$(fzf --zsh)"
eval $(thefuck --alias)
eval $(thefuck --alias fk)
eval "$(zoxide init zsh)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom Yazi wrapper (no auto-launch, works perfect)
yazi() {
  local tmpfile=$(mktemp)
  command yazi --cwd-file="$tmpfile" "$@"
  if [[ -f "$tmpfile" ]]; then
    local dir=$(<"$tmpfile")
    rm -f "$tmpfile"
    [[ -d "$dir" ]] && cd "$dir"
  fi
}
