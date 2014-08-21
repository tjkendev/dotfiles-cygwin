# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

export PATH="~/bin:/bin:/usr/local/bin:/usr/sbin:/sbin:"

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d "${HOME}/man" ]; then
  MANPATH="${HOME}/man:${MANPATH}"
fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
#source ~/.nvm/nvm.sh
export PATH=$PATH:~/.nodejs/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ndenv
#export PATH="$HOME/.ndenv/bin:$PATH"
#echo "$(ndenv init -)"

# node.js (in Windows)
export PATH="/cygdrive/c/app/nodejs:$PATH"
export PATH="~/node_modules/.bin/:$PATH"

# java and apache
export PATH="/cygdrive/c/Program Files (x86)/Java/jdk1.7.0_45/bin:$PATH"

export JAVA_HOME="/cygdrive/c/Program Files (x86)/Java/jdk1.7.0_45"
export ANT_HOME="/usr/local/apache-ant-1.9.4/"
export PATH="/usr/local/apache-ant-1.9.4/bin:$PATH"

# terminal
#export PS1="\[\033[42m\]\u@\h\[\033[49m\]:\[\033[33m\]\w\[\033[39m\] \$ "
#export PS1="\[\033[42m\]\u\[\033[49m\]:\[\033[33m\]\w\[\033[39m\] \$ "
export PS1="\[\033[42m\]\s@\u\[\033[49m\]:\[\033[33m\]\w\[\033[39m\] \$ "
#export PS1="[\[\033[42m\]\s@\u\[\033[49m\]:\[\033[33m\]\w\[\033[39m\]]\$ "
