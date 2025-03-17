#!/bin/bash
SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DEPENDENCIES="
    https://raw.githubusercontent.com/rxi/json.lua/refs/heads/master/json.lua
"
rm -r $SCRIPTS_DIR/dependencies/

for d in $DEPENDENCIES; do
    wget -P $SCRIPTS_DIR/dependencies/ $d
done
