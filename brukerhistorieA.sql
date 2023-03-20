-- Legger inn stasjoner på Norlandsbanen
INSERT INTO Stasjon (moh, stasjonsnavn) VALUES (5.1, "Trondheim S");
INSERT INTO Stasjon (moh, stasjonsnavn) VALUES (3.6, "Steinkjer");
INSERT INTO Stasjon (moh, stasjonsnavn) VALUES (6.8, "Mosjoeen");
INSERT INTO Stasjon (moh, stasjonsnavn) VALUES (3.5, "Mo i Rana");
INSERT INTO Stasjon (moh, stasjonsnavn) VALUES (34, "Fauske");
INSERT INTO Stasjon (moh, stasjonsnavn) VALUES (4.1, "Bodoe");

-- Legger inn banestrekningen Nordlandsbanen
INSERT INTO Banestrekning (banestrekningNavn, driftsenergi) VALUES ("Nordlandsbanen", "d");

-- Legger inn delsterkninger på Norlandsbanen
INSERT INTO Delstrekning (banestrekningID, lengde, erDobbeltspor) VALUES (1, 120, 1);
INSERT INTO Delstrekning (banestrekningID, lengde, erDobbeltspor) VALUES (1, 280, 0);
INSERT INTO Delstrekning (banestrekningID, lengde, erDobbeltspor) VALUES (1, 90, 0);
INSERT INTO Delstrekning (banestrekningID, lengde, erDobbeltspor) VALUES (1, 170, 0);
INSERT INTO Delstrekning (banestrekningID, lengde, erDobbeltspor) VALUES (1, 170, 0);

-- Legger inn start og endestasjon på Norlandsbanen
INSERT INTO StartOgEndestasjoner (banestrekningID, stasjonID, stasjonsType) VALUES (1, 1, "start"); -- Trondheim S
INSERT INTO StartOgEndestasjoner (banestrekningID, stasjonID, stasjonsType) VALUES (1, 6, "ende"); -- Bodoe

-- Legger inn bestaarAvStasjon på Norlandsbanen
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (1, 1, "start"); -- Trondheim S
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (1, 2, "ende"); -- Steinkjer
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (2, 2, "start"); -- Steinkjer
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (2, 3, "ende"); -- Mosjoeen
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (3, 3, "start"); -- Mosjoeen
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (3, 4, "ende"); -- Mo i Rana
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (4, 4, "start"); -- Mo i Rana
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (4, 5, "ende"); -- Fauske
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (5, 5, "start"); -- Fauske
INSERT INTO BestarAvStasjon (delstrekningID, stasjonID, stasjonsType) VALUES (5, 6, "ende"); -- Bodoe

