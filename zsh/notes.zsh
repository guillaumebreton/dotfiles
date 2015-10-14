
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

