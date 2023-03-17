import sqlite3 as sql

con = sql.connect('tog.db')
c = con.cursor()

def main():
    brukerhistorie = input(f"Skriv en bokstav mellom a og h for å velge brukerhistorie, trykk enter for ferdig: ")
    if brukerhistorie == "":
        print("Programmet er ferdig")
    elif brukerhistorie == "a":
        BH_a()
    elif brukerhistorie == "b":
        BH_b()
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

def BH_a():
    stasjoner = {"Trondheim":5.1, "Steinskjer":3.6,"  Mosjoen":6.8,"Mo i Rana":3.5,"Fauske":34, "Bodo": 4.1}
    id = 0
    for stasjonsnavn,moh in stasjoner.items():
        c.execute(" INSERT INTO Stasjon VALUES (:id, :moh, :stasjonsnavn)", {id: id, moh: moh, stasjonsnavn: stasjonsnavn})
        id += 1
    con.commit()

def BH_b():
    # Legger til vogner
    c.execute(" INSERT INTO Vogn VALUES (0, sitte)")
    c.execute(" INSERT INTO Vogn VALUES (1, sove)")

    # Legger til operatør
    c.execute(" INSERT INTO Operatoer VALUES (0, 'SJ')")

    # Legger til InngaarITogrute (Endre formatering på tidspunkt, 5min pause)
    c.execute(" INSERT INTO InngaarITogrute VALUES (0, 0, 07:44, 07:49)") # Trondheim
    c.execute(" INSERT INTO InngaarITogrute VALUES (0, 1, 09:46, 09:51)") # Steinskjer
    c.execute(" INSERT INTO InngaarITogrute VALUES (0, 2, 13:15, 13:20)") # Mosjoen
    c.execute(" INSERT INTO InngaarITogrute VALUES (0, 3, 14:26, 14:31)") # Mo i Rana
    c.execute(" INSERT INTO InngaarITogrute VALUES (0, 4, 16:44, 16:49)") # Fauske
    c.execute(" INSERT INTO InngaarITogrute VALUES (0, 5, 17:29, 17:34)") # Bodo

    # Legger til rutetabell


def BH_c():
    pass

def BH_d():
    pass

def BH_e(): 
    pass

def BH_f():
    pass

def BH_g():
    pass

def BH_h():
    pass


main()