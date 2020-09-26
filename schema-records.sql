-- Supprimer les tables si elles existent
DROP TABLE IF EXISTS Nationalite;
DROP TABLE IF EXISTS Athlete;
DROP TABLE IF EXISTS Sport;
DROP TABLE IF EXISTS Epreuve;
DROP TABLE IF EXISTS Participer;

-- Création de la table Nationalite
CREATE TABLE Nationalite (
	idNationalite INTEGER,
	nomPays VARCHAR(80),
	PRIMARY KEY (idNationalite)
);

-- Création de la table Athlete
CREATE TABLE Athlete (
	idAthlete INTEGER,
	nom VARCHAR(80),
	prenom VARCHAR(80),
	sexe CHAR(1),
	dateNaissance DATE,
	idNationalite INTEGER REFERENCES Nationalite(idNationalite),
	PRIMARY KEY (idAthlete)
);

-- Création de la table Sport
CREATE TABLE Sport (
	idSport INTEGER,
	sport VARCHAR(80),
	PRIMARY KEY (idSport)
);

-- Création de la table Epreuve
CREATE TABLE Epreuve (
	idEpreuve INTEGER,
	epreuve VARCHAR(80),
	idSport INTEGER REFERENCES Sport (idSport),
	PRIMARY KEY (idEpreuve)
);

-- Création de la table Participer
CREATE TABLE Participer (
	idAthlete INTEGER REFERENCES Athlete (idAthlete),
	idEpreuve INTEGER REFERENCES Epreuve (idEpreuve),
	dateRecord DATE,
	temps TIME,
	PRIMARY KEY (idAthlete, idEpreuve, dateRecord)
);


