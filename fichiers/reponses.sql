-- Maxime BLAISE
-- Antoine NOSAL

PRAGMA foreign_keys = ON;

-- Question 1

-- Question 2

-- Question 3

SELECT DISTINCT nomBoutique 
FROM Boutique;
-- Le mot clé DISTINCT permet de supprimer les doublons.

-- Question 4

SELECT mail 
FROM Personne 
WHERE nom='Dupont'
AND prenom='Francois';

-- Question 5

SELECT count(idProd)
FROM Produit;

-- Question 6

SELECT libelle, nomMarque
FROM Produit INNER JOIN Marque
ON Produit.idMarque = Marque.idM

-- Question 7

..

-- Question 8 --> à débugger

SELECT libelle, nomMarque
FROM ((Produit INNER JOIN Marque t1 ON Produit.idMarque = Marque.idM) 
        INNER JOIN PrixProduit t2 ON t1.idP = PrixBoutique.idProduit)
        INNER JOIN Boutique ON t2.idBoutique = Boutique.idB
WHERE nomBoutique = "totoBoutique";

-- Question 9

SELECT nom, prenom 
FROM Personne 
WHERE idP IN (SELECT idGerant FROM Boutique);

-- Question 10

CREATE VIEW listeGerants AS 
SELECT idP, nom, prenom 
FROM Personne 
WHERE idP IN (SELECT idGerant FROM Boutique);

-- Question 11

SELECT nom, prenom, Count(idB) 
FROM listeGerants 
INNER JOIN Boutique ON listeGerants.idP = Boutique.idGerant 
GROUP BY nom, prenom;