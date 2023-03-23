import sqlite3 as sql
from datetime import datetime, timedelta

con = sql.connect('tog.db')
c = con.cursor()

# For en bruker skal man kunne finne all informasjon om de kjøpene hen har gjort for fremtidige
# reiser. Denne funksjonaliteten skal programmeres.
def BH_h():
    tlf =  int(input("Skriv inn telefonnummeret ditt: "))

    c.execute("""
    SELECT 
    tf.ruteID, tf.dato, t.hovedretning, bs1.stasjonsType, s1.stasjonsnavn, sb.vognID, sb.radnummer, sb.setenummer, bs2.stasjonsType, s2.stasjonsnavn, so.vognID, so.kupenummer, so.antallSenger
    FROM Kunde AS k

    JOIN Ordre AS o ON o.kundenummer = k.kundenummer
    JOIN Billett AS b ON b.ordrenummer = o.ordrenummer
    LEFT JOIN Sittebillett AS sb ON sb.billettID = b.billettID
    LEFT JOIN Sovebillett AS so ON so.billettID = b.billettID
    LEFT JOIN Togruteforekomst AS tf ON tf.forekomstID = b.forekomstID
    LEFT JOIN BestarAvStasjon AS bs1 ON bs1.delstrekningID = sb.delstrekningID
    LEFT JOIN BestarAvStasjon AS bs2 ON bs2.delstrekningID = so.delstrekningID
    LEFT JOIN Stasjon AS s1 ON s1.stasjonID = bs1.stasjonID
    LEFT JOIN Stasjon AS s2 ON s2.stasjonID = bs2.stasjonID
    LEFT JOIN Togrute AS t ON t.ruteID = tf.ruteID 
    WHERE k.tlf = :tlf
    ORDER BY tf.dato, bs1.delstrekningID, bs2.delstrekningID ASC
    """, {"tlf": tlf})

    res = c.fetchall()

    ruterMedDato = {} # {dato : string}

    for i in range(len(res)):
        # [ruteID, dato, hovedretning, sb.stasjonstype, sb.stasjonsnavn, SittevognID, radnummer, setenummer, so.stasjonstype, so.stasjonsnavn, SovevognID, kupenummer, antallSenger]
        sammeTur = []
        # Legger til alle som har samme tidspunkt i en liste
        for j in range(i, len(res)):
            if (res[i][1] == res[j][1]):
                sammeTur.append(res[j])
            else:
                break
        #Verdier for sittebillett
        sittebillett = False
        num = 4
        # Hvis sovebillett endres verdier
        if (res[i][3] == None):
            num = 9
            sittebillett = True
        
        #Henter start/endestasjon
        if (sammeTur[0][2] == 1):
            startStasjon = sammeTur[0][num]
            sluttStasjon = sammeTur[-1][num]
        else:
            startStasjon = sammeTur[-1][num]
            sluttStasjon = sammeTur[0][num]

        if (sittebillett) :
            string = f"Du har en reise den {res[i][1]} fra {startStasjon} til {sluttStasjon}.\nDu har en sovebillett i vogn {res[i][10]} i kupé {res[i][11]} med {res[i][12]} senger.\n"
        else:
            string = f"Du har en reise den {res[i][1]} fra {startStasjon} til {sluttStasjon}.\nDu har en sittebillett på sete {res[i][7]}, rad {res[i][6]}, vogn {res[i][5]}.\n"

        if res[i][1] not in ruterMedDato:
            ruterMedDato[res[i][1]] = string

    # Printer reisene
    for s in ruterMedDato.values():
        print(s)
    
    if (len(ruterMedDato) == 0):
        print("Du har ingen fremtidige reiser.")


    pass

BH_h()
