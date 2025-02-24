#!/bin/bash
shopt -s globstar

SEARCHREGEX='todo|fixme|quick ?fix'
FILES=$(echo **/*.{tex,csv,tpl,lua,py})

if [ "$1" = "list" ]
then FILENAME="$(printf '%(%Y-%m-%d)T\n' -1).todo"
grep -nri -E "$SEARCHREGEX" $FILES |
    sort -t ':' -k 2 -n | # order numerically by line number (specific)
	sort -t ':' -k 1 | # order by document (generic)
	awk -F'/' 'NR == 1 || $1 != prev {if (NR != 1) print ""; prev = $1} {print}' | # add empty lines between new folders
	tee $FILENAME | # write to file
	sed '/^\s*$/d' | wc -l | sed 's/.*/\n& entries/' >> $FILENAME # add amount of entries to bottom
exit
fi

TODOS=$(grep -ril -E "$SEARCHREGEX" $FILES)
if [ "$1" = "open" ]
then for i in $TODOS
    do start $i
    sleep 1
    done
    exit
fi

# When all else fails
printf '%s\n' "${TODOS[@]}"
