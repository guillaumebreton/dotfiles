# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# locale settings
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="yak"

alias grep='grep --color=auto'
alias lsa='ls -alh'
alias fuck='sudo $(fc -ln -1)'

# sublime
export EDITOR='vi'

# bundle exex
alias be='bundle exec'

# taskwarrior
alias t='task ls'
alias tw='task week'
alias tn='task next'
alias tl='task list'
alias tad='task add '

# alias serial

alias s="ls /dev/tty.usb*"

#note taking
dir="${dir:-$HOME/notes/}"
n(){
  if [ "$*" = "" ]; then
    ls $dir | strip_suffix
  else
    ${EDITOR:-vi} "$dir$1.md"
    return $?
  fi
  # if nothing is specified, list the notes
  # open the corresponding notes

}
nd(){
  trash "$dir$1.md"
}
strip_suffix() {
	while read input; do
		echo "${input%.md}"
	done
}

#shell
alias reload='exec $SHELL'

#alias
alias rm='trash'

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails)

source $ZSH/oh-my-zsh.sh


#cd = pushd
setopt histignorealldups
setopt AUTO_PUSHD
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=1000                  # lines of history to maintain in history file.
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS    #ignore all dups
setopt EXTENDED_HISTORY        # save timestamp and runtime information

# Bind end of line, start of line
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line


# Path system
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin


export MONGO_HOME=$HOME/Toolbox/mongo-2.6.4/bin
eval "$(rbenv init -)"

### Add ~/bin/
export PATH="$HOME/bin:$PATH"

export WORKSPACE="/Users/yak/Workspace/"




#post gres
alias pg_start='pg_ctl -D /usr/local/pgsql/data -l logfile start'
alias pg_stop='pg_ctl -D /usr/local/pgsql/data -l logfile stop'


#go path
export GOPATH="$WORKSPACE/go"

#go
export KAFKA_HOME="/Users/yak/Toolbox/kafka_2.9.1-0.8.2.1"

#load extra (github etc)
source ~/.extras


#prompt
PROMPT='%{$fg[green]%}%p%{$fg[blue]%}%c%{$fg[green]%} ⌁ %{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%}% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}●%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ●"

export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/share/npm/bin:$GOPATH/bin:$KAFKA_HOME/bin:$PATH

# eval "$(docker-machine env default)"

#docker
#
alias dm="docker-machine"

denv(){
  eval $(docker-machine env $1)
}
dti(){
  docker run -ti $1 sh
}
dri()  { docker rmi -f $(docker images -q --filter "dangling=true"); }

# make file
alias m="make"
randpwd () {
        local length=${1:-42}
        cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
