import sqlite3 as sql
from datetime import datetime, timedelta

con = sql.connect('tog.db')
c = con.cursor()

def main():
    brukerhistorie = input(f"Skriv en bokstav mellom c og h for å velge brukerhistorie, trykk enter for å avslutte programmet: ").lower()
    if brukerhistorie == "":
        print("Programmet er ferdig")
    elif brukerhistorie == "c":
        BH_c()
    elif brukerhistorie == "d":
        BH_d()
    elif brukerhistorie == "e":
        BH_e()
    elif brukerhistorie == "f":
        BH_f()
    elif brukerhistorie == "g":
        BH_g()
    elif brukerhistorie == "h":
        BH_h()
    else:
        print("Ugyldig input, prøv igjen")
        main()

# For en stasjon som oppgis, skal bruker få ut alle togruter som er innom stasjonen en gitt ukedag.
# Denne funksjonaliteten skal programmeres.

def BH_c():
    c.execute("SELECT * FROM stasjon")
    muligeStartStasjoner = c.fetchall()
    print(muligeStartStasjoner)
    print("___________\nMulige startstasjoner:\n\n")
    print("ID | StasjonNavn")
    for stasjon in muligeStartStasjoner:
        print(str(stasjon[0]) + " | " + stasjon[2])

    stasjonNavn = muligeStartStasjoner[int(input("Hvor starter turen? (Velg en ID): "))-1][2]


    ukedager = ["mandag", "tirsdag", "onsdag", "torsdag", "fredag", "lordag", "sondag"]
    print("___________\nMulige dager:\n\n")
    print("ID | dag")
    for i in range(len(ukedager)):
        print(str(i) + " | " + ukedager[i])
    dagNummer = int(input("Hvilken ukedag ønsker du å reise? (Velg en ID): "))
    ukedag = ukedager[dagNummer]

    # Må sjekke hvilke ruter som er innom stasjonen på ukedagen + neste dag da en rute
    # kan starte på en ukedag og ende på neste ukedag (nattog)
    if dagNummer == len(ukedager):
        sjekkUkedag = [ukedag, ukedager[0]]
    else:
        sjekkUkedag = [ukedag, ukedager[dagNummer+1] ]
    
    c.execute("""
    SELECT dag.ukedag, t.ruteID FROM StarterPaaDag as dag
    JOIN Togrute as t ON dag.ruteID = t.ruteID
    WHERE (dag.ukedag = :ukedag1 OR dag.ukedag = :ukedag2)
    """, {"ukedag1": sjekkUkedag[0], "ukedag2": sjekkUkedag[1]})

    #Finner alle ruter som kjøres den valgte dagen og neste
    aktuelleRuter = []
    for el in c.fetchall():
        if (el[1] not in aktuelleRuter):
            aktuelleRuter.append(el[1])
    stasjonerMedDagTidListe = []

    # Henter alle stasjoner på en rute
    for rute in aktuelleRuter:
        stasjonerIRekkefølge = listeMedStasjoner(rute)
        stasjonerMedDagTid = []
        for stasjon in stasjonerIRekkefølge:
            if stasjon == stasjonerIRekkefølge[0]:
                c.execute("""
                SELECT s.stasjonsnavn, i.ankomsttid, i.avgangstid, dag.ukedag FROM Togrute as t
                JOIN InngaarITogrute as i ON t.ruteID = i.ruteID
                JOIN Stasjon as s ON s.stasjonID = i.stasjonID
                JOIN StarterPaaDag as dag ON t.ruteID = dag.ruteID
                WHERE t.ruteID = :rute AND s.stasjonsnavn = :stasjon AND dag.ukedag = :ukedag1
                """, {"rute": rute, "stasjon": stasjon, "ukedag1": sjekkUkedag[0] })
                resultat = c.fetchall()[0]
                stasjonerMedDagTid.append([stasjon, resultat[1], resultat[2], resultat[3], rute])
            else:
                c.execute("""
                SELECT s.stasjonsnavn, i.ankomsttid, i.avgangstid, dag.ukedag FROM Togrute as t
                JOIN InngaarITogrute as i ON t.ruteID = i.ruteID
                JOIN Stasjon as s ON s.stasjonID = i.stasjonID
                JOIN StarterPaaDag as dag ON t.ruteID = dag.ruteID
                WHERE t.ruteID = :rute AND s.stasjonsnavn = :stasjon AND (dag.ukedag = :ukedag1 OR dag.ukedag = :ukedag2)
                """, {"rute": rute, "stasjon": stasjon, "ukedag1": sjekkUkedag[0], "ukedag2": sjekkUkedag[1]})
                resultat = c.fetchall()[0]
                ankomsttid = int(resultat[1])

                # Sjekker om ankomsttid er før avgangstid fra forrige stasjon (ny dag)
                if (ankomsttid - int(stasjonerMedDagTid[-1][2])) < 0:
                    if ukedager.index(resultat[3]) == 6:
                        dag = "mandag"
                    else:
                        dag = ukedager[ukedager.index(resultat[3])+1]        
                else:
                    dag = stasjonerMedDagTid[-1][3]
                
                # Legger til stasjonen i listen med navn, ankomsttid, avgangstid, dag, rute
                stasjonerMedDagTid.append([stasjon, resultat[1], resultat[2], dag, rute])
        stasjonerMedDagTidListe.append(stasjonerMedDagTid)

    # Printer resultatet
    print(f"Ruter som er innom {stasjonNavn} på {ukedag}:")
    for stasjonerMedDagTid in stasjonerMedDagTidListe:
        for stasjon in stasjonerMedDagTid:
            # Printer ruten hvis dag og stasjonnavn stemmer
            if (stasjon[0] == stasjonNavn and (stasjon[3] == sjekkUkedag[0] or stasjon[3] == sjekkUkedag[1])):
                print(f"Rute {stasjon[4]}")


# Funksjon som returnerer en liste med stasjonene i riktig rekkefølge
def listeMedStasjoner(ruteID):
    c.execute("""
    SELECT t.ruteID, d.delstrekningID, s.stasjonID, s.stasjonsnavn  FROM Togrute as t
    JOIN BestarAvDelstrekninger as b ON b.ruteID = t.ruteID
    JOIN Delstrekning as d ON b.delstrekningID = d.delstrekningID
    JOIN InngaarITogrute as i ON t.ruteID = i.ruteID
    JOIN Stasjon as s ON s.stasjonID = i.stasjonID
    JOIN BestarAvStasjon as bs ON bs.stasjonID = s.stasjonID AND d.delstrekningID = bs.delstrekningID
    WHERE t.ruteID = :ruteID
    """, {"ruteID": ruteID})
    resultat = c.fetchall()
    stasjoner = []
    for stasjon in resultat:
        if stasjon[3] not in stasjoner:
            stasjoner.append(stasjon[3])

    # Sorterer stasjonene i riktig rekkefølges
    delstrekninger = {} #delstrekningID : [stasjon-stasjon]
    for i in range(len(resultat)):
        if (resultat[i][1] in delstrekninger):
            delstrekninger[resultat[i][1]].append(resultat[i][3])
        else:
            delstrekninger[resultat[i][1]] = [resultat[i][3]]

    # Finner startstasjonen for ruten
    c.execute("""
    SELECT s.stasjonsnavn, t.ruteID, st.stasjonsType FROM Togrute as t
    JOIN StasjonITogrute as st ON st.ruteID = t.ruteID
    JOIN Stasjon as s ON s.stasjonID = st.stasjonID
    WHERE t.ruteID = :ruteID AND st.stasjonsType = "start"
    """, {"ruteID": ruteID})
    startStasjon = c.fetchall()[0][0]

    # returnerer liste med stasjonene i rekkefølge
    return settRekkefølge(startStasjon, delstrekninger, [])

# Funksjon som setter stasjonene i riktig rekkefølge basert på en startstasjon,
# en dictionary med {delstrekningID : [stasjon-stasjon]} og en tom liste
def settRekkefølge(startStasjon, delstrekninger, rekkefølgeListe):
    if len(rekkefølgeListe) == 0:
        for delstrekning in delstrekninger.values():
            for stasjon in delstrekning:
                if stasjon == startStasjon:
                    rekkefølgeListe.append(stasjon)
    else:
        for delstrekning in delstrekninger.values():
            for stasjon in delstrekning:
                #Sjekker om siste stasjon i rekkefølgeListe er lik en av stasjonene i delstrekningen
                if (stasjon == rekkefølgeListe[-1]):
                    # Legger til stasjonen hvis den ikke allerede er lagt til
                    if (delstrekning.index(stasjon) == 0 and delstrekning[1] not in rekkefølgeListe):
                        rekkefølgeListe.append(delstrekning[1])
                    elif (delstrekning.index(stasjon) == 1 and delstrekning[0] not in rekkefølgeListe):
                        rekkefølgeListe.append(delstrekning[0])
    if (len(rekkefølgeListe) < len(delstrekninger)+1):
        settRekkefølge(startStasjon, delstrekninger, rekkefølgeListe)
    return rekkefølgeListe


#Bruker skal kunne søke etter togruter som går mellom en startstasjon og en sluttstasjon, med
#utgangspunkt i en dato og et klokkeslett. Alle ruter den samme dagen og den neste skal
#returneres, sortert på tid. Denne funksjonaliteten skal programmeres.

def BH_d():
    
    c.execute("SELECT * FROM stasjon")
    muligeStartStasjoner = c.fetchall()
    print(muligeStartStasjoner)
    print("___________\nMulige startstasjoner:\n\n")
    print("ID | StasjonNavn")
    for stasjon in muligeStartStasjoner:
        print(str(stasjon[0]) + " | " + stasjon[2])

    startStasjon = muligeStartStasjoner[int(input("Hvor starter turen? (Velg en ID): "))-1][2]
    sluttStasjon = muligeStartStasjoner[int(input("Hvor slutter turen? (Velg en ID): "))-1][2]

    # Henter dato og tid fra bruker
    klokkeslett = input("Angi dato og tidspunkt (YYYY-MM-DD HH:MM): ")+":00" #Legger til sekunder
    dato1 = datetime.strptime(klokkeslett[:10], "%Y-%m-%d") # Konverterer dato-strengen til en datetime objekt
    dato2 = dato1 + timedelta(days=1) # Legger til én dag
    dato1 = dato1.strftime("%Y-%m-%d") # Konverterer datetime objektet tilbake til en streng
    dato2 = dato2.strftime("%Y-%m-%d") # Konverterer datetime objektet tilbake til en streng
    print(dato1)
    print(dato2)

    # Henter alle ruter som går på gitte datoer
    c.execute( """
    SELECT tf.dato, tf.ruteID FROM Togruteforekomst as tf
    WHERE tf.dato LIKE :dato1 OR tf.dato LIKE :dato2
    """, (dato1 + '%',dato2 + '%')) 

    ruter = c.fetchall()

    # Henter ut alle stasjoner i rutene
    # ruteListe = []
    for rute in ruter:
        ruteListe.append(rute[1])


    forekomster = {} #dato : [{ruteID:[avgang, ankomst]}, {ruteID:[avgang, ankomst]}]

    c.execute("""
        SELECT t.ruteID, s.stasjonsnavn, i.ankomsttid, i.avgangstid, tf.dato FROM Togrute as t
        JOIN InngaarITogrute AS i ON i.ruteID = t.ruteID
        JOIN Stasjon AS s ON s.stasjonID = i.stasjonID
        JOIN Togruteforekomst AS tf on tf.ruteID = t.ruteID
        WHERE (s.stasjonsnavn = :startStasjon OR s.stasjonsnavn = :sluttStasjon)
        ORDER BY tf.dato, t.ruteID ASC
    """, {"ruteID" : rute, "startStasjon": startStasjon, "sluttStasjon": sluttStasjon } )

    res = c.fetchall()
    forekomster = []
    for i in range(len(res)):
        # [dato, ruteID, ankomsttid, avgangstid]
        info = [res[i][4], res[i][0],"", ""]
        if i%2 == 0 and (res[i][3] != None and res[i+1][2] != None):
            info[2] = res[i][3]
            info[3] = res[i+1][2]
            forekomster.append(info)
    print(f"Fra {startStasjon} til {sluttStasjon} går disse togene: ")
    print(f"Dato      |RuteID| Avgang | Ankomst ")
    print("-----------------------------------")
    for el in forekomster:
        print(f"{el[0][:10]}|  {el[1]}   |  {el[2]}  | {el[3]}")

def BH_e():
    navn = input("Skriv inn navnet ditt: ")
    # Sjekker om telefonnummeret er unikt
    unikTlf = False
    while not unikTlf :
        tlf = input("Skriv inn telefonnummeret ditt: ")
        antall = c.execute("SELECT COUNT(tlf) FROM Kunde WHERE tlf = :tlf", {"tlf": tlf} )
        con.commit()
        if (antall == 0):
            unikTlf = True
        else:
            print("Telefonnummeret er allerede registrert. Prøv igjen.")

    # Sjekker om eposten er unik
    unikEpost = False
    while not unikEpost:
        epost = input("Skriv inn eposten din: ")
        antall = c.execute("SELECT COUNT(epost) FROM Kunde WHERE epost = :epost", {"epost": epost} )
        con.commit()
        if (antall == 0):
            unikEpost = True
        else:
            print("Eposten er allerede registrert. Prøv igjen.")

    # Legger til kunde i databasen
    c.execute("INSERT INTO Kunde (navn, tlf, epost) VALUES (:navn, :tlf, :epost)", {"navn": navn, "tlf": tlf, "epost": epost})
    con.commit()
    print(f"Kunde registrert: {navn}, {tlf}, {epost}")

# Det skal legges inn nødvendige data slik at systemet kan håndtere billettkjøp for de tre togrutene
# på Nordlandsbanen, mandag 3. april og tirsdag 4. april i år. Dette kan gjøres med et skript, dere
# trenger ikke å programmere støtte for denne funksjonaliteten.
def BH_f():
    pass

# Registrerte kunder skal kunne finne ledige billetter for en oppgitt strekning på en ønsket togrute
# og kjøpe de billettene hen ønsker. Denne funksjonaliteten skal programmeres.
# Pass på at dere bare selger ledige plasser
def BH_g():
    

    pass

def BH_h():
    pass

BH_d()
# main()