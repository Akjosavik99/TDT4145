import os
import sqlite3

# Sletter nåværende tog database
try:
    os.remove(os.path.join(os.getcwd(), "tog.db"))
except FileNotFoundError:
    pass

fd = open('tog.db', 'w')
fd.close()

conn = sqlite3.connect('tog.db')
c = conn.cursor()

# Create all tables

fd = open('tog.sql', 'r')
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

sqlCommands = ""

# Insert data from A

fd = open('brukerhistorieA.sql', 'r')
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

sqlCommands = ""
# Insert data from B

fd = open('brukerhistorieB.sql', 'r')
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