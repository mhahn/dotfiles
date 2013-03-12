function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local  PURPLE="\[\033[0;35m\]"
  local  LIGHT_BLUE="\[\033[0;36m\]"
  local  WHITE="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\W\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$WHITE[$LIGHT_BLUE\u@\h:\W$PURPLE\$(parse_git_branch)$WHITE]\
$WHITE\$ "
}
proml

alias rmpyc='find . -name \*.pyc -delete'
alias ls="ls -GF"
alias v='mvim -v'
alias vim='mvim -v'
alias gs='git stash'
alias ga='git stash apply'
alias gp='git pull'
alias gl='git st'
alias gc='git commit'
alias gu='git add -u && gl'
alias grh='git reset HEAD'
alias post_last='post-review --revision-range HEAD^ -o --guess-summary --guess-description'
alias postreview='post-review -o --guess-summary --guess-description'
alias rgrep='grep -HRn'

export LSCOLORS="cxfxcxdxbxegedabagacad"

source $HOME/.gitcompletion
source ~/.sensitive_aliases
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
source ~/.local/bin/swiftcommandline.sh
source ~/.eb_aliases
