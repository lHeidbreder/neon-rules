#!/bin/bash
grep -ril -e 'todo' . | grep -E '(.tex)|(.csv)$'
