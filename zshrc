# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' prompt '[%e]:'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/mark/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
# End of lines configured by zsh-newuser-install

# personal additions
setopt correct      # correct mistakes
setopt appendhistory 
setopt autocd 
setopt extendedglob 
setopt notify
unsetopt beep
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache



# TODO: adjust colors
# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r



###############
#   PLUGINS
###############

# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Use autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/doc/find-the-command/ftc.zsh quiet


autoload -U colors && colors

# Console colors
#source ~/.themes/lonewinter/console/colors.zsh
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P00a0f14
  \e]P1c33027
  \e]P226a98b
  \e]P3edb54b
  \e]P4195465
  \e]P54e5165
  \e]P633859d
  \e]P798d1ce
  \e]P888735c
  \e]P9d26939
  \e]PA275672
  \e]PB377689
  \e]PCe7e7e7
  \e]PD888ba5
  \e]PE599caa
  \e]PFd3ebe9
  "
  # get rid of artifacts
  clear
fi




# Aliases
source ~/.config/zsh/aliases.zsh


source ~/.config/zsh/functions.zsh

# vim mode
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt

}

function reload_zsh {
  source "/home/mark/.zshrc"
  $(clear)
}


zle -N zle-line-init
zle -N zle-keymap-select
zle -N _git-status
bindkey -v


bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^R' history-incremental-search-backward
bindkey '^B' backward-char
bindkey '^[B' backward-word
bindkey '^F' forward-char
bindkey '^[F' forward-word


autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

function sudo_last() {
  last_cmd="$(fc -ln -1)"
  echo "$last_cmd";
  $(sudo "$last_cmd");
}

function git_branch() {
  branch=$(git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]]; then
    echo ""
  else
    echo "[%{$fg[red]%}"$branch"%{$fg[green]%}]"
  fi
}

function set_prompt() {
  export PROMPT="%B%{$fg[green]%}«[ %{$fg[blue]%}%2~ %{$fg[green]%}]» $(git_branch) %{$fg[black]%}↣%b  "
}

autoload add-zsh-hook
add-zsh-hook precmd set_prompt


umask 077
