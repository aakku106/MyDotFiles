alias cd="z"
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
    nvim $(eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions | fzf --ansi | awk '{print $NF}')
  else
    nvim "$@"
  fi
}

alias naruto="kitty --config ~/.config/kitty/naruto.conf"
