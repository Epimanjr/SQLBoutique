-- Insertion de tuples dans la table Personne
INSERT INTO Personne(nom, prenom, mail, login, motDePasse) VALUES("Blaise", "Maxime", "maxime.blaise1@etu.univ-lorraine.fr", "blaise33u", "monmotdepasse");
INSERT INTO Personne(nom, prenom, mail, login, motDePasse) VALUES("Nosal", "Antoine", "antoine.nosal@etu.univ-lorraine.fr", "nosal4u", "password");

-- Insertion de tuples dans la table Boutique
INSERT INTO Boutique(nomBoutique, mail, numero, rue, ville, CP, idGerant) VALUES("YiruMax", "maxime.blaise@yirumax.com", 28, "Aristide Briand", "Laxou", 54520, 1);
INSERT INTO Boutique(nomBoutique, mail, numero, rue, ville, CP, idGerant) VALUES("TotoBoutique", "antoine.nosal@totoboutique.com", 50, "Aristide Briand", "Nancy", 54000, 2);

-- Insertion de tuples dans la table Marque
INSERT INTO Marque(nomMarque) VALUES("Adidas");
INSERT INTO Marque(nomMarque) VALUES("Nike");
INSERT INTO Marque(nomMarque) VALUES("Nokia");

-- Insertion de tuples dans la table Produit
INSERT INTO Produit(libelle, idMarque, description) VALUES("", 1, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("", 1, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("", 2, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("", 2, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("", 3, "");
INSERT INTO Produit(libelle, idMarque, description) VALUES("", 3, "");