-- Legger til 2 sittevogner og 1 sovevogn
INSERT INTO Vogn (vognType) VALUES ("sitte");
INSERT INTO Vogn (vognType) VALUES ("sitte");
INSERT INTO Vogn (vognType) VALUES ("sove");

-- Legger til seterader

-- rad 1, sittevogn 1
INSERT INTO Seterad (radnummer, vognID) VALUES (1, 1);

-- rad 2, sittevogn 1
INSERT INTO Seterad (radnummer, vognID) VALUES (2, 1);

-- rad 3, sittevogn 1
INSERT INTO Seterad (radnummer, vognID) VALUES (3, 1);

-- rad 4, sittevogn 1
INSERT INTO Seterad (radnummer, vognID) VALUES (4, 1);

-- rad 1, sittevogn 2
INSERT INTO Seterad (radnummer, vognID) VALUES (1, 2);

-- rad 2, sittevogn 2
INSERT INTO Seterad (radnummer, vognID) VALUES (2, 2);

-- rad 3, sittevogn 2
INSERT INTO Seterad (radnummer, vognID) VALUES (3, 2);

-- rad 4, sittevogn 2
INSERT INTO Seterad (radnummer, vognID) VALUES (4, 2);


-- Legger til seter på vogn 1

-- Sete 1, rad 1, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (1, 1, 1);

-- Sete 2, rad 1, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (2, 1, 1);

-- Sete 3, rad 1, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (3, 1, 1);

-- Sete 4, rad 1, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (4, 1, 1);

-- Sete 5, rad 2, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (5, 2, 1);

-- Sete 6, rad 2, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (6, 2, 1);

-- Sete 7, rad 2, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (7, 2, 1);

-- Sete 8, rad 2, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (8, 2, 1);

-- Sete 9, rad 3, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (9, 3, 1);

-- Sete 10, rad 3, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (10, 3, 1);

-- Sete 11, rad 3, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (11, 3, 1);

-- Sete 12, rad 3, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (12, 3, 1);

-- Sete 13, rad 4, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (13, 4, 1);

-- Sete 14, rad 4, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (14, 4, 1);

-- Sete 15, rad 4, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (15, 4, 1);

-- Sete 16, rad 4, sittevogn 1
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (16, 4, 1);


-- Legger til seter på vogn 2

-- sete 1, rad 1, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (1, 1, 2);

-- sete 2, rad 1, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (2, 1, 2);

-- sete 3, rad 1, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (3, 1, 2);

-- sete 4, rad 1, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (4, 1, 2);

-- sete 5, rad 2, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (5, 2, 2);

-- sete 6, rad 2, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (6, 2, 2);

-- sete 7, rad 2, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (7, 2, 2);

-- sete 8, rad 2, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (8, 2, 2);

-- sete 9, rad 3, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (9, 3, 2);

-- sete 10, rad 3, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (10, 3, 2);

-- sete 11, rad 3, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (11, 3, 2);

-- sete 12, rad 3, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (12, 3, 2);

-- sete 13, rad 4, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (13, 4, 2);

-- sete 14, rad 4, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (14, 4, 2);

-- sete 15, rad 4, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (15, 4, 2);

-- sete 16, rad 4, sittevogn 2
INSERT INTO Sete (setenummer, radnummer, vognID) VALUES (16, 4, 2);

-- Legger til kupéer

-- kupé 1, sovevogn 1
INSERT INTO Kupe (kupenummer, vognID) VALUES (1, 3);

-- kupé 2, sovevogn 1
INSERT INTO Kupe (kupenummer, vognID) VALUES (2, 3);

-- kupé 3, sovevogn 1
INSERT INTO Kupe (kupenummer, vognID) VALUES (3, 3);

-- kupé 4, sovevogn 1
INSERT INTO Kupe (kupenummer, vognID) VALUES (4, 3);


-- Legger til operatør
INSERT INTO Operatoer (navn) VALUES ('SJ');

-- Legger til togruter

-- Rute 1, dagtog Trondheim - bodø
INSERT INTO Togrute (operatoerID, hovedretning) VALUES (1, TRUE);

-- Rute 2, nattog Trondheim - bodø
INSERT INTO Togrute (operatoerID, hovedretning) VALUES (1, TRUE);

-- Rute 3, morgentog Mo i Rana - Trondheim
INSERT INTO Togrute (operatoerID, hovedretning) VALUES (1, FALSE);


-- Legger til HarVogner

-- Rute 1, dagtog Trondheim-Bodoe, sittevogn 1
INSERT INTO HarVogner (ruteID, vognID) VALUES (1,1);

-- Rute 1, dagtog Trondheim-Bodoe, sittevogn 2
INSERT INTO HarVogner (ruteID, vognID) VALUES (1,2);

-- Rute 2, natttog Trondheim-Bodoe, sittevogn 1
INSERT INTO HarVogner (ruteID, vognID) VALUES (2,1);

-- Rute 2, natttog Trondheim-Bodoe, sovevogn 2
INSERT INTO HarVogner (ruteID, vognID) VALUES (2,3);

-- Rute 3, morgentog Mo i Rana-Trondheim, sovevogn 1
INSERT INTO HarVogner (ruteID, vognID) VALUES (3,1);


-- Legger til StarterPaaDag

-- Rute 1, dagtog Trondheim-Bodoe
INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "mandag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "tirsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "onsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "torsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (1, "fredag");

-- Rute 2, nattog Trondheim-Bodoe
INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "mandag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "tirsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "onsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "torsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "fredag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "lordag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (2, "sondag");

-- Rute 3, morgentog Mo i Rana - Trondheim
INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "mandag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "tirsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "onsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "torsdag");

INSERT INTO StarterPaaDag (ruteID, ukedag) VALUES (3, "fredag");


-- Legger til InngaarITogrute (5min pause)

-- Rute 1, dagtog Trondheim-Bodoe

-- Trondheim
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 1, NULL, "0749");

-- Steinkjer
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 2, "0946", "0951");


-- Mosjoeen
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 3, "1315", "1320");

-- Mo i Rana
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 4, "1426", "1431");

-- Fauske
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 5, "1644", "1649");

-- Bodoe
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (1, 6, "1734", NULL);

-- Rute 2, nattog Trondheim-Bodoe

-- Trondheim
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 1, NULL, "2305");

-- Steinkjer
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 2, "0052", "0057");

-- Mosjoeen
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 3, "0436", "0441");

-- Mo i Rana
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 4, "0550", "0555");

-- Fauske
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 5, "0814", "0819");

-- Bodoe
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (2, 6, "0905", NULL);


-- Rute 3, morgentog Mo i Rana - Trondheim

-- Mo i Rana
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 4, NULL, "0811");

-- Mosjoeen
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 3, "0909", "0914");

-- Steinkjer
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 2, "1226", "1231");

-- Trondheim
INSERT INTO
    InngaarITogrute (
        ruteID,
        stasjonID,
        ankomsttid,
        avgangstid
    )
VALUES (3, 1, "1413", NULL);


-- Legger til StasjonITogrute

-- Rute 1, dagtog Trondheim-Bodoe

-- Trondheim
INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (1, 1, "start");

-- Bodoe
INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (1, 6, "ende");


-- Rute 2, nattog Trondheim-Bodoe

-- Trondheim
INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (2, 1, "start");

-- Bodoe
INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (2, 6, "ende");


-- Rute 3, morgentog Mo i Rana - Trondheim

-- Mo i Rana
INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (3, 4, "start");

-- Trondheim
INSERT INTO
    StasjonITogrute (
        ruteID,
        stasjonID,
        stasjonsType
    )
VALUES (3, 1, "ende");

-- Legger til BestarAvDelstrekninger

-- Rute 1, dagtog Trondheim-Bodoe

-- Trondheim - Steinkjer
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 1);


-- Steinkjer - Mosjoeen
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 2);


-- Mosjoeen - Mo i Rana
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 3);

-- Mo i Rana - Fauske
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 4);

-- Fauske - Bodoe
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (1, 5);

-- Rute 2, nattog Trondheim-Bodoe

-- Trondheim - Steinkjer
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 1);

-- Steinkjer - Mosjoeen
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 2);

-- Mosjoeen - Mo i Rana
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 3);

-- Mo i Rana - Fauske
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 4);

-- Fauske - Bodoe
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (2, 5);

-- Rute 3, morgentog Mo i Rana - Trondheim

-- Mosjoeen - Mo i Rana
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (3, 3);

-- Steinkjer - Mosjoeen
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (3, 2);

-- Trondheim - Steinkjer
INSERT INTO
    BestarAvDelstrekninger (ruteID, delstrekningID)
VALUES (3, 1);
