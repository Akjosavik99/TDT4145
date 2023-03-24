SELECT
  	Sete.setenummer,
  	Sete.radnummer,
  	Sete.vognID
FROM Sete
JOIN HarVogner ON HarVogner.vognID = Sete.vognID
JOIN Togruteforekomst ON Togruteforekomst.ruteID = HarVogner.ruteID
JOIN BestarAvDelstrekninger ON BestarAvDelstrekninger.ruteID = Togruteforekomst.ruteID
WHERE BestarAvDelstrekninger.delstrekningID = 1
	AND Togruteforekomst.forekomstID = 1 
 	AND HarVogner.ruteID = Togruteforekomst.ruteID;