import sqlite3 as sql
import datetime

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

def BH_c():
    stasjon = input("Skriv inn stasjonsnavn: ").capitalize().strip() #Lager stor forbokstav og fjerner mellomrom
    print(stasjon)
    try:
        id = c.execute("SELECT stasjonID FROM Stasjon WHERE stasjonsnavn = :stasjon", {"stasjon": stasjon})
        con.commit()
        print(id)
        ukedag = input("Skriv inn ukedag på norsk (bruk 'o' i stedet for 'ø'): ").lower()
        c.execute("SELECT t.ruteID, dag.ukedag FROM Togrute as t JOIN StarterPaaDag as dag ON t.ruteID = dag.ruteID WHERE dag.ukedag = :ukedag AND t.ruteID = :id", {"ukedag": ukedag, "id": id})
        con.commit()
        ruter = c.fetchall()
        print(ruter)

    except sql.Error as e:
        print("Fant ikke stasjon. Dobbelsjekk at du stavet navnet riktig.")
        print(f"Feilkode: {e}")

#Bruker skal kunne søke etter togruter som går mellom en startstasjon og en sluttstasjon, med
#utgangspunkt i en dato og et klokkeslett. Alle ruter den samme dagen og den neste skal
#returneres, sortert på tid. Denne funksjonaliteten skal programmeres.

def BH_d():
    c.execute("SELECT * FROM stasjon")
    muligeStartStasjoner = c.fetchall()
    print("___________\nMulige startstasjoner:\n\n")
    print("ID | StasjonNavn")
    for stasjon in muligeStartStasjoner:
        print(str(stasjon[0]) + " | " + stasjon[2])

    startStasjon = int(input("Hvor starter turen? (Velg en ID):\n"))

    print("____________\nStasjoner du kan komme deg til" )

    # Finner mulige sluttstasjoner fra startstasjon
    muligeEndeStasjoner = []
    erNesteStasjon = True
    stasjonOgTeste = startStasjon
    while erNesteStasjon:
        c.execute("SELECT * FROM Stasjon WHERE (Stasjon.stasjonID = (SELECT stasjonID FROM BestarAvStasjon AS B WHERE (B.delstrekningID = (SELECT delstrekningID FROM Stasjon AS S INNER JOIN BestarAvStasjon AS B ON (S.stasjonID = :stasjonId and S.stasjonID = B.stasjonID and B.stasjonsType = 'start')) and B.stasjonsType = 'ende')))", {"stasjonId": stasjonOgTeste})
        muligNesteStasjon = c.fetchall()
        if muligNesteStasjon == []:
            erNesteStasjon = False
        for stasjon in muligNesteStasjon:
            muligeEndeStasjoner.append(stasjon)
            stasjonOgTeste = stasjon[0]

    print("ID | StasjonNavn")
    for stasjon in muligeEndeStasjoner:
        print(str(stasjon[0]) + " | " + stasjon[2])
    sluttStasjon = str(input("Hvor slutter turen? (Velg en ID):\n"))


    dato = datetime.datetime.strptime(input("Når ønsker du å reise? (YYYY-MM-DD HH:MM):\n"), "%Y-%m-%d %H:%M")

    #Finner først alle ruter som går mellom de to stasjonene.
    kompatibleRuter = []
    try:
        c.execute("SELECT ruteID FROM InngaarITogrute WHERE stasjonID = :stasjonId", {"stasjonId": str(startStasjon)})
        ruterPåStart = c.fetchall()
        c.execute("SELECT ruteID FROM InngaarITogrute WHERE stasjonID = :stasjonId", {"stasjonId": str(sluttStasjon)})
        ruterPåSlutt = c.fetchall()
        for rute in ruterPåStart:
            if rute in ruterPåSlutt:
                kompatibleRuter.append(rute[0])
    except:
        raise Exception("Faen i hælvete")

    # Finner så ruter som er innenfor en dag på den valgte datoen og tiden.
    ruter = []
    try:
        for rute in kompatibleRuter:
            c.execute("SELECT * FROM Togruteforekomst WHERE ruteID = :ruteID", {"ruteID": rute})
            forekomster = c.fetchall()
            for forekomst in forekomster:
                if datetime.datetime.strptime(forekomst[2], "%Y-%m-%d %H:%M:%S") > dato and datetime.datetime.strptime(forekomst[2], "%Y-%m-%d %H:%M:%S") < (dato + datetime.timedelta(days = 1)):
                    ruter.append(forekomst)
    except:
        raise Exception("Kuk i ræv")

    print("Du kan ta følgende ruter:")
    print("RUTE | Avgangstid")
    for rute in ruter:
        print(str(rute[1]) + " | " + rute[2])



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

def BH_f():
    pass

def BH_g():
    pass

def BH_h():
    pass

main()