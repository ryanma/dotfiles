# # ~/.bashrc: executed by bash(1) for non-login shells.
# # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# # for examples
#
# # If not running interactively, don't do anything
# case $- in
#     *i*) ;;
#       *) return;;
# esac
#
# # don't put duplicate lines or lines starting with space in the history.
# # See bash(1) for more options
# HISTCONTROL=ignoreboth
#
# # append to the history file, don't overwrite it
# shopt -s histappend
#
# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000
#
# # check the window size after each command and, if necessary,
# # update the values of LINES and COLUMNS.
# shopt -s checkwinsize
#
# # If set, the pattern "**" used in a pathname expansion context will
# # match all files and zero or more directories and subdirectories.
# #shopt -s globstar
#
# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi
#
# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
# esac
#
# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# #force_color_prompt=yes
#
# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi
#
# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
#
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac
#
# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias ls='ls --color=auto'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'
#
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi
#
# # some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
#
# # Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
#
# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi
#
# #export PS1="\[\033[38;5;8m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;8m\]>\[$(tput sgr0)\]"
#
# # custom prompt
# EXIT=' \[$(tput bold)\]\[\033[38;5;242m\]$?\[$(tput sgr0)\] '
# USER='\[$(tput bold)\]\[\033[38;5;242m\][\u]\[$(tput sgr0)\] '
# DIR='\[$(tput bold)\]\[\033[38;5;242m\]\W\[$(tput sgr0)\] '
# GIT='\[$(tput bold)\]\[\033[38;5;242m\]$(__git_ps1 "%s ")\[$(tput sgr0)\] '
# NEWLINE='\n'
# END=' > \[\003\]'
# export PS1=$NEWLINE$EXIT$USER$DIR$GIT$NEWLINE$END
#
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export EDITOR=nvim

if [ -f ~/.user_bash_aliases ]; then
    source ~/.user_bash_aliases
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# After omakub installation, symlink this file to to ~/.userrd
# then add these two lines to ~/.bashrc and uncomment them

## add a personal file
# source ~/.userrc

# Custom bash prompt
ARROW=$'\uf0a9 '
PROMPT_COMMAND='PS1_UPSTREAM=$(git rev-parse --abbrev-ref @{upstream} 2> /dev/null || echo "no upstream") PS1_CMD1=$(GIT_PS1_SHOWUNTRACKED_FILES=1 GIT_PS1_SHOWUPSTREAM="verbose name" GIT_PS1_SHOWDIRTYSTATE=1 __git_ps1 " (%s)")';
PS1='\n\[\e[37m\]$?\[\e[0m\] \[\e[37m\]|\[\e[0m\] \[\e[38;5;40m\]\w\[\e[38;5;81m\]${PS1_CMD1}\n\[\e[0m\]$ARROW '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:~/workspace/playbook/bin:$PATH"
