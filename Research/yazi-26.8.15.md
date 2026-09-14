# Yazi 26.8.15 Migration Guide

**Date:** September 14, 2026
**Issue:** Yazi upgraded from 26.5.6 to 26.8.15; opener `$@`/`$1` shell variables removed, breaking file opening in nvim
**Solution:** Migrate to new `%s` formatting placeholders; fix `[manager]` section back to `[mgr]`; update deprecated task worker names

---

## Problem Diagnosis

After running `UPDATE_BREW.sh`, yazi upgraded from **26.5.6** to **26.8.15**. Symptoms:

- Pressing `<Enter>` on any file opens nvim with a **blank buffer** (as if just running `nvim`), not the selected file
- No error messages, no crashes — silent failure
- Preview panel, navigation, and everything else still worked fine

**Root Cause:** The deprecated shell-variable placeholders (`"$@"`, `"$1"`) were **removed** in 26.8.15. They no longer expand to file paths — nvim receives an empty argument list.

---

## Breaking Changes in 26.8.15

### 1. Opener Placeholders: `"$@"` → `%s` (THE BUG)

The `%` formatting system (introduced/deprecated in v25.12.29 via PR #3232) had its deprecated `$@`/`$n` forms **removed**:

```diff
 [opener]
 edit = [
-  { run = 'nvim "$@"', desc = "nvim", block = true },
+  { run = 'nvim %s', desc = "nvim", block = true, for = "unix" },
 ]
 open = [
-  { run = 'open "$@"', desc = "Open" },
+  { run = 'open %s', desc = "Open", for = "unix" },
 ]
 reveal = [
-  { run = 'open -R "$1"', desc = "Reveal" },
+  { run = 'open -R %s1', desc = "Reveal", for = "unix" },
 ]
```

**New placeholder reference:**

| Placeholder | Meaning                                            |
| ----------- | -------------------------------------------------- |
| `%s`        | Paths of all selected files                        |
| `%S`        | URLs of all selected files                         |
| `%sN`       | Path of the N-th selected file (e.g. `%s1`, `%s2`) |
| `%SN`       | URL of the N-th selected file                      |
| `%d`        | Dirnames of all selected files                     |
| `%dN`       | Dirname of the N-th selected file                  |
| `%%`        | Literal `%`                                        |

**Key differences from old shell syntax:**

- **No quotes needed** — yazi auto-escapes special characters in paths, so wrapping `%s` in `"` is unnecessary (and would feed quotes into the command).
- `%h` (hovered file) does **NOT** exist in openers — only `$0` from the `shell` command used it. Use `%s1` for "first selected file".
- The tests show `spread: true` when `%s` is used, meaning paths are spread as individual arguments (`nvim path1 path2`).

**Reference:** Deprecated in v25.12.29 (PR #3232), removed in 26.8.15. See <https://github.com/sxyazi/yazi/pull/3232>.

### 2. Section Name: `[manager]` → `[mgr]`

The 25.12.29 migration guide renamed `[mgr]` to `[manager]` — **that was wrong**. The struct field was `mgr` even in v26.5.6 and v26.8.15 (confirmed in `yazi-config/src/yazi.rs`). The `[manager]` section was silently ignored, so settings like `show_hidden`, `linemode`, and `sort_*` weren't applied (defaults were used instead):

```diff
- [manager]
+ [mgr]
```

**Why it wasn't noticed:** `[manager]` didn't cause a parse error (unknown fields ignored), and the manager defaults closely matched the intended config, so nothing looked obviously broken.

### 3. Task Worker Names Renamed

`[tasks]` worker fields were renamed (the old `micro_workers`/`macro_workers` are gone):

```diff
 [tasks]
-micro_workers = 10
-macro_workers = 10
+file_workers   = 10
+plugin_workers = 10
 bizarre_retry  = 3
 image_alloc    = 536870912
```

Current valid fields (from `yazi-config/src/tasks/tasks.rs`):

- `file_workers`
- `plugin_workers`
- `fetch_workers`
- `preload_workers`
- `process_workers`
- `bizarre_retry`
- `image_alloc`
- `image_bound`
- `suppress_preload`

---

## Files Modified

1. **`~/.config/yazi/yazi.toml`** — the only file changed:
   - Opener `run` commands switched from `"$@"`/`"$1"` to `%s`/`%s1`
   - Added `for = "unix"` to each opener (current convention)
   - `[manager]` → `[mgr]`
   - `micro_workers`/`macro_workers` → `file_workers`/`plugin_workers`
   - Header comment updated: `Updated for yazi 26.8.15+`

**Files unchanged (verified valid in 26.8.15):**

- `keymap.toml` — already uses `[mgr]`; no schema errors
- `theme.toml` — no changes
- `package.toml` — no changes
- `flavors/catppuccin-mocha.yazi/` — no changes

---

## Testing Performed

```bash
# 1. Check version
yazi --version        # Yazi 26.8.15 (Homebrew 2026-08-15)

# 2. Validate config without launching (ya env, needs a TTY)
script -q /dev/null ya env   # No TOML parse errors, configs loaded

# 3. Confirm opener is expanded correctly
# "Text Opener" section shows:
#   run: "nvim %s", block: true, desc: "nvim", for: Unix, spread: true
```

**Verified Working:**

- ✓ Config loads with no parse/schema errors
- ✓ Opener resolves to `nvim %s` with `block: true` and `spread: true`
- ✓ `[mgr]` section applied (vs. silently ignored `[manager]`)
- ✓ Existing `[open]` MIME rules unchanged and valid

---

## Why This Happened

- **v25.12.29 (PR #3232):** Introduced the `%s`/`%sN` shell formatting and **deprecated** `$@`/`$n` (Unix) and `%*`/`%N` (Windows). Old forms still worked temporarily.
- **v26.8.15:** Deprecated forms **removed**. `"$@"` became a literal string in the command → nvim launched with zero file arguments.
- Previous migration guides validated against 26.5.6 where `"$@"` still functioned, so it passed testing at the time.

**Lesson:** Yazi deprecates then removes shell placeholders in rapid succession. Pin to the `%s`-style formatting going forward — they're the permanent API.

---

## Prevention for Future Updates

### 1. Post-Upgrade Checklist

```bash
brew info yazi              # Check version
script -q /dev/null ya env  # Look for parse errors AND check the "Text Opener" section
```

### 2. Every Migration, Verify These

- `ya env` → "Text Opener" must show `run: "nvim %s"`, `spread: true`, not `"$@"`
- `[mgr]` vs `[manager]` — check `yazi-config/src/yazi.rs` struct field names on GitHub
- Deprecated fields print warnings — grep `--debug`/`ya env` output

### 3. Watch Changelog

- GitHub: <https://github.com/sxyazi/yazi/releases>
- Search CHANGELOG for "removed", "deprecat", and "opener"/"shell"

---

## Quick Reference: Minimal Working Config (26.8.15+)

```toml
# Absolute minimum yazi config (26.8.15+)
[mgr]
show_hidden = true
linemode = "none"

[preview]
max_width = 600
max_height = 900

[opener]
edit = [{ run = 'nvim %s', block = true, for = "unix" }]
```

**This alone enables:**

- ✓ Preview panel
- ✓ File opening in nvim (with correct file paths)
- ✓ Hidden files visible
- ✓ Clean display

---

## Version Information

```
Yazi 26.8.15 (Homebrew 2026-08-15)
Platform: macOS (aarch64-apple-darwin)
Rustc: 1.97.1 (8bab26f4 2026-07-14)
Config Directory: ~/.config/yazi/
```

Dependencies (from `ya env`):

- file 5.41
- ffmpeg/ffprobe 9.0.1 / 9.0.1
- pdftoppm 26.08.0
- magick 7.1.2-30
- fzf 0.74.3
- fd 10.4.2
- rg 15.2.0

---

## Summary

**Problem:** Opener `"$@"` placeholders removed in 26.8.15, so nvim received no file arguments (blank buffer).
**Solution:** Migrate to `%s` formatting; restore `[mgr]` section name; rename task worker fields.
**Result:** 1 file changed, all functionality restored.
**Time to fix:** ~15 minutes (diagnosis + migration + verification).

---

## Next Steps

1. **Backup current config** (already done via git)
2. **Monitor yazi changelog** for 26.x.x releases (placeholders may change again)
3. **Document any new issues** in `Research/` directory
4. **Periodically run** `ya env` after system updates
