###############
#   ALIASES
###############

# TODO: Organize me!


# WARNING: ALIASING BASIC SHELL COMMANDS HERE!!!
#alias cd="cd-mkdir"


# ls
alias ls="ls -F --color=always"
alias ll="ls -lhF"
alias la="ls -alhF"
alias l="ls -1"

# exa
alias exa="exa --icons --git --group-directories-first"

alias ls="exa"
#alias ls="lsd --group-dirs=first"

alias less="less -R"
alias mkx="chmod +x"

# emacs
alias e="emacs"
alias et="emacs -t"

# grep
alias grep="egrep"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias fgrep="fgrep --color=always"

# pacman
alias pacman="pacman"
alias pacs="pacman -Ss"
alias pacget="sudo pacman -S"
alias pacupgrade="sudo pacman -Syu"
alias pacown="pacman -Qo"
alias pacl="pacman -Ql"
alias paci="pacman -Qi"
alias yays="yay -Ss"
alias yayget="yay -S --sudoloop"
alias yayupgrade="yay -Syu --sudoloop"

# tmux
alias t="tmux"
alias tat="tmux attach -t"

# misc
alias cp="cp -i"
alias md="mkdir -p"
alias yeahtho="sudo_last"
alias Z="clear && source ~/.zshrc"
alias v="vim"
alias xxd="xxd -g1"
alias vim="nvim"
alias wireshark="nohup wireshark"
alias objdump="objdump -M intel"

alias google="surfraw google"
alias cgoogle="surfraw -t google"

alias mgcc-i686='i686-w64-mingw32-gcc'

alias idafree="nohup /opt/ida-free/ida64"
alias idaf="idafree"
alias ida64="nohup ~/.wine/drive_c/Program\ Files/IDA\ 7.0/ida64.exe"
alias ida32="nohup ~/.wine/drive_c/Program\ Files/IDA\ 7.0/ida.exe"
alias idat64="nohup wineconsole ~/.wine/drive_c/Program\ Files/IDA\ 7.0/idat64.exe"
alias idat32="nohup wineconsole ~/.wine/drive_c/Program\ Files/IDA\ 7.0/idat.exe"
alias ida="ida64"
alias idat="idat64"

alias hopper="nohup /opt/hopper-v4/bin/Hopper"
alias bninja="nohup binaryninja-demo"

alias gdb="gdb -q"

alias tldr="tldr -s"
alias tldri="/bin/tldr"

alias b64="base64"
alias b64d="base64 -d"

# Could I add myself to a group to execute these instead?
alias nmap="sudo nmap"
alias masscan="sudo masscan"

alias xclip="xclip -selection clipboard"

