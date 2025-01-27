_compileall()
{
    _goals="XCLEAN CLEAN FADE PREP COMPILE PACKAGE ALL"

    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${_goals}" -- ${cur}) )

    return 0
}
complete -F _compileall ./scripts/compileall.sh

_todo()
{
    _goals="list open"

    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${_goals}" -- ${cur}) )

    return 0
}
complete -F _todo ./todo-list.sh
