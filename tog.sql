CREATE TABLE Operatoer(
    operatoerID INTEGER,
    navn VARCHAR(10) NOT NULL,
    PRIMARY KEY (operatoerID)
);

CREATE TABLE Togrute(
    ruteID INTEGER,
    operatoerID INTEGER NOT NULL,
    PRIMARY KEY(ruteID),
    FOREIGN KEY(operatoerID) REFERENCES Operatoer(operatoerID) ON DELETE CASCADE
);

CREATE TABLE StarterPaaDag(
    ruteID INTEGER NOT NULL, 
    ukedag VARCHAR(8) NOT NULL,
    FOREIGN KEY(ruteID) REFERENCES Togrute(ruteID) ON DELETE CASCADE
);

CREATE TABLE Stasjon(
    stasjonID INTEGER,
    moh INTEGER NOT NULL,
    stasjonsnavn VARCHAR(30) NOT NULL,
    PRIMARY KEY (stasjonID)
);

CREATE TABLE InngaarITogrute (
    ruteID INTEGER NOT NULL,
    stasjonID INTEGER NOT NULL,
    ankomsttid CHAR(4),
    avgangstid CHAR(4),
    FOREIGN KEY (ruteID) REFERENCES Togrute(ruteID) ON DELETE CASCADE,
    FOREIGN KEY (stasjonID) REFERENCES Stasjon(stasjonID) ON DELETE CASCADE,
    PRIMARY KEY (ruteID, stasjonID)
);

CREATE TABLE StasjonITogrute (
    ruteID INTEGER NOT NULL,
    stasjonID INTEGER NOT NULL,
    stasjonsType VARCHAR(5),
    CONSTRAINT 'ende/start' CHECK(stasjonsType IN ('start', 'ende')),
    FOREIGN KEY (ruteID) REFERENCES Togrute(ruteID) ON DELETE CASCADE,
    FOREIGN KEY (stasjonID) REFERENCES Stasjon(stasjonID) ON DELETE CASCADE,
    PRIMARY KEY (ruteID, stasjonID)
)

CREATE TABLE Banestrekning(
    banestrekningID INTEGER,
    banestrekningNavn VARCHAR(30) NOT NULL,
    driftsenergi CHAR(1) NOT NULL,
    CONSTRAINT 'diesel/elektrisk' CHECK(driftsenergi IN ('d', 'e')),
    PRIMARY KEY (banestrekningID)
);

CREATE TABLE Delstrekning(
    delstrekningID INTEGER,
    banestrekningID INTEGER NOT NULL,
    lengde INTEGER NOT NULL,
    erDobbeltspor BOOLEAN NOT NULL,
    PRIMARY KEY(delstrekningID),
    FOREIGN KEY (banestrekningID) REFERENCES Banestrekning(banestrekningID) ON DELETE CASCADE
);

CREATE TABLE BestarAvStasjon(
    delstrekningID INTEGER NOT NULL,
    stasjonID INTEGER NOT NULL,
    stasjonsType VARCHAR(5),
    CONSTRAINT 'ende/start' CHECK(stasjonsType IN ('start', 'ende')),
    FOREIGN KEY (delstrekningID) REFERENCES Delstrekning(delstrekningID) ON DELETE CASCADE,
    FOREIGN KEY (stasjonID) REFERENCES Stasjon(stasjonID) ON DELETE CASCADE,
    PRIMARY KEY (delstrekningID, stasjonID)
);

CREATE TABLE StartOgEndestasjoner(
    banestrekningID INTEGER NOT NULL,
    stasjonID INTEGER NOT NULL,
    stasjonsType VARCHAR(5),
    CONSTRAINT 'ende/start' CHECK(stasjonsType IN ('start', 'ende')),
    FOREIGN KEY (banestrekningID) REFERENCES Banestrekning(banestrekningID) ON DELETE CASCADE,
    FOREIGN KEY (stasjonID) REFERENCES Stasjon(stasjonID) ON DELETE CASCADE,
    PRIMARY KEY (banestrekningID, stasjonID)
);

CREATE TABLE BestarAvDelstrekninger(
    ruteID INTEGER NOT NULL,
    delstrekningID INTEGER NOT NULL,
    FOREIGN KEY (ruteID) REFERENCES Togrute(ruteID) ON DELETE CASCADE,
    FOREIGN KEY (delstrekningID) REFERENCES Delstrekning(delstrekningID) ON DELETE CASCADE,
    PRIMARY KEY (ruteID, delstrekningID)
);

CREATE TABLE Vogn(
    vognID INTEGER,
    vognType VARCHAR(5) NOT NULL,
    CONSTRAINT 'sitte/sove' CHECK(vognType IN ('sitte', 'sove'))
    PRIMARY KEY(vognID)
);

CREATE TABLE HarVogner(
    ruteID INTEGER NOT NULL,
    vognID INTEGER NOT NULL,
    FOREIGN KEY (ruteID) REFERENCES Togrute(ruteID) ON DELETE CASCADE,
    FOREIGN KEY (vognID) REFERENCES Vogn(vognID) ON DELETE CASCADE,
    PRIMARY KEY (ruteID, vognID)
);

CREATE TABLE Seterad(
    radnummer INTEGER NOT NULL,
    vognID INTEGER NOT NULL,
    FOREIGN KEY (vognID) REFERENCES Vogn(vognID) ON DELETE CASCADE,
    PRIMARY KEY (radnummer, vognID)
);

CREATE TABLE Kupe(
    kupenummer INTEGER NOT NULL,
    vognID INTEGER NOT NULL,
    FOREIGN KEY (vognID) REFERENCES Vogn(vognID) ON DELETE CASCADE,
    PRIMARY KEY (kupenummer, vognID)
);

CREATE TABLE Sete (
    setenummer INTEGER NOT NULL,
    radnummer INTEGER NOT NULL,
    vognID INTEGER NOT NULL,
    FOREIGN KEY (vognID, radnummer) REFERENCES Seterad(vognID, radnummer) ON DELETE CASCADE,
    PRIMARY KEY (setenummer, radnummer, vognID)
);

CREATE TABLE Togruteforekomst(
    forekomstID INTEGER,
    ruteID INTEGER NOT NULL,
    dato CHAR(23) NOT NULL,
    FOREIGN KEY (ruteID) REFERENCES Togrute(ruteID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (forekomstID)
);

CREATE TABLE Kunde (
    kundenummer INTEGER,
    navn VARCHAR(30) NOT NULL,
    epost VARCHAR(35) NOT NULL UNIQUE,
    tlf VARCHAR(15) NOT NULL UNIQUE,
    PRIMARY KEY (kundenummer)
);

CREATE TABLE Ordre (
    ordrenummer INTEGER,
    dato CHAR(23) NOT NULL,
    kundenummer INTEGER NOT NULL,
    FOREIGN KEY (kundenummer) REFERENCES Kunde(kundenummer) ON DELETE CASCADE,
    PRIMARY KEY (ordrenummer)
);

CREATE TABLE Billett (
    billettID INTEGER,
    forekomstID INTEGER NOT NULL,
    ordrenummer INTEGER NOT NULL,
    FOREIGN KEY (ordrenummer) REFERENCES Ordre(ordrenummer) ON DELETE CASCADE,
    FOREIGN KEY (forekomstID) REFERENCES Togruteforekomst(forekomstID) ON DELETE CASCADE,
    PRIMARY KEY (billettID)
);

CREATE TABLE Sovebillett (
    billettID INTEGER NOT NULL,
    antallSenger INTEGER NOT NULL,
    kupenummer INTEGER NOT NULL,
    vognID INTEGER NOT NULL,
    CONSTRAINT 'maks2Senger' CHECK(antallSenger BETWEEN 1 AND 2),
    FOREIGN KEY (billettID) REFERENCES Billett(billettID) ON DELETE CASCADE,
    FOREIGN KEY (kupenummer, vognID) REFERENCES Kupe(kupenummer, vognID) ON DELETE CASCADE,
    PRIMARY KEY (billettID)
);

CREATE TABLE Sittebillett(
    billettID INTEGER NOT NULL,
    delstrekningID INTEGER NOT NULL,
    vognID INTEGER NOT NULL,
    radnummer INTEGER NOT NULL,
    setenummer INTEGER NOT NULL,
    FOREIGN KEY (billettID) REFERENCES Billett(billettID) ON DELETE CASCADE,
    FOREIGN KEY (delstrekningID) REFERENCES Delstrekning(delstrekningID) ON DELETE CASCADE,
    FOREIGN KEY (vognID, radnummer, setenummer) REFERENCES Sete(vognID, radnummer, setenummer) ON DELETE CASCADE,
    PRIMARY KEY (billettID)
);

