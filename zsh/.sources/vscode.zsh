vs () {
    if [ -z "$1" ]
    then
        code -a .
    else
        code -a $@
    fi
}
