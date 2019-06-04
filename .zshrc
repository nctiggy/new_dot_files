# The following lines were added by compinstall
zstyle :compinstall filename '/home/craig/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# autocolor ls output
alias ls='ls -F --color=auto'
alias ll='ls -ltra'
alias la='ls -la'
alias slack='wey'
alias acestream='/opt/acestream/start-engine --client-console &'

export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/go/bin/"
export EDITOR=/usr/bin/vim

# zplug section
source ~/.zplug/init.zsh

zplug "tcnksm/docker-alias", use:zshrc
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/kubectl",   from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
zplug "lukechilds/zsh-nvm"
zplug "gentoo/gentoo-zsh-completions", use:src

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
SPACESHIP_CHAR_SYMBOL=

alias config='/usr/bin/git --git-dir=/home/craig/.cfg/ --work-tree=/home/craig'
