#!/bin/bash
shopt -s globstar

if [ "$1" = "list" ]
then grep -ri -e 'todo' **/*.{tex,csv} > "$(printf '%(%Y-%m-%d)T\n' -1).todo"
exit
fi

TODOS=$(grep -ril -e 'todo' **/*.{tex,csv,tpl})
if [ "$1" = "open" ]
then for i in $TODOS
    do start $i
    sleep 1
    done
    exit
fi

# When all else fails
printf '%s\n' "${TODOS[@]}"
