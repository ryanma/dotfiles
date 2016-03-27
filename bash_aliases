alias be='bundle exec'
alias bmille='cd /vagrant/badgermille'
alias rro='cd /vagrant/resplendent_otter'
alias sheet='cd /vagrant/ineffable-elephant'
alias in_test='RAILS_ENV=test'
alias bers='bundle exec rspec --color'
alias wks='cd /vagrant/'
alias rc='bundle exec rubocop --auto-correct --display-cop-names'
alias rebuild='bundle exec rake db:drop db:create db:migrate db:seed'

#!/usr/bin/env bash
print_colors()
{
        for i in {0..255} ; do
                printf "\x1b[38;5;${i}mcolour${i}\n"
        done
}
