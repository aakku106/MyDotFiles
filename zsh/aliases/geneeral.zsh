alias l="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions | bat --style=-header --paging=never"
alias ls="clear && eza --color=always --long --git  --icons=always -a | bat --style=-header --paging=never"
alias c="clear"
alias e='exit'
alias b="c && source ~/.zshrc"
alias la="lazygit"
alias y='yazi'
alias wee="caffeinate -d"
alias weee="caffeinate -d"

# Smart nvim: uses fzf when no args, otherwise passes args to nvim
nv() {
  if [ $# -eq 0 ]; then
    nvim $(eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions | fzf --ansi | awk '{print $NF}')
  else
    nvim "$@"
  fi
}

# Smart CD: uses fzf when no args, otherwise passes args to cd
cd() {
  if [ $# -eq 0 ]; then
    local dir=$( (echo ".. 󰜱 " && eza -D -a --color=always  | sed 's/^/  /') | fzf --ansi --height=40% | awk '{print $1}')
    [ -n "$dir" ] && z "$dir"
  else
    z "$@"
  fi
}

alias naruto="kitty --config ~/.config/kitty/naruto.conf"
