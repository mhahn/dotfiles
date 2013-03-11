PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
alias post_last='git diff HEAD^ --full-index | post-review --diff-filename=- -o --guess-summary --guess-description'
alias postreview='post-review -o --guess-summary --guess-description'
alias fgrep='grep -HRn'
export PYTHONSTARTUP=$HOME/.pythonstartup
export LSCOLORS="cxfxcxdxbxegedabagacad"
export PATH=/usr/local/lib/node_modules:$PATH
export DH=~/Dropbox/EB_Analytics/Hahn/
export DA=~/Dropbox/EB_Analytics/
export DS=~/Dropbox/EB_Analytics/scriptfolder
export EB=~/Eventbrite/
export DB=~/Dropbox/
export diffs=/Volumes/vmware_home/home/mhahn/work/diffs
export PR="/Users/mhahn/PersonalRepo/"

function vag() {
   if [ $1 ]
   then
       pushd $EB_HOME/django/scripts/vagrant/;
       vagrant $@;
       popd;
   else
       pushd $EB_HOME;
   fi
}
alias rmpyc='find . -name \*.pyc -delete'

# export paths for MySQLdb requirements
export PATH=$HOME/mysql-5.5.12-osx10.6-x86_64/bin:$PATH
export DYLD_LIBRARY_PATH=$HOME/mysql-5.5.12-osx10.6-x86_64/lib:$DYLD_LIBRARY_PATH

source $HOME/.gitcompletion
source /opt/boxen/env.sh
source ~/.local/bin/swiftcommandline.sh
