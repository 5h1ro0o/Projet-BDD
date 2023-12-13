
USE testtt;


INSERT INTO Serie (TitreSerie, annee, createur, producteur, PaysOrigine, DateCreation, NombreSaison, NombreEpisode, NoteMoyenne, genre)
VALUES
('Serie1', '2020-01-01', 'Auteur1', 'Producteur1', 'USA', '2020-01-01', 1, 50, 4, 'Drame'),
('Serie2', '2019-02-01', 'Auteur2', 'Producteur2', 'Canada', '2019-02-01', 2, 100, 5,'Comédie'),
('Serie3', '2021-03-01', 'Auteur3', 'Producteur3', 'France', '2021-03-01', 3, 110, 10, 'Action');


INSERT INTO Saison (numeroSaison, serieID)
VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3);



INSERT INTO Acteurs (NomActeur, PrenomActeur)
VALUES
('Acteur1', 'Nom1'),
('Acteur2', 'Nom2'),
('Acteur3', 'Nom3');



INSERT INTO Auteur (NomAuteur, PrenomAuteur, role)
VALUES
('Auteur1', 'Nom1', 'createur'),
('Auteur2', 'Nom2', 'producteur'),
('Auteur3', 'Nom3', 'createur');


INSERT INTO Note (serie, episode, note, date)
VALUES
('Serie1', 'Episode1', 15, '2020-01-15'),
('Serie2', 'Episode2', 18, '2019-02-15'),
('Serie3', 'Episode3', 12, '2021-03-15');



INSERT INTO Utilisateur (pseudo, DateInscription, age, sexe)
VALUES
('Utilisateur1', '2020-01-01', 25, 'homme'),
('Utilisateur2', '2019-02-01', 30, 'femme'),
('Utilisateur3', '2021-03-01', 22, 'homme');



INSERT INTO Commentaire (texte, DateCommentaire, noteID)
VALUES
('Commentaire1', '2020-01-15', 1),
('Commentaire2', '2019-02-15', 2),
('Commentaire3', '2021-03-15', 3);



INSERT INTO Episode (TitreEpisode, duree, DateSortie, realisateur, resume, NoteMoyenneEpisode, saisonID)
VALUES
('Episode1', 45, '2020-01-01', 'Realisateur1', 'Résumé de l''épisode 1', 4, 1),
('Episode2', 50, '2019-02-01', 'Realisateur2', 'Résumé de l''épisode 2', 5, 2),
('Episode3', 40, '2021-03-01', 'Realisateur3', 'Résumé de l''épisode 3', 10, 3);



INSERT INTO Message (DateMessage, contenu, sujet, titre, utilisateurID)
VALUES
('2020-01-01', 'Contenu du message 1', 'Sujet 1', 'Titre 1', 1),
('2019-02-01', 'Contenu du message 2', 'Sujet 2', 'Titre 2', 2),
('2021-03-01', 'Contenu du message 3', 'Sujet 3', 'Titre 3', 3);



INSERT INTO NoteUtilisateur (utilisateurID, noteID)
VALUES
(1, 1),
(2, 2),
(3, 3);



INSERT INTO EpisodeAuteur (auteurID, episodeID)
VALUES
(1, 1),
(2, 2),
(3, 3);



INSERT INTO SerieAuteur (auteurID, serieID)
VALUES
(1, 1),
(2, 2),
(3, 3);



INSERT INTO EpisodeNote (noteID, episodeID)
VALUES
(1, 1),
(2, 2),
(3, 3);



INSERT INTO SerieNote (noteID, serieID)
VALUES
(1, 1),
(2, 2),
(3, 3);

