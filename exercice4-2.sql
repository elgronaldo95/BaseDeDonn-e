-- Correction exercice 4.2 du livret de TD

-- 1. 
SELECT nom, prenom, role, titre
FROM (Personne JOIN Jouer ON idPers=idAct) JOIN Film USING (idFilm)
ORDER BY nom

-- 2. 
SELECT nom, prenom, count(DISTINCT idFilm)
FROM Personne JOIN Jouer ON idPers=idAct
GROUP BY idPers
ORDER BY nom

-- 3. 
SELECT nom, prenom, count(DISTINCT idFilm) AS NbFilm, min(annee) AS PremierFilm, max(annee) AS DernierFilm
FROM (Personne JOIN Jouer ON idPers=idAct) JOIN Film USING (idFilm)
GROUP BY idPers
ORDER BY nom

-- 4.
SELECT nom, prenom, count(DISTINCT idFilm) AS NbFilm, min(annee) AS PremierFilm, max(annee) AS DernierFilm
FROM (Personne JOIN Jouer ON idPers=idAct) JOIN Film USING (idFilm)
GROUP BY idPers
HAVING count(DISTINCT idFilm) > 1
ORDER BY nom

-- 5. 
SELECT nom, prenom,C OUNT(DISTINCT idFilm) AS nbDrame
FROM (Personne JOIN Jouer ON idPers=idAct) JOIN Film USING (idFilm)
WHERE genre = "Drame"
GROUP BY idPers

-- 6.
SELECT nom, prenom, COUNT(DISTINCT idFilm) AS nbFilm
FROM (Personne JOIN Jouer ON idPers=idAct) JOIN Film USING (idFilm)
WHERE EXISTS ( SELECT *
               FROM Jouer JOIN Film USING (idFilm)
               WHERE Personne.idPers = Jouer.idAct AND genre = "Drame" )
GROUP BY idPers

SELECT nom, prenom, COUNT(DISTINCT idFilm) AS nbFilm
FROM (Personne JOIN Jouer ON idPers=idAct) JOIN Film USING (idFilm)
WHERE idPers IN ( SELECT idAct
	                 FROM Jouer JOIN Film USING (idFilm)
	                 WHERE genre = "Drame" )
GROUP BY idPers

-- 7. 
SELECT nom, prenom
FROM Personne
WHERE idPers IN (SELECT DISTINCT idAct FROM Jouer) AND idPers IN (SELECT DISTINCT idReal FROM Film)

SELECT nom, prenom
FROM Personne
WHERE EXISTS (SELECT * FROM Jouer WHERE idPers = idAct) AND EXISTS (SELECT * FROM Film WHERE idPers = idReal)

( SELECT nom, prenom FROM Personne JOIN Jouer ON idPers = idAct )
INTERSECT
( SELECT nom, prenom FROM Personne JOIN Film ON idPers = idReal )

-- 8. 
SELECT nom, prenom
FROM Personne JOIN Film ON idPers = idReal
WHERE genre = "Drame" AND idPers IN (SELECT idReal FROM Film WHERE genre = "Epouvante")

SELECT nom, prenom
FROM (Personne JOIN Film F1 ON idPers = F1.idReal) WHERE genre = "Drame"
AND EXISTS ( SELECT * FROM Film F2
             WHERE genre = "Epouvante" AND Personne.idPers=F2.idReal )

( SELECT nom, prenom FROM Personne JOIN Jouer ON idPers = idAct WHERE genre = "Drame" )
INTERSECT
( SELECT nom, prenom FROM Personne JOIN Film ON idPers = idReal WHERE genre = "Epouvante" )

-- 9.
( SELECT nom,prenom
  FROM Personne JOIN Jouer ON idPers = idAct )
EXCEPT
( SELECT DISTINCT nom, prenom
  FROM (Personne JOIN Jouer ON Personne.idPers = Jouer.idAct) JOIN Film USING (idFilm)
  WHERE genre = "Drame" )

SELECT nom, prenom
FROM Personne JOIN Jouer J1 ON idPers = idAct
WHERE idPers NOT IN ( SELECT DISTINCT idAct
                      FROM Jouer J2 JOIN Film USING (idFilm)
                      WHERE genre = "Drame" )

SELECT nom, prenom
FROM Personne JOIN Jouer J1 ON idPers = idAct
WHERE NOT EXISTS ( SELECT *
                   FROM Jouer J2 JOIN Film USING (idFilm)
                   WHERE genre = "Drame" AND J2.idAct = idPers )

-- 10.
SELECT nom
 FROM Cinema NATURAL JOIN Projection
 GROUP BY idCine
 HAVING COUNT(DISTINCT idFilm) = (SELECT COUNT(*) FROM Film)

-- 11.
SELECT nom, prenom
FROM (Personne JOIN Jouer ON idPers = idAct) NATURAL JOIN Projection
GROUP BY idPers
HAVING COUNT(DISTINCT idCine) = (SELECT COUNT(*) FROM Cinema)

-- 12. 
SELECT nom, prenom, COUNT(idFilm) AS nbFilm
FROM Film JOIN Personne ON idReal = idPers
GROUP BY idPers

-- 13.
SELECT MAX(nbFilm) AS maxFilm
FROM (SELECT COUNT(idFilm) AS nbFilm FROM Film JOIN Personne ON idReal = idPers GROUP BY idReal) AS Realisateurs

-- 14.
SELECT nom, prenom, COUNT(idFilm)
FROM Film JOIN Personne ON idReal = idPers
GROUP BY nom, prenom
HAVING COUNT(idFilm) >= ALL ( SELECT COUNT(idFilm)
 	                          FROM Film JOIN Personne ON idReal = idPers
 	                          GROUP BY idReal )

-- 15.
SELECT nom, prenom, COUNT(idFilm)
FROM Personne JOIN Film ON idPers=idReal
WHERE genre IN ( SELECT DISTINCT genre
                  FROM Personne JOIN Film ON idPers=idReal
                  WHERE nom = "Cronenberg" )
GROUP BY idPers

-- 16.
SELECT titre, P2.nom, P2.prenom, COUNT(DISTINCT idAct) AS nbTeteAff
FROM (Personne P1 JOIN Jouer ON P1.idPers=idAct) JOIN Film USING (idFilm) JOIN Personne P2 ON idReal = P2.idPers
GROUP BY idFilm

-- 17.
SELECT nom, prenom, (SUM(nbTete)*200000+COUNT(titre)*1000000) / COUNT(titre) AS budgetMoyen
FROM ( SELECT titre, P2.nom, P2.prenom, COUNT(DISTINCT idAct) AS nbTete
 	   FROM Personne P1 JOIN Jouer ON P1.idPers=idAct JOIN Film USING (idFilm) JOIN Personne P2 ON idReal = P2.idPers GROUP BY titre ) AS RealPrix
GROUP by idPers

-- 18.
SELECT P1.nom, P1.prenom
FROM Personne P1 JOIN Jouer ON idPers = idAct
WHERE idFilm IN ( SELECT idFilm
 	              FROM Personne P2 JOIN Film on idPers = idReal
                   WHERE P2.nom = "von Trier" )
GROUP BY P1.nom, P1.prenom
HAVING COUNT(idFilm) = ( SELECT COUNT(idFilm)
 	                     FROM Personne P3 JOIN Film on idPers = idReal
 	                     WHERE P3.nom = "von Trier" )
