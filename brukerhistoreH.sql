-- Legger inn kunder
INSERT INTO Kunde (navn, epost, tlf) 
  VALUES ("Leander", "leander@epost.com", "11111111");
INSERT INTO Kunde (navn, epost, tlf) 
  VALUES ("Andreas", "andreas@epost.no", "22222222");

-- Legger inn ordre
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-03-22", 1);
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-03-05", 1);
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-03-06", 1);
INSERT INTO Ordre (dato, kundenummer) 
  VALUES ("2023-01-01", 2);

-- Legger inn sittebilletter til Leander sin reise fra Trondheim S til Mosjoeen
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (1, 1, 1, 1, 1);
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (2, 2, 1, 1, 1);
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (1, 1);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (3, 3, 1, 1, 1);

  -- Legger inn sittebilletter til Leander sin reise fra Steinkjer til Fauske
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (2, 2);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (4, 2, 1, 1, 2);
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (2, 2);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (5, 3, 1, 1, 2);
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (2, 2);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (6, 4, 1, 1, 2);

  -- Legger inn sittebilletter til Leander sin reise fra Mo i Rana til Trondheim S
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (5, 3);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (7, 3, 1, 1, 3);
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (5, 3);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (8, 2, 1, 1, 3);
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (5, 3);
INSERT INTO Sittebillett (billettID, delstrekningID, vognID, radnummer, setenummer)
  VALUES (9, 1, 1, 1, 3);

  -- Legger inn sittebilletter til Andreas sin reise fra Trondheim S til Steinkjer
INSERT INTO Billett (forekomstID, ordrenummer)
  VALUES (4, 4);
INSERT INTO Sovebillett (billettID, delstrekningID, antallSenger, kupenummer, vognID)
  VALUES (10, 1, 2, 1, 3);
