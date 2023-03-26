import os
import sqlite3
import sys

def exexuteSql(filename):
    conn = sqlite3.connect('tog.db')
    c = conn.cursor()
    fd = open(filename, 'r')
    sqlFile = fd.read()
    fd.close()
    # all SQL commands (split on ';')
    sqlCommands = sqlFile.split(';')

    # Execute every command from the input file
    for command in sqlCommands:
        # This will skip and report errors
        # For example, if the tables do not yet exist, this will skip over
        # the DROP TABLE commands
        try:
            c.execute(command)
        except sqlite3.OperationalError as msg:
            print("Command skipped: ", msg)
    conn.commit()

# Delete current database in directory
try:
    os.remove(os.path.join(os.getcwd(), "tog.db"))
except FileNotFoundError:
    pass

# Create a new instance of the database
fd = open('tog.db', 'w')
fd.close()

files = []

if (len(sys.argv) > 1 ):
    if (sys.argv[1] == "-fd"):
        files = ["tog.sql", "brukerhistorieA.sql", 'brukerhistorieB.sql', 'brukerhistorieF.sql', 'test_data.sql']
    elif (sys.argv[1] == "-f"):
        files = ["tog.sql", "brukerhistorieA.sql", 'brukerhistorieB.sql', 'brukerhistorieF.sql']
    elif (sys.argv[1] == "-m"):
        files = ["tog.sql"]
    else:
        print("Usage: python3 dbgen.py -f OR python3 dbgen.py -fd python3 dbgen.py -m ")
else:
    print("Usage: python3 dbgen.py -f OR python3 dbgen.py -fd python3 dbgen.py -m ")

for file in files:
    exexuteSql(file)