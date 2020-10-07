# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# autocolor ls output
alias ls='ls -F'
alias ll='ls -ltra'
alias la='ls -la'
alias acestream='/opt/acestream/start-engine --client-console &'

export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/Library/Python/3.7/bin:/Users/craigsmith/Library/Python/3.8/bin:${HOME}/bin"
export EDITOR=/usr/bin/vim
export CLICOLOR=1

alias config='/usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}'

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

############################
# Conditional themes block #
############################

# Plugins

zinit wait lucid for \
        OMZP::sudo\
        lukechilds/zsh-nvm \
        StackExchange/blackbox \
        rgburke/grv \
    as"completion" \
        OMZP::git \
        OMZP::minikube \
        zsh-users/zsh-completions \
        OMZP::kubectl \
        OMZP::helm \
        zsh-users/zsh-autosuggestions \
        zsh-users/zsh-history-substring-search

zinit ice depth=1; zinit light romkatv/powerlevel10k

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
SPACESHIP_CHAR_SYMBOL="ﰁ "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
