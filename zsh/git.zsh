# git aliases
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
alias gcapf="gaa && gca && gpf"
alias gcp="gaa && gc && gp"
alias grc="git rebase --continue"

gsu(){
    git branch --set-upstream-to=origin/$1 $1

}

alias pr="hub pull-request -b master -o "
