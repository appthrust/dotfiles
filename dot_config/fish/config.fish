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

starship init fish | source
direnv hook fish | source

# atuin
atuin init fish | source
# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search

function fish_greeting
    echo "Welcome to your modern fish shell with starship prompt!"
end

function fish_user_key_bindings
    # bind \cr 'history | fzf | read -l result; and commandline -- $result'
    bind \ct 'fd --type f --hidden --follow --exclude .git | fzf | read -l result; and commandline -- $result'
end
