CREATE TABLE Boutique(
	idB INTEGER PRIMARY KEY AUTOINCREMENT,
	nomBoutique VARCHAR2(30),
	mail VARCHAR2(50),
	numero NUMBER(4),
	rue VARCHAR2(50),
	ville VARCHAR2(30),
	CP NUMBER(5),
	idGerant NUMBER(4),
	FOREIGN KEY(idGerant) REFERENCES Personne(idP)
);

CREATE TABLE Personne(
	idP INTEGER PRIMARY KEY AUTOINCREMENT,
	nom VARCHAR2(30) NOT NULL,
	prenom VARCHAR2(30) NOT NULL,
	mail VARCHAR2(50) NOT NULL,
	login VARCHAR2(30) NOT NULL,
	motDePasse VARCHAR2(30)
);

CREATE TABLE Marque(
    idM INTEGER PRIMARY KEY AUTOINCREMENT,
    nomMarque VARCHAR(30)
);

CREATE TABLE Produit(
        idProd INTEGER PRIMARY KEY AUTOINCREMENT,
        libelle VARCHAR2(30),
        idMarque VARCHAR2(30),
        description VARCHAR2(30),
        FOREIGN KEY(idMarque) REFERENCES Marque(idM)
);

CREATE TABLE PrixProduit(
        idProduit NUMBER(4),
        idBoutique NUMBER(4),
        FOREIGN KEY(idProduit) REFERENCES Produit(idP),
        FOREIGN KEY(idBoutique) REFERENCES Boutique(idB)
);

CREATE TABLE Promotion(
        idBoutique NUMBER(4),
        reduction INT,
        PRIMARY KEY(idBoutique)
);