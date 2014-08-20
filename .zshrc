# Created by newuser for 5.0.2
export LANG=ja_JP.UTF-8

#export JLESSCHARSET=japanese-sjis
#export OUTPUT_CHARSET=sjis

autoload -Uz compinit
compinit
autoload colors
colors
# alias ls='ls -pla'

setopt prompt_subst

#like vim
bindkey -v

#aut cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# environment variable
export CYGWIN=tty

export PS1="%F{2}%n@%M %F{3}%~%f %% "

# history
export HISTSIZE=2000
export HISTFILE="$HOME/.zhist"
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks

setopt inc_append_history
setopt share_history

setopt nobeep
