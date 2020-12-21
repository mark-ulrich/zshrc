function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}

function reload_zsh {
  source "/home/mark/.zshrc"
  $(clear)
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
  NEWLINE=$'\n'
  export PROMPT="%B%{$fg[green]%}[ %{$fg[blue]%}%2~ %{$fg[green]%}] $(git_branch) %{$fg[black]%}%b${NEWLINE} => "
}
