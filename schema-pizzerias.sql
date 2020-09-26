-- Supprimer les tables si elles existent
DROP TABLE IF EXISTS Vehicule;
DROP TABLE IF EXISTS Modele;
DROP TABLE IF EXISTS Livrer;
DROP TABLE IF EXISTS Livreur;
DROP TABLE IF EXISTS Pizzeria;
DROP TABLE IF EXISTS Ville;

CREATE TABLE Modele (
  nomModele VARCHAR(80),
  marque VARCHAR(80),
  puissance INTEGER,
  PRIMARY KEY(nomModele)
);

CREATE TABLE Ville (
  nomVille VARCHAR(80),
  codeCommune CHAR(5),
  nombreHabitants INTEGER,
  PRIMARY KEY(nomVille)
);

CREATE TABLE Pizzeria (
  idPizzeria INTEGER,
  nomPizzeria VARCHAR(80),
  nombreLivreursMax INTEGER,
  nomVille VARCHAR(80) REFERENCES Ville (nomVille),
  PRIMARY KEY(idPizzeria)
);

CREATE TABLE Livreur (
  idLivreur INTEGER,
  nom VARCHAR(80),
  prenom VARCHAR(80),
  nomVille VARCHAR(80) REFERENCES Ville (nomVille),
  idPizzeria INTEGER REFERENCES Pizzeria (idPizzeria),
  PRIMARY KEY(idLivreur)
);

CREATE TABLE Livrer (
  idPizzeria INTEGER REFERENCES Pizzeria (idPizzeria),
  nomVille VARCHAR(80) REFERENCES Ville (nomVille),
  PRIMARY KEY(idPizzeria, nomVille)
);

CREATE TABLE Vehicule (
  idVehicule INTEGER,
  capacite INTEGER,
  idPizzeria INTEGER REFERENCES Pizzeria (idPizzeria),
  nomModele VARCHAR(80) REFERENCES Modele (nomModele),
  PRIMARY KEY(idVehicule)
);