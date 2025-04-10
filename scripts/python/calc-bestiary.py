#!/usr/bin/python
from typing import List

import re
import csv, json

from texttable import Texttable

import os
from pathlib import Path
root_path = Path(re.sub(r"(?<=neon-rules/).*$", "", os.path.realpath(__file__)))

#region CLI ARGS
from argparse import ArgumentParser
parser = ArgumentParser()
parser.add_argument('file', type=Path)
parser.add_argument('-v','--debug',action='store_true')
args = parser.parse_args()
#endregion

# GLOBALS
combat_divisor = 20
social_divisor = 3

known_boons = None
known_banes = None
known_abilities = None
known_traits = None

#region UTILS
def dbgprint(v):
    if args.debug: print(">>DEBUG - " + str(v))

def try_access_key(dict: dict, key):
    if key in dict.keys():
        return dict[key]
    return None

def load_cost_file(path: Path) -> dict:
    if not path.is_file():
        path = path.with_suffix('.json')

    rtn = {}
    with open(path) as fhandle:
        reader = reader_by_doc_type(fhandle, Path(path).suffix)
        for line in reader:
            rtn[line['name']] = line['cost']
    dbgprint("Loaded: " + str(rtn))
    return rtn

def lookup(dict: dict, key):
    if key not in dict.keys():
        return int(dict[re.sub('\(.*?\)$','',key).strip()])
    return int(dict[key])

def lookup_boon_cost(key: str) -> int:
    if not key: return 0
    global known_boons
    if known_boons is None:
        known_boons = load_cost_file(root_path/"core-rulebook"/"lists"/"boons.csv")
    return lookup(known_boons, key)

def lookup_bane_cost(key: str) -> int:
    if not key: return 0
    global known_banes
    if known_banes is None:
        known_banes = load_cost_file(root_path/"core-rulebook"/"lists"/"banes.csv")
    return lookup(known_banes, key)

def lookup_ability_cost(key: str) -> int:
    if not key: return 0
    global known_abilities
    if known_abilities is None:
        known_abilities = load_cost_file(root_path/"core-rulebook"/"lists"/"maneuver-abilities.csv") | \
                            load_cost_file(root_path/"core-rulebook"/"lists"/"abilities.csv")
    return lookup(known_abilities, key)

def lookup_trait_cost(key: str) -> int:
    global known_traits
    if known_traits is None:
        known_traits = load_cost_file(root_path/"core-rulebook"/"lists"/"traits.csv")
    return lookup(known_traits, key)

def parseint(val) -> int:
    return int(val) if val else 0

def parsefloat(val) -> float:
    return float(val) if val else 0.0

def reader_by_doc_type(fhandle, type):
    match type[1:]:
        case "json" | "jsonin":
            dbgprint("Is JSON")
            return json.loads(fhandle.read())
        case "csv" | "csvin":
            dbgprint("Is CSV")
            return csv.DictReader(fhandle)
    raise TypeError(f"Is unknown file type: {type}")
#endregion

with open(args.file) as fhandle:
    reader = reader_by_doc_type(fhandle, Path(args.file).suffix)
    
    header = ("Name", "Social", "Current", "Combat", "Current")
    rtn = [header]
    for line in reader:
        dbgprint(line['name'])
        if line['name'].startswith('%'):
            dbgprint("Skipping")
            continue

        #social
        characteristics = (parseint(line['cr']) + parseint(line['ch']))/10 #TODO: add instinct?
        skills = parseint(line['sum:social_skills']) #TODO: get dynamically?
        social = (characteristics+skills)/social_divisor

        #combat
        defenses = ( parseint(line['con'])/10 + parsefloat(line['avg_armor']) ) * float(line['hp'].replace('%','e-2'))
        dbgprint(f"Defenses: {defenses}")
        characteristics = ( parseint(line['cr']) + parseint(line['int']) + parseint(line['ins']) + parseint(line['dex']) + parseint(line['str']) )/5
        dbgprint(f"Characterisitics: {characteristics}")
        skills = 5 * parseint(line['sum:combat_skills']) + parseint(line['avg_raw_dmg'])
        dbgprint(f"Skills: {skills}")
        traits = parseint(line['positive_traits-negative_traits'])/10 + 1 #TODO: can be negative?
        dbgprint(f"Traits: {traits}")
        combat = (defenses + characteristics + skills) * traits / combat_divisor
        dbgprint(f"Combat Rating {combat}")
        
        rtn.append(( \
            line['name'], \
            social, \
            f"{line['difficulty_social']} {f'(should be {round(social)})' if line['difficulty_social'] != '' and round(social) != parseint(line['difficulty_social']) else ''}", \
            combat, \
            f"{line['difficulty_combat']} {f'(should be {round(combat)})' if line['difficulty_combat'] != '' and round(combat) != parseint(line['difficulty_combat']) else ''}" \
            ))
        dbgprint("\n=======\n")
    
    table = Texttable(120)
    table.set_cols_align( ("l","r","r","r","r") )
    table.add_rows(rtn)

    print(table.draw())
