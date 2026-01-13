alias g='git'
alias gi='git init'
alias gs='git status | bat --style=-header'
alias ga='g add .'

alias gc='git commit -m '
alias gp='git pull | bat --style=-header'
alias gb='git branch | bat --style=-header'

# Smart git checkout: uses fzf when no args, otherwise passes args to git checkout
gco() {
  if [ $# -eq 0 ]; then
    git checkout $(git branch | fzf)
  else
    git checkout "$@"
  fi
}

alias gm='git merge $(gb | fzf)'
alias gd='git diff | bat --style=-header'
alias gl='git log | bat --style=-header'

# Smart git add: uses fzf when no args, otherwise passes args to git add
add() {
  if [ $# -eq 0 ]; then
    git add $(eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions | fzf --ansi | awk '{print $NF}')
  else
    git add "$@"
  fi
}

alias commit="git add . && git commit -m ' Auto commit script ran' | bat --style=-header"
alias push="git add . ; git commit -m 'Auto commit + push script ran from terminal' | bat --style=-header; git push && clear"
alias clone='git clone --depth 1 '
alias gbd='gb -d $(gb|fzf)'
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtr='git worktree remove'
alias gw='git worktree list'

# --- Identity switch aliases ---
alias aakku='git config user.name "aakku106" && git config user.email "adarashagaihre80@nepathyacollege.edu.np" && echo "Switched identity → 🌀 aakku106"'

alias rizzi='git config user.name "tofu-10" && git config user.email "rijanshrestha80@nepathyacollege.edu.np" && echo "Switched identity → 👾 tofu-10 (Rizzi)"'
