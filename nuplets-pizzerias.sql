-- Supprimer les n-uplets de toutes les tables avant de les remplir
DELETE FROM Vehicule;
DELETE FROM Modele;
DELETE FROM Livrer;
DELETE FROM Livreur;
DELETE FROM Pizzeria;
DELETE FROM Ville;

-- Modèles
insert into Modele (nomModele, marque, puissance) values ('Mob50', 'ChinaMody', 4);
insert into Modele (nomModele, marque, puissance) values ('Mot125', 'KCM', 15);
insert into Modele (nomModele, marque, puissance) values ('Voit3p', 'Toyoda', 64);

-- Villes
insert into Ville (nomVille, codeCommune, nombreHabitants) values ('Nantes', '44109', 282047);
insert into Ville (nomVille, codeCommune, nombreHabitants) values ('Rezé', '44143', 38214);
insert into Ville (nomVille, codeCommune, nombreHabitants) values ('Saint-Sébastien-sur-Loire', '44190', 24726);
insert into Ville (nomVille, codeCommune, nombreHabitants) values ('Saint-Herblain', '44162', 43119);
insert into Ville (nomVille, codeCommune, nombreHabitants) values ('Sainte-Luce-sur-Loire', '44172', 11679);
insert into Ville (nomVille, codeCommune, nombreHabitants) values ('Orvault', '44114', 24332);

-- Pizzerias
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (1, 'Speed Turtle Pizza', 6, 'Nantes');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (2, 'Slop Pizza', 2, 'Nantes');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (3, 'Pizza Express', 3, 'Nantes');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (4, 'Tradition Pizza', 2, 'Rezé');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (5, 'La Pizza en Carton', 4, 'Saint-Sébastien-sur-Loire');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (6, 'Pizza Pizza', 2, 'Saint-Herblain');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (7, 'Supra Pizza', 1, 'Sainte-Luce-sur-Loire');
insert into Pizzeria (idPizzeria, nomPizzeria, nombreLivreursMax, nomVille) values (8, 'Pizza hot', 3, 'Orvault');

-- Livrer
insert into Livrer (idPizzeria, nomVille) values (1, 'Nantes');
insert into Livrer (idPizzeria, nomVille) values (1, 'Rezé');
insert into Livrer (idPizzeria, nomVille) values (2, 'Nantes');
insert into Livrer (idPizzeria, nomVille) values (3, 'Nantes');
insert into Livrer (idPizzeria, nomVille) values (3, 'Saint-Sébastien-sur-Loire');
insert into Livrer (idPizzeria, nomVille) values (4, 'Rezé');
insert into Livrer (idPizzeria, nomVille) values (4, 'Nantes');
insert into Livrer (idPizzeria, nomVille) values (5, 'Saint-Sébastien-sur-Loire');
insert into Livrer (idPizzeria, nomVille) values (6, 'Saint-Herblain');
insert into Livrer (idPizzeria, nomVille) values (6, 'Orvault');
insert into Livrer (idPizzeria, nomVille) values (7, 'Sainte-Luce-sur-Loire');
insert into Livrer (idPizzeria, nomVille) values (8, 'Orvault');
insert into Livrer (idPizzeria, nomVille) values (8, 'Nantes');
insert into Livrer (idPizzeria, nomVille) values (8, 'Saint-Herblain');

-- Livreurs
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (1, 'Martin', 'Pierre', 'Nantes', 1);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (2, 'Machin', 'Jacques', 'Nantes', 1);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (3, 'Truc', 'Philippe', 'Rezé', 1);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (4, 'Bidulle', 'Martin', 'Saint-Sébastien-sur-Loire', 1);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (5, 'Moreau', 'Yohann', 'Nantes', 2);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (6, 'Huet', 'Fabrice', 'Nantes', 2);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (7, 'Malin', 'Fabien', 'Nantes', 3);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (8, 'Pchit', 'Nicolas', 'Nantes', 3);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (9, 'Bouguat', 'Adrien', 'Orvault', 3);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (10, 'Filou', 'Emmanuel', 'Nantes', 4);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (11, 'Gentil', 'Béatrice', 'Nantes', 5);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (12, 'Manif', 'Chantal', 'Saint-Sébastien-sur-Loire', 5);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (13, 'Nouveau', 'Solenn', 'Saint-Sébastien-sur-Loire', 5);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (14, 'Rock', 'Grégory', 'Saint-Herblain', 6);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (15, 'Boby', 'Fabien', 'Sainte-Luce-sur-Loire', 7);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (16, 'Perno', 'Pierre', 'Orvault', 8);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (17, 'Petit', 'Christine', 'Orvault', 8);
insert into Livreur (idLivreur, nom, prenom, nomVille, idPizzeria) values (18, 'Voisin', 'Abdel', 'Saint-Herblain', 8);

-- Véhicules
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (1, 1, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (2, 1, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (3, 1, 5, 'Mot125');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (4, 1, 10, 'Voit3p');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (5, 2, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (6, 2, 4, 'Mot125');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (7, 3, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (8, 3, 2, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (9, 4, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (10, 5, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (11, 5, 2, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (12, 5, 7, 'Mot125');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (13, 6, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (14, 6, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (15, 7, 10, 'Voit3p');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (16, 8, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (17, 8, 3, 'Mob50');
insert into Vehicule (idVehicule, idPizzeria, capacite, nomModele) values (18, 8, 3, 'Mob50');





