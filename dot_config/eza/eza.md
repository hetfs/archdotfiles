# 🌈 eza Setup Guide: Installation, Configuration & Catppuccin Integration

*Complete guide to installing and configuring eza with icons, completions, and automatic Catppuccin theme switching*

[`eza`](https://eza.rocks/) is a modern, colorized replacement for `ls` with icons, Git integration, and flexible theming. This comprehensive guide covers installation, configuration, theme integration, and advanced features.

## 🚀 Quick Start

```bash
# Install eza (choose one method)
sudo apt install eza          # Ubuntu/Debian
brew install eza              # macOS
cargo install eza            # From source

# Basic configuration
mkdir -p ~/.config/eza
alias ls='eza --icons --color=always'
alias ll='eza -lh --icons --group-directories-first'
```

---

## 📦 Installation Methods

### **Package Managers**

**Linux Distributions**

```bash
# Arch Linux
sudo pacman -S eza

# Ubuntu / Debian  
sudo apt install eza -y

# Fedora
sudo dnf install eza -y

# openSUSE
sudo zypper install eza
```

**macOS**

```bash
brew install eza
```

**From Source (Rust Cargo)**

```bash
cargo install eza
```

> 📘 **Official installation guide**: [github.com/eza-community/eza#installation](https://github.com/eza-community/eza#installation)

---

## ⚙️ Configuration Structure

### **Configuration Paths**

`eza` supports multiple configuration locations:

| Variable | Default Location | Priority |
|----------|------------------|----------|
| `EZA_CONFIG_DIR` | — | Highest |
| `$XDG_CONFIG_HOME/eza` | `~/.config/eza` | Default |

**Create configuration directory:**

```bash
mkdir -p ~/.config/eza
```

**Or use custom location:**

```bash
mkdir -p ~/dotfiles/config/eza
export EZA_CONFIG_DIR="$HOME/dotfiles/config/eza"
```

### **File Structure**

```
~/.config/eza/
├── colors.toml          # Base color scheme
├── icons.toml           # File type icons  
└── themes/              # Theme variants
    └── catppuccin-latte.toml
```

---

## 🎨 Color Configuration

### **Base Colors (`colors.toml`)**

```toml
# ===========================================================
# 🌈 Catppuccin-Aware eza Colors
# Base fallback palette using Catppuccin Mocha colors
# Official palette: https://github.com/catppuccin/palette
# ===========================================================

[colors]
# UI Elements
user = "blue"          # Catppuccin Blue (#89b4fa)
group = "cyan"         # Catppuccin Sky (#89dceb)
date = "yellow"        # Catppuccin Yellow (#f9e2af)
inode = "dim gray"
size = "magenta"       # Catppuccin Pink (#f5c2e7)
links = "purple"
perm = "green"         # Catppuccin Green (#a6e3a1)

# File Types
dir = "bold blue"      # Catppuccin Blue (#89b4fa)
exec = "bold green"    # Catppuccin Green (#a6e3a1)
socket = "bold magenta" # Catppuccin Pink (#f5c2e7)
block = "bold yellow"  # Catppuccin Yellow (#f9e2af)
char = "bold cyan"     # Catppuccin Sky (#89dceb)
orphan = "bold red"    # Catppuccin Red (#f38ba8)
missing = "bold red"   # Catppuccin Red (#f38ba8)

# Special Items
hidden = "dim"
symlink = "italic cyan" # Catppuccin Teal (#94e2d5)
normal = "white"
```

### **Theme Variants**

**Create themes directory:**

```bash
mkdir -p ~/.config/eza/themes
```

**☀️ `themes/catppuccin-latte.toml`**

```toml
# ===========================================================
# ☀️ Catppuccin Latte Theme for eza
# Official palette: https://github.com/catppuccin/palette
# ===========================================================

[colors]
# UI Elements
user = "blue"          # Catppuccin Blue (#1e66f5)
group = "cyan"         # Catppuccin Sapphire (#209fb5)
date = "yellow"        # Catppuccin Yellow (#df8e1d)
size = "magenta"       # Catppuccin Pink (#ea76cb)
perm = "green"         # Catppuccin Green (#40a02b)

# File Types  
dir = "bold blue"      # Catppuccin Blue (#1e66f5)
exec = "bold green"    # Catppuccin Green (#40a02b)
socket = "bold magenta" # Catppuccin Pink (#ea76cb)
block = "bold yellow"  # Catppuccin Yellow (#df8e1d)
char = "bold cyan"     # Catppuccin Sapphire (#209fb5)
missing = "bold red"   # Catppuccin Red (#d20f39)

# Special Items
symlink = "italic cyan" # Catppuccin Teal (#179299)
```

> **🎨 Color Reference**: For exact hex codes and the complete Catppuccin palette, visit the official [Catppuccin Palette repository](https://github.com/catppuccin/palette).

---

## 🖼️ Icon Configuration

**`icons.toml`**

```toml
# ===========================================================
#   eza Icons Configuration
# Compatible with Nerd Fonts and Catppuccin style
# ===========================================================

[icons]
folder = " "
file = " "
git = " "

[extensions]
rs = " "
py = " "
js = " "
ts = " "
go = " "
md = " "
toml = " "
yml = " "
json = " "
lock = " "
```

---

## ⚡ Automatic Theme Switching

### **Bash/Zsh Configuration**

Add to your `.bashrc` or `.zshrc`:

```bash
# Detect terminal background and set eza theme
if [ -n "$COLORFGBG" ]; then
    if [[ "$COLORFGBG" == *light* ]]; then
        export EZA_THEME="catppuccin-latte"
    else
        unset EZA_THEME  # Use base colors (Mocha)
    fi
else
    unset EZA_THEME  # Default to base colors (Mocha)
fi
```

### **Fish Shell Configuration**

Add to your `config.fish`:

```fish
if set -q COLORFGBG
    if string match -q "*light*" $COLORFGBG
        set -gx EZA_THEME "catppuccin-latte"
    else
        set -e EZA_THEME
    end
else
    set -e EZA_THEME
end
```

---

## 🧰 Essential Aliases

### **Bash/Zsh**

```bash
# Replace ls with eza
alias ls='eza --color=always --icons=always'
alias ll='eza -lh --icons=always --group-directories-first'
alias la='eza -lha --icons=always --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lgit='eza --git --long --icons'
```

**Apply changes:**

```bash
source ~/.bashrc  # or ~/.zshrc
```

### **Fish Shell**

```fish
alias ls="eza --color=always --icons=always"
alias ll="eza -lh --icons=always --group-directories-first"
alias la="eza -lha --icons=always --group-directories-first"
alias lt="eza --tree --level=2 --icons"
alias lgit="eza --git --long --icons"
```

---

## ⌨️ Shell Completions

Enable intelligent tab-completion for eza commands and flags.

> **📋 Prerequisite**: Completions require eza **v0.14.0 or later**. Verify with `eza --version`.

### **Installation**

**Bash**

```bash
mkdir -p ~/.local/share/bash-completion/completions
eza --completion bash > ~/.local/share/bash-completion/completions/eza
```

**Zsh**

```bash
mkdir -p ~/.zsh/completions
eza --completion zsh > ~/.zsh/completions/_eza

# Add to ~/.zshrc:
fpath=("$HOME/.zsh/completions" $fpath)
autoload -Uz compinit && compinit
```

**Fish**

```bash
mkdir -p ~/.config/fish/completions
eza --completion fish > ~/.config/fish/completions/eza.fish
```

**Apply Changes**: Restart shell or run `exec $SHELL`

### **Testing Completions**

**Basic Flag Discovery**

```bash
eza --[TAB]          # Should show all available flags
```

**Partial Completion**

```bash
eza --ico[TAB]       # Should complete to --icons
eza --gr[TAB]        # Should complete to --group-directories-first
```

**Value Completion**

```bash
eza --color=[TAB]    # Should show: always auto never
```

### **Troubleshooting**

**Update eza** (if `--completion` flag not recognized)

```bash
# Via Cargo
cargo install eza --force

# Via Package Manager  
# Use brew, apt, dnf, etc. based on installation method
```

**Manual Setup**

```bash
git clone https://github.com/eza-community/eza.git
cp eza/completions/bash/eza ~/.local/share/bash-completion/completions/
```

**Diagnostic Commands**

```bash
# Verify completion files exist
ls -la ~/.local/share/bash-completion/completions/eza

# Check file contents
head -n 5 ~/.local/share/bash-completion/completions/eza

# Reload without restart (Bash)
source ~/.local/share/bash-completion/completions/eza
```

---

## 🧪 Verification & Testing

### **System Verification**

```bash
# Check version and configuration
eza --version
echo "Config dir: ${EZA_CONFIG_DIR:-$XDG_CONFIG_HOME/eza}"
echo "Active theme: ${EZA_THEME:-default}"

# Test core functionality
eza --color=always --icons -lh --group-directories-first
```

### **Quick Validation Sequence**

```bash
# 1. Test flag completion
eza --[TAB]

# 2. Test partial completion  
eza --ic[TAB]

# Success indicators:
# ✅ Tab shows completion options
# ✅ Partial input triggers completion  
# ✅ No "no matches found" errors
# ✅ Descriptive help appears (Zsh/Fish)
```

**Pro Tip**: Switch between light/dark terminal themes — eza adapts instantly for optimal readability.

---

## 🗂️ Advanced: Unified Catppuccin Directory

For users managing multiple Catppuccin-themed applications:

```bash
# Create unified Catppuccin configuration
mkdir -p ~/.config/catppuccin/eza

# Symlink or set environment variable
ln -s ~/.config/catppuccin/eza ~/.config/eza
# OR
export EZA_CONFIG_DIR="$HOME/.config/catppuccin/eza"
```

**Directory Structure:**

```
~/.config/catppuccin/eza/
├── colors.toml          # Base Mocha colors
├── icons.toml
└── themes/
    └── catppuccin-latte.toml
```

---

## 📚 Official Resources

- **eza**: [https://eza.rocks](https://eza.rocks) • [GitHub](https://github.com/eza-community/eza)
- **Catppuccin Palette**: [github.com/catppuccin/palette](https://github.com/catppuccin/palette)
- **Catppuccin Theme**: [github.com/catppuccin/catppuccin](https://github.com/catppuccin/catppuccin)
- **XDG Base Directory**: [specifications.freedesktop.org](https://specifications.freedesktop.org/basedir-spec/latest/)

---

## ✅ Configuration Summary

| Component | Purpose | Location |
|-----------|---------|----------|
| **Base Colors** | Mocha (dark) color scheme | `colors.toml` |
| **Light Theme** | Latte theme variant | `themes/catppuccin-latte.toml` |
| **Icons** | File type icons | `icons.toml` |
| **Environment** | Active theme selection | `EZA_THEME` variable |
| **Aliases** | Replace `ls` commands | Shell configuration |
| **Completions** | Tab completion | Shell-specific directories |

**Key Features:**

- 🎨 Automatic Catppuccin theme switching (Mocha/Latte)
- 🖼️ Nerd Fonts icon support  
- ⚡ Git integration
- 🎯 Comprehensive shell completions
- 📱 Responsive to terminal color schemes
- 🔗 Official Catppuccin color references

---

*Enjoy your modern, colorful file listing experience with eza!* 🌈
