set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set blue (set_color blue)
set gray (set_color -o black)

function fish_prompt

  set last_status $status
  if not set -q -g __fish_git_functions_defined
      set -g __fish_git_functions_defined
      function _git_branch_name
          echo "branch_name"
          echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
      end
      function _is_git_dirty
          echo "is_dirty"
          echo (git status -s --ignore-submodules=dirty ^/dev/null)
          echo $status
      end
  end
  # if git branch
  if [ (_git_branch_name) ]
      set git_info ""(_git_branch_name)""

      # if dirty
      if [ (_is_git_dirty) ]
          set -l dirty "$red ●"
          set git_info "$git_info$dirty"
      else
          set -l dirty "$green ●"
          set git_info "$git_info$dirty"
      end
  end

  set_color blue
  printf '%s' (basename (prompt_pwd))
  if [ $last_status -ne 0 ]
    set_color red
  else
    set_color green
  end
  printf ' ⌁ '
  set_color normal
  printf '%s ' $git_info

  set_color normal
end

function fish_mode_prompt --description 'Displays the current mode'
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold red
                echo 🅽
            case insert
                set_color --bold green
                echo 🅸
            case replace-one
                set_color --bold green
                echo 🆁
            case visual
                set_color --bold blue
                echo 🆅
        end
        set_color normal
        printf "  "
    end
end

set -g fish_key_bindings fish_vi_key_bindings


# General alias
alias ls='ls -lhG'
alias reload='source ~/.config/fish/config.fish'

# Alias vi
set EDITOR nvim
alias vi='nvim'
alias m='make'

# Direnv loading
eval (direnv hook fish)

# Alias for taskwarrior
alias t='task ls'
alias tw='task week'
alias tn='task next'
alias tl='task list'

function te --description "edit a task"
    task $argv[1] edit
end
function tt --description "schedule a task today"
    task $argv[1] mod sched:today
end

function ts --description "start a task"
    task $argv[1] start
end


function tad --description "add a task and schedule it today"
  task add $argv sched:today
end

function tp --description "Postpone a task" --argument-names 'taskid' 'date'
    if [ $date != "" ]
      task $argv[1] mod due: sched:$argv[2]
    else
      task $argv[1] mod due: sched:tomorrow
    end
end

function tomo --description "List tomorrow task"
    task list sched:tomo due:tomo
end

#----------------------------------------------------------------------
# GIT
#----------------------------------------------------------------------
alias gco="git checkout"
alias gc="git commit"
alias gst="git status"
alias gs="git stash"
alias gsp="git stash pop"
alias gd="git diff"
alias gds="git diff --staged"
alias gcm="git commit -m "
alias gca="git commit --amend "
alias gaa="git add --all"
alias gp="git push"
alias gpa="git push --tags"
alias gpf="git push --force-with-lease"
alias gpu="git pull"
alias grh="git reset --hard head"
alias gri="git rebase -i"
alias gcapf="gaa ;and gca ;and gpf"
alias gcp="gaa ;and gc ;and gpf"



function posix-source
    for i in (cat $argv)
        set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
end

#source extras local definition
if test -e ~/.config/fish/extras.fish
    source ~/.config/fish/extras.fish
end

source /Users/guillaume/.config/fish/functions/fish_user_key_bindings.fish

