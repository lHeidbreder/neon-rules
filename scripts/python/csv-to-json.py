#!/usr/bin/python
from typing import List, Dict
import csv, json
from pathlib import Path
from argparse import ArgumentParser

parser = ArgumentParser(
    prog='CSV to JSON',
    description='Transform the old CSV files to more maintainable JSON files.'
)
parser.add_argument('source')
parser.add_argument('--target',default=None)

def read_csv(path: Path) -> List[Dict[str,str]]:
    rtn = []
    with open(path) as f:
        reader = csv.DictReader(f)
        for line in reader:
            rtn.append(line)
    return rtn

def handle_itemize(dict: Dict[str,str]) -> Dict[str,str | List[str]]:
    for k in dict.keys():
        if k.lower().startswith('itemize') and dict[k] is not None:
            dict[k] = [e.strip() for e in dict[k].split(';')]

def make_json(csv: List[Dict[str,str]]) -> str:
    return json.dumps(csv, indent=4)

def write_out_json(obj: str, target: Path):
    with open(target, 'w') as f:
        f.write(obj)

if __name__ == '__main__':
    args = parser.parse_args()

    data_in_path = Path(args.source).absolute()
    if args.target is None:
        args.target = args.source.replace('.csv', '.json')
    data_out_path = Path(args.target).absolute()
    
    data_in = read_csv(data_in_path)
    data_cleaned = [handle_itemize(row) for row in data_in]
    data_out = make_json(data_in)
    
    write_out_json(data_out, data_out_path)
