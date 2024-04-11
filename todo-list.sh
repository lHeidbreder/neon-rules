#!/bin/bash
shopt -s globstar

if [ "$1" = "list" ]
then grep -ri -e 'todo' **/*.{tex,csv} > "todos$(printf '%(%Y-%m-%d)T\n' -1).txt"
exit
fi

TODOS=$(grep -ril -e 'todo' **/*.{tex,csv})
if [ "$1" = "open" ]
then for i in $TODOS
    do start $i
    sleep 1
    done
    exit
fi

# When all else fails
printf '%s\n' "${TODOS[@]}"
