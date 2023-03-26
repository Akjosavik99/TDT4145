def hentStasjonDato():
    c.execute("SELECT * FROM stasjon")
    muligeStartStasjoner = c.fetchall()
    stasjonIDer = [stasjon[0] for stasjon in muligeStartStasjoner]
    print("___________\nMulige startstasjoner:\n")
    print("ID | StasjonNavn")
    for stasjon in muligeStartStasjoner:
        print(str(stasjon[0]) + " | " + stasjon[2])

    startStasjonID = int(input("Hvor starter turen? (Velg en ID): "))

    while startStasjonID not in stasjonIDer:
        print("Du må velge en av stasjonene på listen.")
        startStasjonID = int(input("Hvor starter turen? (Velg en ID): "))

    sluttStasjonID = int(input("Hvor ender turen? (Velg en ID): "))

    while sluttStasjonID not in stasjonIDer or sluttStasjonID == startStasjonID:
        print("StasjonID finnes ikke, eller du har valgt samme stasjon som du ønsker å starte på.")
        sluttStasjonID = int(input("Hvor ender turen? (Velg en ID): "))

    startStasjon = muligeStartStasjoner[startStasjonID-1][2]
    sluttStasjon = muligeStartStasjoner[sluttStasjonID-1][2]

    # Henter dato fra bruker
    klokkeslett = input("Angi dato og tidspunkt (YYYY-MM-DD): ")
    dato1 = datetime.strptime(klokkeslett[:10], "%Y-%m-%d") # Konverterer dato-strengen til en datetime objekt
    dato2 = dato1 + timedelta(days=1) # Legger til én dag
    # Konverterer datetime objektene tilbake til strenger og legger på % for søk i DB
    dato1 = dato1.strftime("%Y-%m-%d") + "%"
    dato2 = dato2.strftime("%Y-%m-%d") + "%"

    return startStasjon, sluttStasjon, dato1, dato2, startStasjonID, sluttStasjonID
