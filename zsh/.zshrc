# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# locale settings
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# sublime
export EDITOR='vi'

#shell
alias reload='exec $SHELL'

plugins=(git docker)

#history and general option
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt auto_pushd

# Bind end of line, start of line
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey -e

#prompt
ZSH_THEME="yak"
PROMPT='%{$fg[green]%}%p%{$fg[blue]%}%c%{$fg[green]%} ⌁ %{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%}% %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ●"

#set path
export WORKSPACE="/Users/yak/Workspace/"
export MONGO_HOME=$HOME/Toolbox/mongo-2.6.4/bin
export KAFKA_HOME="/Users/yak/Toolbox/kafka_2.9.1-0.8.2.1"

export PATH="$HOME/bin:$PATH"
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/share/npm/bin:$GOPATH/bin:$KAFKA_HOME/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# make file
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#load extra (github etc)
source ~/.extras

for dotfile in ~/zsh/*
do
  if [ -r "${dotfile}" ]; then
    source "${dotfile}"
  fi
done
