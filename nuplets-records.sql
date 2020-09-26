-- Supprimer les n-uplets de toutes les tables avant de les remplir
DELETE FROM Participer;
DELETE FROM Athlete;
DELETE FROM Nationalite;
DELETE FROM Epreuve;
DELETE FROM Sport;

-- Ajouter les n-uplets de la table Nationalite
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (1, 'France');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (2, 'USA');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (3, 'Chine');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (4, 'Russie');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (5, 'Japon');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (6, 'Jamaïque');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (7, 'Royaume Uni');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (8, 'Brésil');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (9, 'Canada');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (10, 'Ethiopie');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (11, 'Roumanie');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (12, 'Australie');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (13, 'Afrique du sud');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (14, 'Pays-Bas');
INSERT INTO Nationalite (idNationalite, nomPays) VALUES (15, 'Kenya');

-- Ajouter les n-uplets de la table Athlete
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (1, 'Bolt', 'Usain', 'M', '1986-08-21', 6);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (2, 'Lavillenie', 'Renaud', 'M', '1986-09-18', 1);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (3, 'Bekele', 'Kenenisa', 'M', '1982-06-13', 10);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (4, 'Griffith-Joyner', 'Florence', 'F', '1959-12-21', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (5, 'Isinbayeva', 'Yelena', 'F', '1982-06-03', 4);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (6, 'Szabó', 'Gabriela', 'F', '1975-11-14', 11);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (7, 'Dibaba', 'Tirunesh', 'F', '1985-10-01', 10);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (8, 'Cielo', 'César', 'M', '1987-01-10', 8);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (9, 'Sullivan', 'Eamon', 'M', '1985-08-30', 12);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (10, 'Phelps', 'Michael', 'M', '1985-06-30', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (11, 'van der Burgh', 'Cameron', 'M', '1988-05-25', 13);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (12, 'Kromowidjojo', 'Ranomi', 'F', '1990-08-20', 14);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (13, 'Vollmer', 'Dana', 'F', '1987-11-13', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (14, 'Jones', 'Leisel', 'F', '1985-08-30', 12);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (15, 'Wanjiru', 'Samuel', 'M', '1986-11-10', 15);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (16, 'Xiang', 'Liu', 'M', '1983-07-13', 3);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (17, 'Beamon', 'Bob', 'M', '1946-08-29', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (18, 'Gelana', 'Tiki', 'F', '1987-10-22', 10);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (19, 'Joyner-Kersee', 'Jackie', 'F', '1962-03-03', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (20, 'Yang', 'Sun', 'M', '1991-12-01', 3);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (21, 'Grevers', 'Matthew', 'M', '1985-03-26', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (22, 'Schmitt', 'Allison', 'F', '1990-06-07', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (23, 'Muffat', 'Camille', 'F', '1989-10-28', 1);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (24, 'Franklin', 'Missy', 'F', '1995-05-10', 2);
INSERT INTO Athlete (idAthlete, nom, prenom, sexe, dateNaissance, idNationalite) VALUES (25, 'Shiwen', 'Ye', 'F', '1996-03-01', 3);

-- Ajouter les n-uplets de la table Sport
INSERT INTO Sport (idSport, sport) VALUES(1, 'Athletisme');
INSERT INTO Sport (idSport, sport) VALUES(2, 'Natation'); 

-- Ajouter les n-uplets de la table Epreuve
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(1, '100 m', 1);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(2, '200 m', 1);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(4, '5000 m', 1);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(5, '10000 m', 1);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(6, '50 m nage libre', 2); 
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(7, '100 m nage libre', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(8, '100 m papillon', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(9, '100 m brasse', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(10, 'Marathon', 1);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(11, '110 m haies', 1);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(13, '200 m nage libre', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(14, '400 m nage libre', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(15, '100 m dos', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(16, '200 m 4 nages', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(17, '400 m 4 nages', 2);
INSERT INTO Epreuve (idEpreuve, epreuve, idSport) VALUES(18, '200 m papillon', 2);

-- Ajouter les n-uplets de la table Participer
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(1, 1, '2012-08-05', '00:00:09.63');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(1, 2, '2008-08-20', '00:00:19.30');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(3, 4, '2008-08-23', '00:12:57.82');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(3, 5, '2008-08-17', '00:27:01.17');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(4, 1, '1988-09-24', '00:00:10.62');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(4, 2, '1988-09-29', '00:00:21.34');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(6, 4, '2000-09-25', '00:14:40.79');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(7, 5, '2008-08-15', '00:29:54.66');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(8, 6, '2008-08-16', '00:00:21.30');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(9, 7, '2008-08-13', '00:00:47.05');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(10, 8, '2008-08-16', '00:00:50.58');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(11, 9, '2012-07-29', '00:00:58.46');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(12, 6, '2012-08-04', '00:00:24.05');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(12, 7, '2012-08-02', '00:00:53.00');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(13, 8, '2012-07-29', '00:00:55.98');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(14, 9, '2008-08-12', '00:01:05.17');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(15, 10, '2008-08-24', '02:06:32.00');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(16, 11, '2004-08-27', '00:00:12.91');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(18, 10, '2012-08-05', '02:23:07.00');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(10, 13, '2008-08-12', '00:01:42.96');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(20, 14, '2012-07-28', '00:03:40.14');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(21, 15, '2012-07-30', '00:00:52.16');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(10, 16, '2008-08-15', '00:01:54.23');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(22, 13, '2012-07-31', '00:01:53.61');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(23, 14, '2012-07-29', '00:04:01.45');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(24, 15, '2012-07-30', '00:00:58.33');
INSERT INTO Participer (idAthlete, idEpreuve, dateRecord, temps) VALUES(25, 16, '2012-07-31', '00:02:07.57');



