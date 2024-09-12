import csv, sys

if __name__ == '__main__':
    # collect sys args
    if len(sys.argv) < 2:
        raise SyntaxError("You are missing command line arguments: (1) a file path to split and (2) a column name which to split by.")
    if len(sys.argv) < 3:
        raise SyntaxError("You are missing a command line argument: (1) a column name which to split by.")
    src_filepath = sys.argv[1]
    out_filepath_prefix = src_filepath[:-4]
    colname = sys.argv[2]
    extracted_tables = {}
    
    # read tables from source file
    with open(src_filepath, encoding="utf-8") as srcfile:
        for row in csv.DictReader(srcfile):
            if row[colname] not in extracted_tables.keys():
                extracted_tables[row[colname]] = []
            extracted_tables[row[colname]].append(row)
            
    # write tables to their own files
    for key, tbl in extracted_tables.items():
        with open(out_filepath_prefix + "-" + key + ".csvin", mode="w", newline="", encoding="utf-8") as outfile:
            writer = csv.DictWriter(outfile, tbl[0].keys())
            writer.writeheader()
            writer.writerows(tbl)
