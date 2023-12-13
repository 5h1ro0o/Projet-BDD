-- Quel est la liste des séries de la base ?
SELECT * FROM Serie;

-- Combien de PaysOrigine différents ont créé des séries dans notre base ?
SELECT COUNT(DISTINCT PaysOrigine) FROM Serie;

-- Quels sont les TitreSeries des séries originaires du Japon, triés par TitreSerie ?
SELECT TitreSerie FROM Serie WHERE PaysOrigine = 'Japon' ORDER BY TitreSerie;

-- Combien y a-t-il de séries originaires de chaque PaysOrigine ?
SELECT PaysOrigine, COUNT(*) AS count FROM Serie GROUP BY PaysOrigine;

-- Combien de séries ont été créées entre 2001 et 2015?
SELECT COUNT(*) FROM Serie WHERE annee BETWEEN '2001-01-01' AND '2015-12-31';

-- Quelles séries sont à la fois du genre « Comédie » et « Science-Fiction » ?
SELECT TitreSerie FROM Serie WHERE genre LIKE '%Comédie%' AND genre LIKE '%Science-Fiction%';

-- Quels sont les séries produites par « Spielberg », affichés par date décroissantes ?
SELECT TitreSerie FROM Serie WHERE producteur = 'Spielberg' ORDER BY annee DESC;

-- Afficher les séries Américaines par ordre de nombre de saisons croissant.
SELECT TitreSerie FROM Serie WHERE PaysOrigine = 'USA' ORDER BY NombreSaison ASC;

-- Quelle série a le plus d’épisodes ?
SELECT TitreSerie FROM Serie ORDER BY NombreEpisode DESC LIMIT 1;

-- La série « Big Bang Theory » est-elle plus appréciée des hommes ou des femmes ?
SELECT genre, COUNT(*) AS count FROM Serie WHERE TitreSerie = 'Big Bang Theory' GROUP BY genre;

-- Affichez les séries qui ont une note moyenne inférieure à 5, classé par note.
SELECT TitreSerie FROM Serie WHERE NoteMoyenne < 5 ORDER BY NoteMoyenne;

-- Pour chaque série, afficher le commentaire correspondant à la meilleure note.
SELECT s.TitreSerie, c.commentaireID FROM Serie INNER JOIN Commentaire c ON s.id = c.serieID WHERE c.note = (SELECT MAX(note) FROM Commentaire WHERE serieID = s.id);

-- Affichez les séries qui ont une note moyenne sur leurs épisodes supérieure à 8.
SELECT TitreSerie FROM Serie WHERE NoteMoyenneEpisode > 8;

-- Afficher le nombre moyen d’épisodes des séries avec l’acteur « Bryan Cranston ».
SELECT AVG(NombreEpisode) FROM Serie WHERE acteurs LIKE '%Bryan Cranston%';

-- Quels acteurs ont réalisé des épisodes de série ?
SELECT DISTINCT Acteurs FROM Episode;

-- Quels acteurs ont joué ensemble dans plus de 80% des épisodes d’une série ?
SELECT acteurs
FROM Serie
WHERE (CAST(NombreEpisode AS FLOAT) / (SELECT SUM(NombreEpisode) FROM Serie)) > 0.8;

-- Quels acteurs ont joué dans tous les épisodes de la série « Breaking Bad » ?
SELECT acteurs
FROM Serie
WHERE TitreSerie = 'Breaking Bad' AND NombreEpisode = (SELECT COUNT(*) FROM Episode WHERE SerieID = Serie.id);

-- Quels utilisateurs ont donné une note à chaque série de la base ?
SELECT DISTINCT utilisateur
FROM Notes
WHERE (SELECT COUNT(DISTINCT serieID) FROM Serie) = (SELECT COUNT(DISTINCT serieID) FROM Notes WHERE utilisateur = notes.utilisateur);

-- Pour chaque message, affichez son niveau et si possible le TitreSerie de la série en question.
SELECT m.niveau, s.TitreSerie
FROM messages m
LEFT JOIN Serie s ON m.id_serie = s.id;

-- Les messages initiés par « Azrod95 » génèrent combien de réponses en moyenne ?
SELECT AVG(nb_reponses)
FROM messages
WHERE initiateur = 'Azrod95';
