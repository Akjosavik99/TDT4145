import sqlite3 as sql
from datetime import datetime, timedelta
import math

con = sql.connect('tog.db')
c = con.cursor()

def opptattePlasser(forekomstID, delstrekningID):

    #opptattePlasser {delstrekningID} = [[plass, radnummer, vognID]]]
    opptattePlasser = {}
    
    c.execute("""
        SELECT sb.setenummer, sb.radnummer, sb.vognID FROM Sittebillett AS sb
        JOIN Billett AS b ON b.billettID = sb.billettID
        JOIN Togruteforekomst AS tf ON tf.forekomstID = b.forekomstID
        JOIN Delstrekning AS d ON d.delstrekningID = sb.delstrekningID
        WHERE tf.forekomstID = :forekomstID AND d.delstrekningID = :delstrekningID
        """,
        {"forekomstID": forekomstID, "delstrekningID": delstrekningID}
    )
    res = c.fetchall()
    print(res)
    for setenummer, radnummer, vognID in res:
        if (delstrekningID not in opptattePlasser):
            opptattePlasser[delstrekningID] = [[setenummer, radnummer, vognID]]
        else:
            opptattePlasser[delstrekningID].append([setenummer, radnummer, vognID])

    return opptattePlasser

print(opptattePlasser(1, 1))
