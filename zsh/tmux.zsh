# Tmux function definition

# Move to sub directory of the ~/Workspace/../
# dev() {
#   local target=$1
#   local fulltarget=`find ~/Workspaces -path "*/*$target" -type d -maxdepth 2 -mindepth 2 | head -n1`
#   cd $fulltarget
#   tmux rename-window $target
#   tmux split-window -h -c $fulltarget
#   tmux select-pane -t 1
#   vi
#   tmux select-pane -t 2
#   cd $fulltarget
# }

# _dev(){
#   dirs=`find ~/Workspaces/ -maxdepth 2 -mindepth 2 -type d | xargs -n1 basename`
#   while read -r line; do
#     compadd $line
#   done <<< "$dirs"
# }

# compdef _dev dev
