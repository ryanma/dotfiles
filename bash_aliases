
alias be='bundle exec'
alias bers='bundle exec rspec --color'
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
