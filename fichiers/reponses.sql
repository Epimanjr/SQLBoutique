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

-- Question 12
SELECT nom, prenom, Count(idB) 
FROM listeGerants 
INNER JOIN Boutique ON listeGerants.idP = Boutique.idGerant 
GROUP BY nom, prenom 
HAVING Count(idB) > 1 AND Count(idB) < 4;

-- Question 13
SELECT nomBoutique, prix, promotion
FROM Produit NATURAL INNER JOIN PrixProduit NATURAL INNER JOIN Boutique NATURAL INNER JOIN Promotion
WHERE libelle = "fourchette"
GROUP BY nomBoutique;

-- Question 14
SELECT idP,nom,prenom 
FROM Personne 
EXCEPT 
SELECT idP,nom,prenom 
FROM listeGerants;

-- Question 15
SELECT idP,nom,prenom 
FROM Personne 
WHERE idP NOT IN (SELECT idP 
                    FROM listeGerants);

-- Question 16
SELECT mail 
FROM Boutique 
UNION 
SELECT mail 
FROM Personne;

-- Question 17
SELECT * 
FROM Boutique INNER JOIN Promotion ON Boutique.idB = Promotion.idBoutique 
GROUP BY idB 
HAVING reduction = MAX(reduction);

-- Question 18
-- Afficher les boutiques vendant au moins 
-- un des articles vendus dans l'une des
-- boutiques du gérant : John Smith
SELECT idProd
FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
INNER JOIN Personne ON Boutique.idGerant = Personne.idP
WHERE prenom = "John"
AND nom = "SMITH";

SELECT idBoutique, idProduit
FROM PrixProduit
GROUP BY idBoutique, idProduit;

SELECT idBoutique, idProduit
FROM PrixProduit
GROUP BY idBoutique, idProduit
HAVING idProduit IN ( SELECT idProd
FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
INNER JOIN Personne ON Boutique.idGerant = Personne.idP
WHERE prenom = "John"
AND nom = "SMITH" );