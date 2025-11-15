if status is-interactive

    # ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐
    # │ H │ │ E │ │ T │ │ F │ │ S │
    # └───┘ └───┘ └───┘ └───┘ └───┘
    # ===========================================================
    # 🌍 HETFS LTD. - Code for a Brighter Future
    # https://github.com/hetfs/archdotfiles
    # ===========================================================

    # ===== Environment Variables =====
    set -gx PATH /usr/sbin /usr/local/sbin \
        $HOME/.local/bin \
        $CARGO_HOME/bin \
        $GOPATH/bin \
        $NPM_CONFIG_PREFIX/bin \
        $TFENV/bin \
        $XDG_DATA_HOME/nvim/mason/bin \
        $PATH

    set -gx NVM_DIR $HOME/.config/nvm
    set -gx MANPAGER 'nvim --cmd ":lua vim.g.noplugins=1" +Man!'
    set -gx MANWIDTH 999
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx CDPATH .

    # ===== History Configuration =====
    function fish_save_successful_history --on-event fish_prompt
        if test $status -eq 0
            history --merge
        end
    end

    function fish_cleanup_history --on-event fish_exit
        awk '!seen[$0]++' $HOME/.local/share/fish/fish_history >$HOME/.local/share/fish/fish_history.tmp
        mv $HOME/.local/share/fish/fish_history.tmp $HOME/.local/share/fish/fish_history
    end

    # ===== Aliases =====
    alias c='clear'
    alias e='nvim'
    alias se='sudo nvim'
    alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────"; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────"; df -h;'
    alias cd..='cd ../'
    alias rmrf='rm -rf'
    alias psef='ps -ef'
    alias ZZ='exit'
    alias vi='nvim'
    alias nv='nvim'
    alias cat='bat'
    alias shell='exec $SHELL -l'

    # Python
    alias py='python3'
    alias py314='python3.14'

    # Common utilities
    alias mkdir='mkdir -p'
    alias cp='cp -r'
    alias scp='scp -r'
    alias vimdiff='nvim -d -u ~/.config/nvim/init.vim'
    alias ag='ag --color --color-line-number "0;35" --color-match "46;30" --color-path "4;36"'
    alias aga='ag --hidden --color --color-line-number "0;35" --color-match "46;30" --color-path "4;36"'
    alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
    alias curlh='curl -sILX GET'
    alias fuck='sudo fish -c "(history --save; eval (history --expand-event !!))"'
    alias xyzzy='echo nothing happens'

    # ===== eza Aliases =====
    alias ls='eza --color=always --icons=always'
    alias ll='eza -lh --icons=always --group-directories-first'
    alias la='eza -lha --icons=always --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
    alias lgit='eza --git --long --icons'

    # ===== eza Theme Auto-Switch =====
    if set -q COLORFGBG
        if string match -q "*light*" $COLORFGBG
            set -gx EZA_THEME catppuccin-latte
        else
            set -gx EZA_THEME catppuccin-mocha
        end
    else
        set -gx EZA_THEME catppuccin-mocha
    end

    # ===== Custom Functions =====
    function l
        ls -gGAhF --color=always $argv | sed \
            -e 's/--x/1/g;s/-w-/2/g;s/-wx/3/g;s/r--/4/g;s/r-x/5/g;s/rw-/6/g;s/rwx/7/g;s/---/0/g;s/rwt/7/g' \
            | sed 's/^\(....\) [[:digit:]] /\1 /'
    end

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file=$tmp
        set cwd (cat $tmp)
        if test -n "$cwd" -a "$cwd" != "$PWD"
            cd $cwd
        end
        rm -f -- $tmp
    end

    # ===== Catppuccin Theme =====
    if test "$TERMINAL_BACKGROUND" = light
        set -gx CATPPUCCIN_FLAVOR latte
    else
        set -gx CATPPUCCIN_FLAVOR mocha
    end

    # ===== Starship Prompt =====
    set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
    starship init fish | source

    # ===== zoxide =====
    zoxide init fish | source

end
