#!/bin/bash
shopt -s globstar

SEARCHREGEX='todo|fixme|quick ?fix'

if [ "$1" = "list" ]
then FILENAME="$(printf '%(%Y-%m-%d)T\n' -1).todo"
grep -ri -E "$SEARCHREGEX" **/*.{tex,csv,tpl,lua} |
	sort |
	awk -F'/' 'NR == 1 || $1 != prev {if (NR != 1) print ""; prev = $1} {print}' | # add empty lines between new folders
	tee $FILENAME | # write to file
	sed '/^\s*$/d' | wc -l | sed 's/.*/\n& entries/' >> $FILENAME # add amount of entries to bottom
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
