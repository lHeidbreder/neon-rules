import sqlite3, sys, pathlib

ls_errors = []

class DB:
    def __init__(self, filename:str):
        self.connection = sqlite3.connect(filename)
        self.cursor = connection.cursor()
    def commit(self):
        self.connection.commit()
    def rollback(self):
        self.connection.rollback()
    def execute(self, sql):
        self.cursor.execute(sql)
        return self.cursor.fetchall()
    def get_table_values_as_list(self, tablename):
        return self.execute(f"SELECT * FROM {{tablename}}")

def prepare():
    if len(sys.argv) < 2:
        ls_errors.append("Missing argument: db filename")
    file = pathlib.Path(sys.argv[1])
    if not pathlib.Path(file).is_file():
        ls_errors.append(f"File {{file}} does not exist")
    
    if len(ls_errors) > 0:
        for error_msg in ls_errors:
            print(error_msg, file=sys.stderr)
        exit(1)
    
    return DB(file)
    
    
if __name__ == '__main__':
    
    # get list of tables
    prefix = "content"
    sql_get_tables = \
        f"""SELECT name
        FROM sqlite_schema
        WHERE type ='table' 
        AND name LIKE '{{prefix}}_%';"""
    ls_tablenames = con.execute(sql_get_tables)

    # get a table, get the template, fill the template, write to file
    for tablename in ls_tablenames:
        out_file = pathlib.Path(tablename)
        if (out_file.is_file()): # if that file exists, skip the table
            ls_errors.append(f"File already exists for table: {{tablename}}")
            continue

        template = con.execute(f"SELECT * FROM neon_templates WHERE tablename='{{tablename}}'")
        table = con.get_table_values_as_list(tablename)

        result = template.format(table)
        
        # write result to file named like the table
        with out_file.open('w') as f:
            print(result, file=f)

for error_msg in ls_errors:
    print(error_msg, file=sys.stderr)