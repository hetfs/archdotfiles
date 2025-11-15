# Bat + Fzf Workflow Guide

`bat` and `fzf` pair extremely well for fast file navigation, fuzzy search, and previewing code with full syntax highlighting. This guide shows practical workflows and ready-to-use commands that boost your terminal productivity.

## Quick File Preview with Fzf

The most common pattern is using `fzf` with a `bat` preview window.

```sh
fzf --preview 'bat --style=numbers --color=always {}'
```

This gives you a scrollable preview of the highlighted file as you navigate.

### Add icons (requires `lsd`, `exa`, or `fd`)

```sh
fd . --type f | fzf --preview 'bat --color=always --style=header,numbers {}'
```

## Use Bat as a Previewer for Ripgrep (rg)

Search with ripgrep, preview matches with bat.

```sh
rg --line-number --no-heading --color=always "" \
  | fzf --ansi --preview 'bat --color=always --highlight-line {1} {2}'
```

### Smarter version with file extension detection

```sh
rg --line-number --no-heading --color=always "" \
  | fzf --ansi --preview 'bat --color=always --style=numbers --highlight-line {1} {2}'
```

This opens the file on the exact matched line.

## Fuzzy Search Your Entire Project

Combining `fd` and `bat`.

```sh
fd . \
  | fzf --preview 'bat --color=always --style=numbers,changes,header {}'
```

### Open selected file in Neovim

```sh
fd . \
  | fzf --preview 'bat --color=always --style=header,numbers {}' \
  | xargs nvim
```

Works great in large repos.

## Search Inside Files with Ripgrep + Fzf + Bat

Unified fuzzy content search:

```sh
rg --files | fzf \
  --preview 'bat --color=always --style=header,numbers {}'
```

### Search for a string

```sh
ripgrep() {
  rg --line-number --no-heading --color=always "$1" \
    | fzf --ansi --preview \
      'bat --color=always --highlight-line {1} {2}'
}
```

Usage:

```sh
ripgrep myFunction
```

## Live Grep: Real-Time Search

```sh
fzf --bind "change:reload:rg --color=always --line-number {q} || true" \
  --ansi --preview 'bat --color=always --highlight-line {1} {2}'
```

As you type, results update instantly.

## Build a Smart File Finder Command

If you want a reusable CLI command:

```sh
ff() {
  fd --type f \
    | fzf --preview 'bat --color=always --style=header,numbers {}'
}
```

Run:

```sh
ff
```

## Browse Git Changes with Bat

View changed files and navigate through them.

```sh
git ls-files -m \
  | fzf --preview 'bat --color=always --style=changes,numbers {}'
```

## Git Diff with Inline Bat Highlighting

```sh
git diff --name-only \
  | fzf --preview 'git diff --color=always {} | bat --color=always --paging=never'
```

## Use Bat to Preview Clipboard Content

macOS/Linux:

```sh
fzf --preview 'printf "%s\n" "$CLIPBOARD" | bat --color=always'
```

## Directory Preview (Tree with Syntax Highlighting)

Combine `tree`-style listing from `lsd` or `exa`:

```sh
lsd --tree | fzf --preview 'bat --color=always --style=plain {}'
```

---

# Recommended Plugin: fzf + Bat Preview in Nvim

If you use `fzf-lua` or `fzf.vim`, plug `bat` directly:

```vim
let g:fzf_preview_command = 'bat --color=always --style=numbers {}'
```

---

# Combined Bat+Fzf Starter Script (Optional)

Drop this into your dotfiles (`~/bin/bf`):

```sh
#!/usr/bin/env bash
fd . --type f \
  | fzf --preview 'bat --color=always --style=numbers,changes,header {}'
```

Make it executable:

```sh
chmod +x ~/bin/bf
```

Run:

```sh
bf
```
