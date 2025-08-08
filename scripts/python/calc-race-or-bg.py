#!/usr/bin/env python3
#Example usage:
#   find -name '*background*.json' -exec python scripts/python/calc-race-or-bg.py {} \;
#   find -name '*race*json' -exec python scripts/python/calc-race-or-bg.py -r {} \;

from typing import List

import re
import csv, json

import os
from pathlib import Path
root_path = Path(re.sub(r"(?<=neon-rules/).*$", "", os.path.realpath(__file__)))

def dbgprint(v):
    if args.debug: print(">>DEBUG - " + str(v))
def try_access_key(dict: dict, key):
    if key in dict.keys():
        return dict[key]
    return None

# CLI ARGS
from argparse import ArgumentParser
parser = ArgumentParser()
parser.add_argument('file')
parser.add_argument('-r', '--israce', action='store_true')
parser.add_argument('-v','--debug',action='store_true')
args = parser.parse_args()
dbgprint(f"Running in {'RACE' if args.israce else 'BACKGROUND'} calculation mode")

# GLOBALS
char_factor = 0.8
FREE_CHARACTERISTIC = 25 if args.israce else 0 # base characteristic is 25 each, anything beyond costs
free_xp_in_skills = 0 if args.israce else 2200 # 2200 XP worth for free on backgrounds

known_boons = None
known_banes = None
known_abilities = None
known_traits = None

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
    if key in dict.keys():
        return int(dict[key])
    stripped_key = re.sub(r'\(.*?\)$','',key).strip()
    if stripped_key in dict.keys():
        return int(dict[stripped_key])
    return 0

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

def reader_by_doc_type(fhandle, type):
    match type[1:]:
        case "json" | "jsonin":
            dbgprint("Is JSON")
            return json.loads(fhandle.read())
        case "csv" | "csvin":
            dbgprint("Is CSV")
            return csv.DictReader(fhandle)
    raise TypeError(f"Is unknown file type: {type}")

def restitch_iterable(iterable: List | str) -> str:
    if isinstance(iterable, str):
        return str
    return ';'.join(iterable)

###STEPS###
# open CSV
with open(args.file) as fhandle:
    reader = reader_by_doc_type(fhandle, Path(args.file).suffix)
    for line in reader:
        calculated_cost = 0

        char_keys = ('cr','int','ins','ch','dex','ag','con','str')
        avg_other_modifiers = sum([parseint(e) for e in re.findall(r"(?<=\+)\d+", restitch_iterable(line['itemize:other_modifiers'] or ""))]) / len(char_keys)
        characteristics = [parseint(line[c])+avg_other_modifiers for c in char_keys]
        characteristics = [0.1*pow(c-FREE_CHARACTERISTIC, 2) for c in characteristics]
        dbgprint(f"Characteristics: {characteristics}")
        calculated_cost += sum(characteristics)

        # (XP cost of skills)/250
        # TODO: This does not parse correctly. I will consider it close enough for now.
        cost = []
        for e in re.findall(r"(?<=\+)\d+", restitch_iterable(line['itemize:skills'] or "")):
            cost.append(sum([200*(parseint(l)+1) for l in range(parseint(e))])) # "l+1" because range starts at 0 and is exclusive at the end
        dbgprint(f"Skills: {cost} XP")
        calculated_cost += (sum(cost)-free_xp_in_skills)/250

        # (XP cost of abilities)/125
        abilitycost = 0
        if not try_access_key(line,'abilitycostoverride'):
            for e in (line['itemize:abilities'].split(';') if isinstance(line['itemize:abilities'], str) else line['itemize:abilities']):
                abilitycost += lookup_ability_cost(e)
        else: abilitycost = int(try_access_key(line,'abilitycostoverride') or 0)
        dbgprint(f"Abilities: {abilitycost} XP")
        calculated_cost += abilitycost/125

        # (GP cost of Boons-Banes)/3
        booncost = 0
        if not try_access_key(line,'booncostoverride'):
            for e in (line['itemize:boons'].split(';') if isinstance(line['itemize:boons'], str) else line['itemize:boons']):
                booncost += lookup_boon_cost(e)
        else: booncost = int(try_access_key(line,'booncostoverride') or 0)
        dbgprint(f"Boons: {booncost}")
        banecost = 0
        if not try_access_key(line,'banecostoverride'):
            for e in (line['itemize:banes'].split(';') if isinstance(line['itemize:banes'], str) else line['itemize:banes']):
                banecost += lookup_bane_cost(e)
        else: banecost = int(try_access_key(line,'banecostoverride') or 0)
        dbgprint(f"Banes: {banecost}")
        calculated_cost += (booncost-banecost)/3

        # cost of traits, if given
        traitcost = 0
        if not try_access_key(line, 'traitcostoverride'):
            traits = line['itemize:traits'] if 'itemize:traits' in line.keys() else []
            for e in (traits.split(';') if isinstance(traits, str) else traits):
                dbgprint(e)
                traitcost += lookup_trait_cost(e)
        else: traitcost = try_access_key(line, 'traitcostoverride')
        dbgprint(f"Trait Cost: {traitcost}")
        calculated_cost += traitcost

        variant = (" - " + line['variant']) if ('variant' in line.keys() and line['variant'] is not None) else ""
        verdict = "close enough" if round(calculated_cost) == int(line['cost'] or 0) else "\033[91mtoo far\033[0m"
        print(f"{line['name']}{variant}: {round(calculated_cost,2):0.2f} (currently {line['cost']}, {verdict})")
        dbgprint("\n")
