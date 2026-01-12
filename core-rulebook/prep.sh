cd equipment/
python ../../scripts/python/split_csv.py armor.csv group
python ../../scripts/python/split_csv.py meleecomponents.csv type
cd ../prefabs/
python ../../scripts/python/split_json.py prefab-stats.json name
