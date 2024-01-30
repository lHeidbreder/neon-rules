#!/bin/bash
shopt -s globstar
grep -ril -e 'todo' **/*.{tex,csv}
