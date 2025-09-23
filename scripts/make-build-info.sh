NL='\\'
MAIN_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.."

# clean previous build info
TARGET_FILE="${MAIN_DIR}/core-rulebook/config/builddata.texin"
[ -f $TARGET_FILE ] && rm $TARGET_FILE

# gather build info
COPYRIGHT_NOTICE="" #FIXME
HOST_URL="github.com/lheidbreder/neon-rules" # TODO: can I get the url from somewhere?
GIT_COMMIT=$(git log --pretty=format:'%H' -n 1) # lowercase h for short commit, uppercase for long commit
CHANGED_FILES=$(git diff HEAD --name-only | sed -e 's/_/\\_/g') # escape underscores for tex or every build will break
TIME=$(date)

# gather misc info
WALLPAPER="${MAIN_DIR}/art/colophon-wallpaper.png"

# write out
touch $TARGET_FILE

OUT="%metadata
\\clearpage
\\pagestyle{empty}
\\vspace*{\\fill}
\\IfFileExists{${WALLPAPER}}{
    \\ThisCenterWallpaper{${WALLPAPER}}
    }{}
${COPYRIGHT_NOTICE}
${HOST_URL}
\\par
${TIME}$NL
${GIT_COMMIT}"

[ -z "${CHANGED_FILES}" ] || OUT=$(echo "$OUT $NL Modified: ${CHANGED_FILES}")

echo "$OUT" > $TARGET_FILE
