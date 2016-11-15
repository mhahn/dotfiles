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
$WHITE[$LIGHT_BLUE\u:\W$PURPLE\$(parse_git_branch)$WHITE]\
$WHITE\$ "
}
proml

eval "$(direnv hook bash)"
alias rmpyc='find . -name \*.pyc -delete'
alias ls="ls -GF"
alias v='mvim -v'
alias t='tig'
alias vim='mvim -v'
alias gs='git stash'
alias ga='git stash apply'
alias gp='git pull'
alias gl='git st'
alias gc='git commit'
alias gu='git add -u . && gl'
alias grh='git reset HEAD'
alias gd='git diff'
alias gdc='git diff --cached'
alias post_last='post-review --revision-range HEAD^ -o --guess-summary --guess-description'
alias postreview='post-review -o --guess-summary --guess-description'
alias rgrep='grep -HRn'

export LSCOLORS="cxfxcxdxbxegedabagacad"

source $HOME/.gitcompletion
source ~/.local/bin/swiftcommandline.sh
source /usr/local/bin/virtualenvwrapper.sh

# task warrior shortcuts
alias tl='clear && task ls'
alias ta='task add'

function postpone_task () {
    echo "postponing task $1 for $2";
    task $1 modify wait:$2;
}

function complete_task () {
    task $1 done;
}

function open_task () {
    open "`task $1 ls | grep -Eo 'https://[^ ]+'`";
}

# fucking xcode
alias xcode_clean='rm -rf ~/Library/Developer/Xcode/DerivedData'

# go workspace
export GOPATH=$HOME/gocode
export PATH=$HOME/gocode/bin:/usr/local/opt/go/libexec/bin:$PATH
export GO15VENDOREXPERIMENT=1

# terraform
export PATH=$HOME/terraform:$PATH
export PATH=$HOME/packer:$PATH

# alias hub
alias git=hub

# deis alais
export DEISCTL_TUNNEL=54.86.54.221

alias deistunnel='ssh core@$DEISCTL_TUNNEL'

export NVM_DIR="/Users/mhahn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias fuck='$(thefuck $(fc -ln -1))'

alias emptunnel='ssh -A ec2-user@52.2.242.211'
export EMPIRE_API_URL=https://empire.dev.lunohq.com
alias stagingemp='EMPIRE_API_URL=https://empire.staging.lunohq.com emp'
alias oldprodemp='EMPIRE_API_URL=https://empire.lunohq.com emp'
alias prodemp='EMPIRE_API_URL=https://empire.bot.lunohq.com emp'

alias pglog='tail -f /usr/local/var/postgres/pg_log/*'
export VAULT_ADDR='https://vault.lunohq.com'
alias genpass='apg -n 1 -m 20'
alias cleardns='sudo killall -HUP mDNSResponder'
alias dc='docker-compose'
alias jump='ssh -A ubuntu@52.33.0.221'
alias jumpprod='ssh -A ubuntu@54.152.180.3'
alias sd='eval $(docker-machine env default)'
eval "$(rbenv init -)"
export DRONE_SERVER=http://drone.bot.lunohq.com
export DRONE_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoibWhhaG4iLCJ0eXBlIjoidXNlciJ9.37LbsG8oCI5wS0QlFJm0U8Ftu9wakUL0LhQJ_HLsnV4
