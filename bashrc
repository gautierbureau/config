# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## When Bash is invoked as a Login shell;
## Login process calls /etc/profile
## /etc/profile calls the scripts in /etc/profile.d/
## Login process calls ~/.bash_profile
## ~/.bash_profile calls ~/.bashrc
## ~/.bashrc calls /etc/bashrc

## Non-login process(shell) calls ~/.bashrc
## ~/.bashrc calls /etc/bashrc
## /etc/bashrc calls the scripts in /etc/profile.d/

# /etc/profile calls /etc/bashrc
# /etc/bashrc defines PS1
# /etc/bashrc calls /etc/bashrc_Apple_Terminal

shopt -s histappend

HISTFILESIZE=1000000
HISTSIZE=1000000
HISTIGNORE='ls:bg:fg'
#HISTTIMEFORMAT='%F %T '

# User specific aliases and functions
if [ -f ~/Config/bashrc-alias.bash ]; then
  . ~/Config/bashrc-alias.bash
fi

if [ -f ~/Config/bashrc-functions.bash ]; then
  . ~/Config/bashrc-functions.bash
fi

if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# added by travis gem
# [ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
# source /home/bureaugau/.travis/job_stages
