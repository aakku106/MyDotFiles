# AGENTS.md

macOS dotfiles for `aakku106/MyDotFiles` (installed at exactly `~/.dotfiles`). Personal environment repo, not an application codebase: there are **no tests, linters, or CI**. Verify shell config with `zsh -n <file>` / `bash -n <file>` and Lua with stylua.

## Critical: this repo IS the live config

- `Install.sh` symlinks `~/.dotfiles/.config` → `~/.config`, plus `.zshrc`, `.gitconfig`, `.tmux.conf`, `.tmux`. Edits in this repo take effect on the user's machine immediately (reload zsh with the `b` alias or restart the app).
- Because `~/.config` points here, day-to-day tools write their state into the repo: VS Code wrote tracked `Microsoft VisualStudio Services` cache files, and `.config/github-copilot/auth.db*` and `.config/gh/hosts.yml` contain real auth state that is accidentally committed. **Never `git add .`** — stage files explicitly or you'll commit login tokens and cache junk. `apps.json`, `brew_update_log.txt`, and `.DS_*` are ignored; do not collapse this into a broad ignore.
- `.config/opencode/opencode.json` is the user's **global** OpenCode config (pins model to local Ollama `qwen2.5-coder:3b` via `@ai-sdk/openai-compatible`). Editing it changes OpenCode behavior for every session. `.config/opencode/` also holds `opencode.jsonc` (a stub) and a gitignored `node_modules/` (plugin deps) — don't commit those.

## Layout

- `zsh/` — not symlinked; `.zshrc` sources files here by absolute path (`~/.dotfiles/zsh/...`). Zsh edits affect the live shell after `b` (reload). Aliases live in `zsh/aliases/` (`git.zsh`, `geneeral.zsh` [sic, misspelled on purpose], `python.zsh`, `docker.zsh`).
- `.config/nvim/` — kickstart.nvim-derived config. Core plugins in `lua/kickstart/plugins/`, custom ones in `lua/custom/plugins/` (harpoon, lazygit, tree-sitter, vim-be-good, webdev). `init.lua` is the main config; `.stylua.toml` sets Lua formatting; `lazy-lock.json` is the committed plugin lock. READMEs: `.config/nvim/README.md` (accurate) and `Research/MyNvim.md` (may be stale).
- `.tmux/plugins/` — **gitlinks (mode 160000) with no `.gitmodules`**. tpm, tmux-tokyo-night, tmux-resurrect, tmux-continuum, vim-tmux-navigator are committed only as hash pointers; file changes inside them don't show as git diffs. Don't edit plugin code here; clone/update plugins instead.
- `Brewfile` — Homebrew manifest. Install with `brew bundle install`. `UPDATE_BREW.sh` updates everything (`update` + `upgrade` + `cleanup` + `doctor`) and logs only to gitignored `brew_update_log.txt`.
- `Research/` — personal notes/analysis docs (battery impact, yazi, nvim); not active config.

## Gotchas

- Absolute paths are required: `.zshrc`, `Install.sh`, and nvim config reference `~/.dotfiles` and `/Users/aakku/` directly (e.g. bun, dotnet, VS Code, GOPATH). Moving the repo or hardcoding other users' paths breaks the setup.
- The remote is `git@github.com:aakku106/MyDotFiles.git`, default branch `main`. Commit style is loose and casual; `.gitconfig` sets the `aakku106` identity. Don't change repo-local git identity.
- Commits go straight to `main`; `push` & `commit` zsh aliases auto-add-and-commit (careful — that conflicts with the "never `git add .`" rule above; prefer real `git add <file>`).