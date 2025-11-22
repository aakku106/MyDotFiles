alias g='git'
alias gi='git init'
alias gs='git status'
alias gc='git commit -m '
alias gp='git pull'
alias gb='git branch'

# Smart git checkout: uses fzf when no args, otherwise passes args to git checkout
gco() {
  if [ $# -eq 0 ]; then
    git checkout $(git branch | fzf)
  else
    git checkout "$@"
  fi
}

alias gm='git merge $(gb | fzf) '
alias gd='git diff | bat --style=-header'
alias gl='git log | bat --style=-header'
alias add='git add '
alias commit="git add . && git commit -m ' Auto commit script ran '"
alias push="git add . ; git commit -m 'Auto commit + push script ran from terminal' ; git push && clear"
alias clone='git clone '
alias gbd='gb -d $(gb|fzf)'
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtr='git worktree remove'
alias gw='git worktree list'

# --- Identity switch aliases ---
alias git_aakku='git config user.name "aakku106" && git config user.email "adarashagaihre80@nepathyacollege.edu.np" && echo "Switched identity → 🌀 aakku106"'

alias rizzi='git config user.name "tofu-10" && git config user.email "rijanshrestha80@nepathyacollege.edu.np" && echo "Switched identity → 👾 tofu-10 (Rizzi)"'
