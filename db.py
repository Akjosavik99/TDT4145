import sqlite3 as sql

con = sql.connect('tog.db')
c = con.cursor()

def main():
    brukerhistorie = input(f"Skriv en bokstav mellom c og h for å velge brukerhistorie, trykk enter for å avslutte programmet: ")
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
    stasjon = input("Skriv inn stasjonsnavn: ")
    try:
        id = c.execute("SELECT stasjonID FROM Stasjon WHERE stasjonsnavn = :stasjon", {"stasjon": stasjon})
        con.commit()
        ukedag = input("Skriv inn ukedag på norsk (bruke 'o' i stedet for 'ø'): ").lower()
        c.execute("SELECT t.ruteID, dag.ukedag FROM Togrute as t JOIN StarterPaaDag as dag ON t.ruteID = dag.ruteID")

        c.execute("SELECT * FROM InngaarITogrute WHERE stasjonsID = :id", {"id": id})
        print(c.fetchall())
    except:
        print("Fant ikke stasjon. Dobbelsjekk at du stavet navnet riktig.")

def BH_d():
    pass

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
    while not unikEpost :
        epost = input("Skriv inn eposten din: ")
        antall = c.execute("SELECT COUNT(epost) FROM Kunde WHERE epost = :epost", {"epost": epost} )
        con.commit()
        if (antall == 0):
            unikEpost = True
        else:
            print("Eposten er allerede registrert. Prøv igjen.")

    # Legger til kunde i databasen
    c.execute("INSERT INTO Kunde (navn, tlf, epost) VALUES (:navn, :tlf, :epost)", {"navn": navn, "tlf": tlf, "epost": epost})



def BH_f():
    pass

def BH_g():
    pass

def BH_h():
    pass

main()