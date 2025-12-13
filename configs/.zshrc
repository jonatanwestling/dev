# Sample .zshrc
export PATH=$HOME/.local/bin:$PATH

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Load custom scripts if they exist
if [ -f "$HOME/.local/scripts/dev-env" ]; then
    source "$HOME/.local/scripts/dev-env"
fi

autoload -Uz compinit && compinit
prompt adam1
