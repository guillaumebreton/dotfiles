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
alias gpf="git push -f"
alias gpu="git pull"
alias grh="git reset --hard head"
alias gri="git rebase -i"

gpor(){
  open $(grep 'remote:.*https://' $(git push) | sed 's|remote:.*https|https|g')
}
