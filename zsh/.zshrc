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
#shell
alias reload='exec $SHELL'

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
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/share/npm/bin:$MONGO_HOME:$PATH
eval "$(rbenv init -)"

### Add ~/bin/
export PATH="$HOME/bin:$PATH"


#post gres
alias pg_start='pg_ctl -D /usr/local/pgsql/data -l logfile start'
alias pg_stop='pg_ctl -D /usr/local/pgsql/data -l logfile stop'

#mongo db
alias mongo_start='mongod run --quiet --dbpath ~/Toolbox/mongo > /dev/null 2>&1'

#go path
export GOPATH=$HOME/.go

#load extra
source ~/.extras


#prompt
PROMPT='%{$fg[green]%}%p%{$fg[blue]%}%c%{$fg[green]%} ⌁ %{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%}% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}●%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ●"

