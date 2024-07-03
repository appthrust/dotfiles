alias l='eza --icons'
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias tree='eza --tree --icons'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias k='kubectl'

alias ..='cd ..'
alias ...='cd ../..'

set -x PATH $HOME/bin $PATH
set -x EDITOR nvim

set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

function fish_greeting
    echo "Welcome to your modern fish shell with starship prompt!"
end

function fish_user_key_bindings
    # bind \cr 'history | fzf | read -l result; and commandline -- $result'
    bind \ct 'fd --type f --hidden --follow --exclude .git | fzf | read -l result; and commandline -- $result'
end

if status is-interactive
    # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search

    if type -q starship
        starship init fish | source
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q atuin
        atuin init fish | source
    end

    if type -q proto
        proto completions | source
    end

    if type -q moon && moon --version > /dev/null 2>&1
        moon completions | source
    end
end
