#!/usr/bin/env bash
case $- in
    *i*) ;;
    *) return ;;
esac

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=5000
HISTFILESIZE=10000
HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend
shopt -s cmdhist

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -f'
alias cp='cp -iv'
alias mv='mv -iv'

alias df='df -h'
alias du='du -h'
alias free='free -h'

alias v='vim'
alias vi='vim'
alias sv='sudo vim'
alias dv='doas vim'

alias vbrc='vim ~/.bashrc'
alias vvim='vim ~/.vimrc'
alias reload='source ~/.bashrc'

alias h='history'
alias mkdir='mkdir -pv'

if command -v apt &> /dev/null; then
    alias update='sudo apt update'
    alias upgrade='sudo apt upgrade -y'
    alias install='sudo apt install -y'
    alias remove='sudo apt remove -y'
elif command -v pacman &> /dev/null; then
    alias update='sudo pacman -Syu'
    alias install='sudo pacman -S'
    alias remove='sudo pacman -Rns'
fi

if command -v doas &> /dev/null; then
    alias sudo='doas'
    alias d='doas'
    alias di='doas install'
    alias dr='doas remove'
    alias dv='doas vim'
    alias dup='doas apt update && doas apt upgrade'
else
    alias sudo='sudo'
    alias d='sudo'
    alias di='sudo install'
    alias dr='sudo remove'
    alias dv='sudo vim'
    alias dup='sudo apt update && sudo apt upgrade'
fi

alias ff='firefox'
alias ffp='firefox --private-window'
alias ffn='firefox --new-window'

if command -v git &> /dev/null; then
    alias gs='git status'
    alias ga='git add'
    alias gc='git commit'
    alias gp='git push'
    alias gl='git log --oneline --graph --decorate'
fi

BLUE_COLOR='\[\033[01;34m\]'
RESET='\[\033[00m\]'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if command -v git &> /dev/null; then
    PS1="${BLUE_COLOR}\w\$(parse_git_branch)${RESET} $ "
else
    PS1="${BLUE_COLOR}\w${RESET} \$ "
fi

mkcd() {
    mkdir -p "$1" && cd "$1"
}

findfile() {
    find . -type f -name "*$1*" 2>/dev/null
}

findtext() {
    grep -rn --color=auto "$1" . 2>/dev/null
}

dsize() {
    du -sh "$@" 2>/dev/null | sort -h
}

ffu() {
    firefox "$1" 2>/dev/null &
}

extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjf "$1" ;;
            *.tgz) tar xzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
