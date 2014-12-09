-- Maxime BLAISE
-- Antoine NOSAL

PRAGMA foreign_keys = ON;

-- Question 1

CREATE TABLE Boutique(
	idB NUMBER(4),
	nomBoutique VARCHAR2(30),
	mail VARCHAR2(50),
	numero NUMBER(4),
	rue VARCHAR2(50),
	ville VARCHAR2(30),
	CP NUMBER(5)
	idGerant NUMBER(4),
        PRIMARY KEY(idB),
	FOREIGN KEY(idGerant) REFERENCES Personne(idP)
);

CREATE TABLE Personne(
	idP NUMBER(4),
	nom VARCHAR2(30),
	prenom VARCHAR2(30),
	mail VARCHAR2(50),
	login VARCHAR2(30),
	motDePasse VARCHAR2(30),
	PRIMARY KEY(idP)
);

CREATE TABLE Marque(
        idM NUMBER(4),
        nomMarque VARCHAR(30),
        PRIMARY KEY(idM)
);

CREATE TABLE Produit(
        idProd NUMBER(4),
        libelle VARCHAR2(30),
        idMarque VARCHAR2(30),
        description VARCHAR2(30),
        PRIMARY KEY(idProd),
        FOREIGN KEY(idMarque) REFERENCES Marque(idM)
);

CREATE TABLE PrixProduit(
        idProduit NUMBER(4),
        idBoutique NUMBER(4),
        PRIMARY KEY(idProduit, idBoutique),
        FOREIGN KEY(idProduit) REFERENCES Produit(idP),
        FOREIGN KEY(idBoutique) REFERENCES Boutique(idB)
);

CREATE TABLE Promotion(
        idBoutique NUMBER(4),
        reduction INT,
        PRIMARY KEY(idBoutique)
);