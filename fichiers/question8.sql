-- Question 8
SELECT libelle, nomMarque
FROM ((Boutique INNER JOIN PrixProduit ON Boutique.idB = PrixProduit.idBoutique)
		INNER JOIN Produit ON PrixProduit.idProduit = Produit.idProd)
		INNER JOIN Marque ON Produit.idMarque = Marque.idM
WHERE nomBoutique = 'Chez Lulu'
ORDER BY libelle;