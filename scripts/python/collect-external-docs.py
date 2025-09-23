#!/usr/bin/python
import os, sys
from csv import DictWriter
from pathlib import Path

#get main directory as reference
main_dir = None
for p in Path(os.path.realpath(__file__)).parents:
    if p.name == 'neon-rules':
        main_dir = p
        break
if main_dir is None:
    sys.exit(f'Script called from strange location: {os.path.realpath(__file__)}')

#set target to write to
target_file = main_dir / 'externaldocs.csvin'
target_file.unlink(missing_ok=True)

#get tex files
docs = []
for doc in main_dir.glob('*/*.tex'):
    doc_info = {}
    doc_info['prefix'] = doc.name[0:(doc.name.find('-') if doc.name.find('-') != -1 else doc.name.find('.'))]
    doc_info['book'] = doc.name[0:-4]
    doc_info['path'] = doc.parent.name

    doc_info['package_path'] = '.'
    if doc.parent.name.startswith('addon-'):
        doc_info['package_path'] = 'addons'
    elif doc.parent.name == 'missions':
        doc_info['package_path'] = 'missions'
    elif doc.parent.name == 'supplements':
        doc_info['package_path'] = 'supplements'

    docs.append(doc_info)

with open(target_file, 'w', newline='') as target:
    w = DictWriter(target, docs[0].keys(), dialect='unix')
    w.writeheader()
    for line in docs:
        w.writerow(line)
