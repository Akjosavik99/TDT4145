--Sletter alle records i relevante tabller TODO

-- Legger inn kunder
INSERT INTO Kunde (navn, epost, tlf) 
  VALUES ("Leander", "leander@epost.com", "11111111");
INSERT INTO Kunde (navn, epost, tlf) 
  VALUES ("Andreas", "andreas@epost.no", "22222222");

-- Legger inn ordre (datoen her er bestillingsdato, ikke reisedato)
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-03-22", 1);
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-03-05", 1);
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-01-01", 2);

-- Legger inn sittebilletter til Leander sin reise fra Trondheim S til Mosjoeen
-- Det er en billett per delstrekning
-- Billett for reisende 1 av 2
INSERT INTO Billett (billettID, forekomstID, ordrenummer)
  VALUES (1, 1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (1, 1, 1, 1, 1);

INSERT INTO Billett (billettID, forekomstID, ordrenummer)
  VALUES (2, 1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (2, 2, 1, 1, 1);

INSERT INTO Billett (billettID, forekomstID, ordrenummer)
  VALUES (3, 1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (3, 3, 1, 1, 1);

-- Billett for reisende 2 av 2
INSERT INTO Billett (billettID, forekomstID, ordrenummer)
  VALUES (4, 1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (4, 1, 1, 1, 2);

INSERT INTO Billett (billettID, forekomstID, ordrenummer)
  VALUES (5, 1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (5, 2, 1, 1, 2);

INSERT INTO Billett (billettID, forekomstID, ordrenummer)
  VALUES (6, 1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (6, 3, 1, 1, 2);