-- 1a
SELECT idLivreur, nom, prenom
FROM Livreur, Pizzeria
WHERE Livreur.idPizzeria = Pizzeria.idPizzeria AND
      Livreur.nomville = Pizzeria.nomville

-- 1b
SELECT idLivreur, nom, prenom
FROM Livreur NATURAL JOIN Pizzeria

-- 2
SELECT idLivreur, nom, prenom
FROM Livreur, Pizzeria, Ville
WHERE Livreur.idPizzeria = Pizzeria.idPizzeria AND
      Livreur.nomville = Pizzeria.nomville AND
      Livreur.nomVille = Ville.nomVille AND
      Ville.nombreHabitants > 25000

-- 3a
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
WHERE nomVille = 'Nantes' AND
      nomModele ='Mob50' AND
      idPizzeria IN ( SELECT idPizzeria
                      FROM Vehicule
                      WHERE nomModele ='Mot125' )

-- 3b
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
WHERE nomVille = 'Nantes' AND
      nomModele ='Mob50' AND
      EXISTS ( SELECT idPizzeria
               FROM Vehicule AS V2
               WHERE nomModele ='Mot125' AND
                     V2.idPizzeria = Pizzeria.idPizzeria )

-- 3c
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
WHERE nomVille = 'Nantes' AND
      nomModele ='Mob50'
INTERSECT
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
WHERE nomVille = 'Nantes' AND
      nomModele ='Mot125'
-- 4a
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE nombreLivreursMax > 3 AND
      idPizzeria NOT IN ( SELECT idPizzeria
                          FROM Vehicule
                          WHERE nomModele = 'Voit3p' )

-- 4b
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE nombreLivreursMax > 3 AND
      NOT EXISTS ( SELECT *
                   FROM Vehicule
                   WHERE nomModele = 'Voit3p' AND
                         Pizzeria.idPizzeria = Vehicule.idPizzeria )

-- 5
SELECT nomVille, nombreHabitants
FROM Livrer NATURAL JOIN Ville
WHERE nombreHabitants > 25000
GROUP BY nomVille
HAVING COUNT(idPizzeria) > 1

-- 6
SELECT DISTINCT Pizzeria.idPizzeria, nomPizzeria
FROM (Pizzeria JOIN Livreur ON Pizzeria.idPizzeria= Livreur.idPizzeria)
      JOIN Ville ON Livreur.nomVille = Ville.nomVille
      NATURAL JOIN Vehicule
      NATURAL JOIN Modele
WHERE nombreHabitants > 25000 AND puissance > 4

-- 7a
SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE nomVille NOT IN (SELECT nomville
                       FROM Livreur
                       WHERE Pizzeria.idPizzeria = Livreur.IdPizzeria )

-- 7b
SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE NOT EXISTS (SELECT *
                  FROM Livreur
                  WHERE Pizzeria.idPizzeria = Livreur.IdPizzeria AND
                        Pizzeria.nomVille = Livreur.nomVille)

-- 8
SELECT AVG(nombreLivreursMax)
FROM Pizzeria JOIN Livrer ON Pizzeria.idPizzeria = Livrer.idPizzeria
WHERE Livrer.nomVille = 'Nantes'

-- 9
SELECT nom, prenom, idLivreur
FROM Livreur
WHERE idPizzeria IN (
SELECT Pizzeria.idPizzeria
FROM Pizzeria JOIN Livrer ON Pizzeria.idPizzeria = Livrer.idPizzeria
     JOIN Ville ON Livrer.nomVille = Ville.nomVille
WHERE nombreHabitants > 25000 AND nombreLivreursMax < 5
GROUP BY Pizzeria.idPizzeria
HAVING COUNT(Livrer.nomVille) > 1 )

-- 10
SELECT nomVille
FROM Livrer
GROUP BY nomVille
HAVING COUNT(*) >= ALL ( SELECT COUNT(*)
                         FROM Livrer
                         GROUP BY nomVille )

-- 11a
SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE idPizzeria NOT IN ( SELECT idPizzeria
                          FROM Vehicule
                          WHERE nomModele = 'Mob50' )

-- 11b
SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE NOT EXISTS ( SELECT *
                   FROM Vehicule
                   WHERE nomModele = 'Mob50' AND
                         Vehicule.idPizzeria = Pizzeria.idPizzeria)

-- 12
SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE nombreLivreursMax = (
SELECT COUNT(*)
FROM Livreur
WHERE Pizzeria.idPizzeria = Livreur.idPizzeria )

-- 13
SELECT Pizzeria.idPizzeria, nomPizzeria
FROM Pizzeria JOIN Livrer ON Pizzeria.idPizzeria = Livrer.idPizzeria
WHERE Livrer.nomVille = 'Nantes' AND
      Pizzeria.idPizzeria IN ( SELECT idPizzeria
                               FROM Vehicule
                               WHERE nomModele = 'Mob50' )
      AND Pizzeria.idPizzeria IN ( SELECT idPizzeria
                                   FROM Vehicule
                                   WHERE nomModele = 'Mot125' )
                                   
-- 14
SELECT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
GROUP BY idPizzeria
HAVING SUM(capacite) >= ALL ( SELECT SUM(capacite)
                              FROM Vehicule
                              GROUP BY idPizzeria )
