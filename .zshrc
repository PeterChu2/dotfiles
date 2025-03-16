# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    docker
    macos
    z
    brew
    vi-mode
    vim-interaction
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export VISUAL='vim'

# History
HISTSIZE=10000
SAVEHIST=20000
HISTFILE=~/.zsh_history

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Aliases
alias gs="git status"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ls='ls -GFh'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias open="open -a Finder ./"
alias d='sudo docker-compose run web'
alias slime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias g11="g++ -std=c++11"
alias apy="/Users/peterchu/anaconda/bin/python"

# Development tools
eval $(thefuck --alias)

# Google Cloud SDK
if [ -f '/Users/peterchu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then 
    source '/Users/peterchu/Downloads/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/Users/peterchu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then 
    source '/Users/peterchu/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# Path configurations
path=(
    "/opt/homebrew/bin"
    "/opt/local/bin"
    "/opt/local/sbin"
    "/Users/peterchu/anaconda/bin"
    "/usr/local/sbin"
    "/usr/bin"
    "/Applications/MacVim.app/Contents/MacOS"
    "/Users/peterchu/Library/Android/sdk/platform-tools"
    "/Users/peterchu/Library/Android/sdk/tools"
    "/Users/peterchu/bin/ctags-5.8"
    "/Users/peterchu/bin"
    $path
)

# Environment variables
export GOOGLE_APPLICATION_CREDENTIALS='/Users/peterchu/dev/hashbrown/API Project-a502b365b026.json'
export LD_LIBRARY_PATH=/Users/peterchu/dev/ece351/ece351-labs/src
export MANPATH="/opt/local/share/man:$MANPATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# RVM
source ~/.rvm/scripts/rvm

