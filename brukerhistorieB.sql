-- Legger til vogner

INSERT INTO Vogn (vognType) VALUES ("sitte");

-- sittevogn (ID = 1)

INSERT INTO Vogn (vognType) VALUES ("sitte");

-- sittevogn (ID = 2)

INSERT INTO Vogn (vognType) VALUES ("sove");

-- sovevogn (ID = 3)

-- Legger til seterader

INSERT INTO Seterad (radnummer, vognID) VALUES (1, 1);

-- sittevogn 1, rad 1

INSERT INTO Seterad (radnummer, vognID) VALUES (2, 1);

-- sittevogn 1, rad 2

INSERT INTO Seterad (radnummer, vognID) VALUES (3, 1);

-- sittevogn 1, rad 3

INSERT INTO Seterad (radnummer, vognID) VALUES (4, 1);

-- sittevogn 1, rad 4

INSERT INTO Seterad (radnummer, vognID) VALUES (1, 2);

-- sittevogn 2, rad 1

INSERT INTO Seterad (radnummer, vognID) VALUES (2, 2);

-- sittevogn 2, rad 2

INSERT INTO Seterad (radnummer, vognID) VALUES (3, 2);

-- sittevogn 2, rad 3

INSERT INTO Seterad (radnummer, vognID) VALUES (4, 2);

-- sittevogn 2, rad 4

-- Legger til seter på vogn 1

INSERT INTO
    Sete (setenummer, radnummer, vognID)
VALUES (1, 1, 1);

-- sittevogn 1, rad 1, sete 1

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (2, 1, 1);

-- sittevogn 1, rad 1, sete 2

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (3, 1, 1);

-- sittevogn 1, rad 1, sete 3

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (4, 1, 1);

-- sittevogn 1, rad 1, sete 4

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (5, 2, 1);

-- sittevogn 1, rad 2, sete 5

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (6, 2, 1);

-- sittevogn 1, rad 2, sete 6

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (7, 2, 1);

-- sittevogn 1, rad 2, sete 7

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (8, 2, 1);

-- sittevogn 1, rad 2, sete 8

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (9, 3, 1);

-- sittevogn 1, rad 3, sete 9

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (10, 3, 1);

-- sittevogn 1, rad 3, sete 10

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (11, 3, 1);

-- sittevogn 1, rad 3, sete 11

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (12, 3, 1);

-- sittevogn 1, rad 3, sete 12

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (13, 4, 1);

-- sittevogn 1, rad 4, sete 13

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (14, 4, 1);

-- sittevogn 1, rad 4, sete 14

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (15, 4, 1);

-- sittevogn 1, rad 4, sete 15

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (16, 4, 1);

-- sittevogn 1, rad 4, sete 16

-- Legger til seter på vogn 2

INSERT INTO
    Sete (setenummer, radnummer, vognID)
VALUES (1, 1, 2);

-- sittevogn 2, rad 1, sete 1

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (2, 1, 2);

-- sittevogn 2, rad 1, sete 2

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (3, 1, 2);

-- sittevogn 2, rad 1, sete 3

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (4, 1, 2);

-- sittevogn 2, rad 1, sete 4

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (5, 2, 2);

-- sittevogn 2, rad 2, sete 5

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (6, 2, 2);

-- sittevogn 2, rad 2, sete 6

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (7, 2, 2);

-- sittevogn 2, rad 2, sete 7

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (8, 2, 2);

-- sittevogn 2, rad 2, sete 8

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (9, 3, 2);

-- sittevogn 2, rad 3, sete 9

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (10, 3, 2);

-- sittevogn 2, rad 3, sete 10

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (11, 3, 2);

-- sittevogn 2, rad 3, sete 11

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (12, 3, 2);

-- sittevogn 2, rad 3, sete 12

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (13, 4, 2);

-- sittevogn 2, rad 4, sete 13

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (14, 4, 2);

-- sittevogn 2, rad 4, sete 14

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (15, 4, 2);

-- sittevogn 2, rad 4, sete 15

INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (16, 4, 2);

-- sittevogn 2, rad 4, sete 16

-- Legger til kupéer

INSERT INTO Kupe (kupenummer, vognID) VALUES (1, 3);

-- sovevogn 1, kupé 1

INSERT INTO Kupe (kupenummer, vognID) VALUES (2, 3);

-- sovevogn 1, kupé 2

INSERT INTO Kupe (kupenummer, vognID) VALUES (3, 3);

-- sovevogn 1, kupé 3

INSERT INTO Kupe (kupenummer, vognID) VALUES (4, 3);

-- sovevogn 1, kupé 4

-- Legger til operatør

INSERT INTO Operatoer (navn) VALUES ('SJ');

-- Legger til togruter

INSERT INTO Togrute (operatoerID, hovedretning) VALUES (1, TRUE);

-- Rute 1, dagtog Trondheim - bodø

INSERT INTO Togrute (operatoerID, hovedretning) VALUES (1, TRUE);

-- Rute 2, nattog Trondheim - bodø

INSERT INTO Togrute (operatoerID, hovedretning) VALUES (1, FALSE);

-- Rute 3, morgentog Mo i Rana - Trondheim

-- Legger til HarVogner

INSERT INTO HarVogner (ruteID, vognID) VALUES (1,1);

-- Rute 1, dagtog Trondheim-Bodoe, sittevogn 1

INSERT INTO HarVogner (ruteID, vognID) VALUES (1,2);

-- Rute 1, dagtog Trondheim-Bodoe, sittevogn 2

INSERT INTO HarVogner (ruteID, vognID) VALUES (2,1);

-- Rute 2, natttog Trondheim-Bodoe, sittevogn 1

INSERT INTO HarVogner (ruteID, vognID) VALUES (2,3);

-- Rute 2, natttog Trondheim-Bodoe, sovevogn 2

INSERT INTO HarVogner (ruteID, vognID) VALUES (3,1);

-- Rute 3, morgentog Mo i Rana-Trondheim, sovevogn 1

-- Legger til StarterPaaDag

-- Rute 1, dagtog Trondheim-Bodoe

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "mandag");

INSERT INTO
    Togruteforekomst(ruteID, dato)
VALUES (1, "2023-04-03 07:49:00");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "tirsdag");

INSERT INTO
    Togruteforekomst(ruteID, dato)
VALUES (1, "2023-04-04 07:49:00");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "onsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "torsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "fredag");

-- Rute 2, nattog Trondheim-Bodoe

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "mandag");

INSERT INTO
    Togruteforekomst(ruteID, dato)
VALUES (2, "2023-04-03 23:05:00");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "tirsdag");

INSERT INTO
    Togruteforekomst(ruteID, dato)
VALUES (2, "2023-04-04 23:05:00");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "onsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "torsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "fredag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "lordag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "sondag");

-- Rute 3, morgentog Mo i Rana - Trondheim

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "mandag");

INSERT INTO
    Togruteforekomst(ruteID, dato)
VALUES (3, "2023-04-03 08:11:00");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "tirsdag");

INSERT INTO
    Togruteforekomst(ruteID, dato)
VALUES (3, "2023-04-04 08:11:00");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "onsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "torsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "fredag");

-- Legger til InngaarITogrute (5min pause)

-- Rute 1, dagtog Trondheim-Bodoe

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 1, NULL, "0749");

-- Trondheim

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 2, "0946", "0951");

-- Steinkjer

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 3, "1315", "1320");

-- Mosjoeen

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 4, "1426", "1431");

-- Mo i Rana

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 5, "1644", "1649");

-- Fauske

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 6, "1734", NULL);

-- Bodoe

-- Rute 2, nattog Trondheim-Bodoe

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 1, NULL, "2305");

-- Trondheim

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 2, "0052", "0057");

-- Steinkjer

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 3, "0436", "0441");

-- Mosjoeen

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 4, "0550", "0555");

-- Mo i Rana

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 5, "0814", "0819");

-- Fauske

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 6, "0905", NULL);

-- Bodoe

-- Rute 3, morgentog Mo i Rana - Trondheim

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 4, NULL, "0811");

-- Mo i Rana

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 3, "0909", "0914");

-- Mosjoeen

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 2, "1226", "1231");

-- Steinkjer

INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 1, "1413", NULL);

-- Trondheim

-- Legger til StasjonITogrute

-- Rute 1, dagtog Trondheim-Bodoe

INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (1, 1, "start");

-- Trondheim

INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (1, 6, "ende");

-- Bodoe

-- Rute 2, nattog Trondheim-Bodoe

INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (2, 1, "start");

-- Trondheim

INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (2, 6, "ende");

-- Bodoe

-- Rute 3, morgentog Mo i Rana - Trondheim

INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (3, 4, "start");

-- Mo i Rana

INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (3, 1, "ende");

-- Trondheim

-- Legger til BestarAvDelstrekninger

-- Rute 1, dagtog Trondheim-Bodoe

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 1);

-- Trondheim - Steinkjer

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 2);

-- Steinkjer - Mosjoeen

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 3);

-- Mosjoeen - Mo i Rana

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 4);

-- Mo i Rana - Fauske

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 5);

-- Fauske - Bodoe

-- Rute 2, nattog Trondheim-Bodoe

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 1);

-- Trondheim - Steinkjer

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 2);

-- Steinkjer - Mosjoeen

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 3);

-- Mosjoeen - Mo i Rana

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 4);

-- Mo i Rana - Fauske

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 5);

-- Fauske - Bodoe

-- Rute 3, morgentog Mo i Rana - Trondheim

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (3, 3);

-- Mosjoeen - Mo i Rana

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (3, 2);

-- Steinkjer - Mosjoeen

INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (3, 1);

-- Trondheim - Steinkjer