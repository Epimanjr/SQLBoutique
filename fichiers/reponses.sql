-- Maxime BLAISE
-- Antoine NOSAL

PRAGMA foreign_keys = ON;

-- Question 1

-- Question 2

-- Question 3
SELECT DISTINCT nomBoutique 
FROM Boutique;

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
ON Produit.idMarque = Marque.idM;

-- Question 7
SELECT libelle, nomMarque
FROM Produit LEFT JOIN Marque
ON Produit.idMarque = Marque.idM;

-- Question 8
SELECT libelle, nomMarque
FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
		INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
		INNER JOIN Marque ON Produit.idMarque = Marque.idM
WHERE nomBoutique = 'Chez Lulu'
ORDER BY libelle;

-- Question 9
SELECT nom, prenom 
FROM Personne 
WHERE idP IN (SELECT idGerant FROM Boutique);

-- Question 10
CREATE VIEW gérant AS 
SELECT idP, nom, prenom 
FROM Personne 
WHERE idP IN (SELECT idGerant FROM Boutique);

-- Question 11
SELECT nom, prenom, Count(idB) 
FROM gérant 
INNER JOIN Boutique ON gérant.idP = Boutique.idGerant 
GROUP BY nom, prenom;

-- Question 12
SELECT nom, prenom, Count(idB) 
FROM gérant 
INNER JOIN Boutique ON gérant.idP = Boutique.idGerant 
GROUP BY nom, prenom 
HAVING Count(idB) > 2 AND Count(idB) < 3;

-- Question 13
SELECT nomBoutique, prix, reduction, prix - reduction / 100 * prix AS prixApresReduction
FROM Produit
INNER JOIN PrixProduit ON Produit.idProd = PrixProduit.idProduit
INNER JOIN Boutique ON PrixProduit.idBoutique = Boutique.idB
INNER JOIN Promotion ON Boutique.idB = Promotion.idBoutique
WHERE libelle="Fourchette";

-- Question 14
SELECT idP,nom,prenom 
FROM Personne 
EXCEPT 
SELECT idP,nom,prenom 
FROM gérant;

-- Question 15
SELECT idP,nom,prenom 
FROM Personne 
WHERE idP NOT IN (SELECT idP 
                    FROM gérant);

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
SELECT idBoutique, idProduit
FROM PrixProduit
GROUP BY idBoutique, idProduit
HAVING idProduit IN ( SELECT idProd
FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
INNER JOIN Personne ON Boutique.idGerant = Personne.idP
WHERE prenom = "John"
AND nom = "Smith" );

-- COMMENTAIRES QUESTION 18
--
-- Etape 1 : Sélectionner tous les idProduits de la boutique de John Smith
--     SELECT idProd
--     FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
--     INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
--     INNER JOIN Personne ON Boutique.idGerant = Personne.idP
--     WHERE prenom = "John"
--     AND nom = "Smith";
--
-- Etape 2 : Sélectionner par boutique, tous les idProduit
--     SELECT idBoutique, idProduit
--     FROM PrixProduit
--     GROUP BY idBoutique, idProduit;
--
-- Etape 3 : On combine les deux premières étapes.
--           On sélectionne donc les boutiques qui ont un idProduit au moins qui est dans (IN) la liste des idProduit de la boutique de John Smith
--     SELECT idBoutique, idProduit
--     FROM PrixProduit
--     GROUP BY idBoutique, idProduit
--     HAVING idProduit IN ( SELECT idProd
--     FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
--     INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
--     INNER JOIN Personne ON Boutique.idGerant = Personne.idP
--     WHERE prenom = "John"
--     AND nom = "Smith" );

-- Question 19
SELECT idMarque, idBoutique, Count(idProd)
FROM (Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd
GROUP BY idMarque, idBoutique
HAVING Count(idProd) = ( SELECT DISTINCT Count(idProd)
FROM Marque INNER JOIN Produit ON Marque.idM = Produit.idMarque
GROUP BY idM );

-- COMMENTAIRES QUESTIONS 19
--
-- Etape 1 : Sélectionner par marque, le nombre de produits vendus
--     SELECT DISTINCT idM, Count(idProd)
--     FROM Marque INNER JOIN Produit ON Marque.idM = Produit.idMarque
--     GROUP BY idM;
--
-- Etape 2 : Sélectionner par marque et par boutique, le nombre de produits vendus
--     SELECT idMarque, idBoutique, Count(idProd)
--     FROM (Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
--     INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd
--     GROUP BY idMarque, idBoutique;

-- Etape 3 : On combine les deux premières étapes.
--           On sélectionne donc les marques qui sont vendues en totalité par au moins une boutique,
--           en comparant les deux nombres obtenus dans les étapes précédentes
--     SELECT idMarque, idBoutique, Count(idProd)
--     FROM (Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
--     INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd
--     GROUP BY idMarque, idBoutique
--     HAVING Count(idProd) = ( SELECT DISTINCT Count(idProd)
--     FROM Marque INNER JOIN Produit ON Marque.idM = Produit.idMarque
--     GROUP BY idM );