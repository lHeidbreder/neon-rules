#!/bin/bash
shopt -s globstar

SEARCHREGEX='todo|fixme|quick ?fix'

if [ "$1" = "list" ]
then grep -ri -E "$SEARCHREGEX" **/*.{tex,csv} > "$(printf '%(%Y-%m-%d)T\n' -1).todo"
exit
fi

TODOS=$(grep -ril -E "$SEARCHREGEX" **/*.{tex,csv,tpl,lua})
if [ "$1" = "open" ]
then for i in $TODOS
    do start $i
    sleep 1
    done
    exit
fi

# When all else fails
printf '%s\n' "${TODOS[@]}"
