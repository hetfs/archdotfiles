# Bat Command Reference

`bat` is a modern alternative to `cat` with syntax highlighting, Git integration, paging, and smart display options. This guide lists the most useful commands and flags you can use with `bat`.

## Viewing Files

```sh
bat file.txt
bat *.md
bat src/main.rs
```

### Basic Options

```sh
--plain            # Disable decorations and Git changes
--color=always     # Force colorized output
--language=Rust    # Override syntax detection
--tabs=4           # Set tab width
--wrap=never       # Prevent line wrapping
```

## Theming and Appearance

```sh
--list-themes                # Show available themes
--theme="Catppuccin Mocha"   # Set a theme
--style="full"               # All decorations
--style="numbers,changes"    # Custom style combinations
--italic-text=always         # Use italics if supported
--no-grid                    # Hide grid borders
```

## Paging

```sh
--paging=auto
--paging=always
--paging=never
--pager=builtin
--pager="less --RAW-CONTROL-CHARS"
```

### Useful Paging Features

```sh
--terminal-width=120   # Force width
--terminal-height=40   # Force height
```

## Git Integration

```sh
--git-ignore           # Respect .gitignore patterns
--no-git               # Disable Git highlighting
--diff-context=3       # Context lines around diff hunks
```

## Syntax Highlighting

```sh
--map-syntax="*.conf:INI"
--map-syntax="*.ignore:Git Ignore"
--list-languages
```

## Display Options

```sh
--line-numbers
--show-all           # Show tabs, spaces, newlines
--header             # Show file header
--no-header          # Hide header
--range=10:20        # Print selected line range
```

## Output and Encoding

```sh
--encoding=UTF-8
--tabs=2
--force-colorization
```

## Search

When piped or used with commands:

```sh
grep foo file.txt | bat
bat --search-ignore-case "pattern"
```

## File Handling

```sh
--paging=never file.txt
--no-read              # Prevent interactive reads
--binary               # Print binary data plainly
```

## Diagnostics and Debugging

```sh
--diagnostic           # Show theme and syntax detection info
--list-themes
--list-languages
```

---

## Full Example Config (`~/.config/bat/config`)

```bat
--theme="Catppuccin Mocha"
--italic-text=always
--color=always
--style="numbers,changes,header"
--paging=always
--pager=builtin
--map-syntax="*.ino:C++"
--map-syntax=".ignore:Git Ignore"
--map-syntax="*.conf:INI"
--wrap=never
--line-numbers
--show-all
--tabs=4
--encoding="UTF-8"
--git-ignore
--no-grid
```
