-- Correction exercice 5.1 du livret de TD

-- 1.
SELECT idLivreur, nom, prenom
FROM Livreur NATURAL JOIN Pizzeria NATURAL JOIN Ville
WHERE ville = nomVille AND nombreHabitants > 25000


-- 2.
SELECT COUNT(idLivreur)
FROM Livreur NATURAL JOIN Pizzeria
WHERE nomVille = ville

-- 3.
SELECT nom, prenom
FROM Livreur
WHERE Ville IN ( SELECT villeDesservie
                    FROM Livraison NATURAL JOIN Pizzeria
                    WHERE nomPizzeria = "Tradition Pizza" )

SELECT nom, prenom
FROM Livreur
WHERE EXISTS ( SELECT *
               FROM Livraison NATURAL JOIN Pizzeria
               WHERE nomPizzeria = "Tradition Pizza"
                        AND villeDesservie=ville )

-- 4.
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
WHERE nomVille = "Nantes" AND modele = "Mob50"
         AND idPizzeria IN ( SELECT idPizzeria
                             FROM Vehicule
                             WHERE modele = "Mot125" )

SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule V1
WHERE nomVille = "Nantes" AND modele ="Mob50"
      AND EXISTS ( SELECT *
                   FROM Vehicule V2
                   WHERE V2.modele = "Mot125"
                         AND V1.idPizzeria = V2.idPizzeria )

-- 5.
SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
WHERE nombreLivreursMax > 3 AND idPizzeria NOT IN ( SELECT idPizzeria
                                                    FROM Vehicule
                                                    WHERE modele = "Voit3p" )

SELECT DISTINCT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule V1
WHERE nombreLivreursMax > 3 AND NOT EXISTS ( SELECT *
                                             FROM Vehicule V2
                                             WHERE modele = "Voit3p"
                                                   AND V1.idPizzeria = V2.idPizzeria )

-- 6.
SELECT marque, COUNT(idVehicule) AS nbVehicules
FROM Vehicule JOIN Modele ON modele=nomModele
GROUP BY marque

-- 7.
SELECT nomVille, nombreHabitants
FROM Livraison JOIN Ville ON villeDesservie = nomVille
WHERE nombreHabitants > 25000
GROUP BY nomVille
HAVING COUNT(idPizzeria) > 1

-- 8.
SELECT nomPizzeria, nomville, COUNT(villeDesservie) AS nbVillesDes
FROM Pizzeria NATURAL JOIN Livraison
GROUP BY villeDesservie
ORDER BY nbVillesDes ASC

-- 9.
SELECT nom, prenom
FROM Livreur JOIN Livraison ON ville=villeDesservie
GROUP BY idLivreur
HAVING COUNT(Livraison.idPizzeria) > 2

-- 10.
SELECT DISTINCT idPizzeria, nomPizzeria
FROM ( ( Pizzeria NATURAL JOIN Livreur ) JOIN Ville ON ville = Ville.nomVille )
       NATURAL JOIN ( Vehicule JOIN Modele ON modele = nomModele )
WHERE nombreHabitants > 25000 AND puissance > 4

-- 11.
SELECT idPizzeria, nomPizzeria FROM Pizzeria
WHERE nomVille NOT IN ( SELECT ville
                        FROM Livreur
                        WHERE Pizzeria.idPizzeria = Livreur.IdPizzeria )

SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE NOT EXISTS ( SELECT *
                   FROM Livreur
                   WHERE Pizzeria.idPizzeria = Livreur.IdPizzeria
                         AND Pizzeria.nomVille = Livreur.ville )

-- 12.
SELECT AVG(nombreLivreursMax)
FROM Pizzeria NATURAL JOIN Livraison
WHERE villeDesservie = "Nantes"

-- 13.
SELECT nomPizzeria, nombreLivreursMax-COUNT(*) AS nbPostesDispo
FROM Livreur NATURAL JOIN Pizzeria
GROUP BY idPizzeria

-- 14.
SELECT nom, prenom, idLivreur FROM Livreur
WHERE idPizzeria IN ( SELECT idPizzeria
                      FROM Pizzeria NATURAL JOIN Livraison
                           JOIN Ville ON villeDesservie = Ville.nomVille
                      WHERE nombreHabitants > 25000
                            AND nombreLivreursMax < 5
                      GROUP BY idPizzeria
                      HAVING COUNT(villeDesservie) > 1 )

-- 15.
SELECT villeDesservie
FROM Livraison
GROUP BY villeDesservie
HAVING COUNT(*) >= ALL ( SELECT COUNT(*)
                         FROM Livraison
                         GROUP BY villeDesservie )

-- 16.
SELECT idPizzeria, nomPizzeria FROM Pizzeria
WHERE idPizzeria NOT IN ( SELECT DISTINCT idPizzeria
                          FROM Pizzeria NATURAL JOIN Vehicule
                          WHERE modele = "Mob50" )

SELECT idPizzeria, nomPizzeria
FROM Pizzeria P1
WHERE NOT EXISTS ( SELECT *
                   FROM Pizzeria P2 NATURAL JOIN Vehicule
                   WHERE modele = "Mob50"
                         AND P1.idPizzeria = P2.idPizzeria )

-- 17.
SELECT nomPizzeria
FROM Pizzeria
WHERE nombreLivreursMax = ( SELECT MIN(nombreLivreursMax)
                            FROM Pizzeria )

-- 18.
SELECT idPizzeria, nomPizzeria
FROM Pizzeria
WHERE nombreLivreursMax = ( SELECT COUNT(*)
                            FROM Livreur
                            WHERE Pizzeria.idPizzeria = Livreur.idPizzeria )

-- 19.
SELECT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Livraison
WHERE idPizzeria IN ( SELECT idPizzeria
                      FROM Vehicule
                      WHERE modele = "Mob50" )
      AND idPizzeria IN ( SELECT idPizzeria
                          FROM Vehicule
                          WHERE modele = "Mot125" )
      AND villeDesservie = "Nantes"

-- 20.
SELECT idPizzeria, nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
GROUP BY idPizzeria
HAVING SUM(capacite) >= ALL ( SELECT SUM(capacite)
                              FROM Vehicule
                              GROUP BY idPizzeria )

-- 21.
SELECT nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule
GROUP BY idPizzeria
HAVING COUNT(idVehicule) >= ALL ( SELECT COUNT(idVehicule)
                                  FROM Vehicule
                                  GROUP BY idPizzeria )
-- 22.
SELECT nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule JOIN Modele ON modele = nomModele
WHERE puissance >= ALL ( SELECT puissance
                         FROM Modele )

SELECT nomPizzeria
FROM Pizzeria NATURAL JOIN Vehicule JOIN Modele ON modele = nomModele
WHERE puissance IN ( SELECT max(puissance) FROM Modele )
