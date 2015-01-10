-- Insertion de tuples dans la table Personne
INSERT INTO Personne(nom, prenom, mail, login, motDePasse) VALUES("Blaise", "Maxime", "maxime.blaise1@etu.univ-lorraine.fr", "blaise33u", "monmotdepasse");
INSERT INTO Personne(nom, prenom, mail, login, motDePasse) VALUES("Nosal", "Antoine", "antoine.nosal@etu.univ-lorraine.fr", "nosal4u", "password");
INSERT INTO Personne(nom, prenom, mail, login, motDePasse) VALUES("SMITH", "John", "john.smith@js.com", "smith12u", "smithpass");

-- Insertion de tuples dans la table Boutique
INSERT INTO Boutique(nomBoutique, mail, numero, rue, ville, CP, idGerant) VALUES("YiruMax", "maxime.blaise@yirumax.com", 28, "Aristide Briand", "Laxou", 54520, 1);
INSERT INTO Boutique(nomBoutique, mail, numero, rue, ville, CP, idGerant) VALUES("TotoBoutique", "antoine.nosal@totoboutique.com", 50, "Aristide Briand", "Nancy", 54000, 2);
INSERT INTO Boutique(nomBoutique, mail, numero, rue, ville, CP, idGerant) VALUES("Chez Lulu", "chezlulu@chezlulu.com", 4012, "rue Lulu", "LuluLand", 55555, 1);

-- Insertion de tuples dans la table Marque
INSERT INTO Marque(nomMarque) VALUES("Adidas");
INSERT INTO Marque(nomMarque) VALUES("Nike");
INSERT INTO Marque(nomMarque) VALUES("Nokia");

-- Insertion de tuples dans la table Produit
INSERT INTO Produit(libelle, idMarque, description) VALUES("Veste", 1, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("Chaussure", 1, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("Veste", 2, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("Chaussure sport", 2, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("Veste", 3, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("Chaussure", 3, "");
-- Insertion d'un produit dont l'idMarque est null, pour la question 7
INSERT INTO Produit(libelle, idMarque, description) VALUES("", null, "");

-- Insertion de tuples dans la table PrixProduit
INSERT INTO PrixProduit(idProduit, idBoutique, prix) VALUES(2, 3, 50);
INSERT INTO PrixProduit(idProduit, idBoutique, prix) VALUES(1, 2, 50);
INSERT INTO PrixProduit(idProduit, idBoutique, prix) VALUES(4, 3, 80);
INSERT INTO PrixProduit(idProduit, idBoutique, prix) VALUES(4, 1, 70);