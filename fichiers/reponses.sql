-- Maxime BLAISE
-- Antoine NOSAL

PRAGMA foreign_keys = ON;

-- Question 1

create table Personne(
	idP NUMBER(4),
	nom VARCHAR2(30),
	prenom VARCHAR2(30),
	mail VARCHAR2(50),
	login VARCHAR2(30),
	motDePasse VARCHAR2(30),
	primary key(idP)
);

create table Boutique(
	idB NUMBER(4),
	nomBoutique VARCHAR2(30),
	mail VARCHAR2(50),
	numero NUMBER(4),
	rue VARCHAR2(50),
	ville VARCHAR2(30),
	CP NUMBER(5)
	idGerant NUMBER(4),
	foreign_keys(idGerant) references Personne(idP)
);