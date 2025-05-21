#!/usr/bin/python
import sys
import json
from pathlib import Path
from functools import cmp_to_key

#display help text
if len(sys.argv) < 2:
    print("Adjust the compare function and pass the JSON file as a CLI arg.")
    exit()

in_file = Path(sys.argv[1])

#[:upper:] < [:lower:]
#'a' < 'b'
def compare(a, b):
    if a['type'] > b['type'] \
        or (a['type'] == b['type'] and a['name'] < b['name']):
        return -1
    return 1

s = None
with open(in_file) as fhandle:
    data:list = json.loads(fhandle.read())
    s = sorted(data, key=cmp_to_key(compare))

if s is None:
    exit(1)

target_file = in_file.with_suffix('.sorted')
with open(target_file, 'w') as fhandle:
    fhandle.write(json.dumps(s))
