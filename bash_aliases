
alias be='bundle exec'
alias bers='bundle exec rspec --color'
alias clipcopy="wl-copy"
alias gd="git diff"
alias gwd="git diff --word-diff"
alias gs="git status"
alias in_test='RAILS_ENV=test'
alias ll="ls -al"
alias clear="clear -x"
alias src="cd ~/workspace"
# alias z="zoxide"

# WelcomeHome specific aliases and ENV vars
alias whs="cd ~/workspace/whs"
alias wh="cd ~/workspace/whs/welcomehome"
alias pb="cd ~/workspace/whs/playbook"
export CONSOLE_SESSIONS_LOG_DIR="/home/ryan/WelcomeHome Software Dropbox/Development/console-sessions"

# user specific functions
last_migration() {
  vim db/migrate/$(ls db/migrate/ | sort | tail -1)
}

#!/usr/bin/env bash
print_colors() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

watchexec_welcomehome() {
  if [[ -n "$1" && "$1" != "V" ]]; then
    watchexec -c clear -d 100 -w app -w test -w bin -w config -w lib -w spec rails test $@
  else
    echo "Specify a path!" >&2
  fi
}
alias wrt=watchexec_welcomehome

rails-routes-grep () {
  md5="$(md5sum ./config/routes.rb | cut -d " " -f 1)"
  cache="tmp/routes.rb-${md5}"
  if [[ -f "$cache" ]]
  then
    tput setaf 2
    echo "[Using cached routes ${cache}]" >&2
    echo "" >&2
    tput sgr0
    routes="$(cat "$cache")"
  else
    routes="$(rails routes)"
    echo "$routes" > "$cache"
  fi
  echo "$routes" | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.venv,venv} "${1:-}"
}
alias rrg=rails-routes-grep
