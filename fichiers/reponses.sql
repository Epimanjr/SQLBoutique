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
FROM Produit INNER JOIN nomMarque
ON Produit.idMarque = Marque.idM

-- Question 7
