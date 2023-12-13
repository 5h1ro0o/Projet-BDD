USE testtt;

DROP TABLE IF EXISTS EpisodeActeurs, SerieNote, EpisodeNote, SerieAuteur, EpisodeAuteur, NoteUtilisateur, Message, Episode, Commentaire, Utilisateur, Note, Auteur, Acteurs, Saison, Serie;

CREATE TABLE Serie (
    serieID INT PRIMARY KEY IDENTITY,
    TitreSerie VARCHAR(255) NOT NULL,
    annee DATE NOT NULL,
    createur VARCHAR(255) NOT NULL,
    producteur VARCHAR(255) NOT NULL,
    PaysOrigine VARCHAR(255) NOT NULL,
    DateCreation DATE NOT NULL,
    NombreSaison INT NOT NULL,
    NombreEpisode INT NOT NULL,
    NoteMoyenne INT NOT NULL,
    genre VARCHAR(255) NOT NULL
);

CREATE TABLE Saison (
    saisonID INT PRIMARY KEY IDENTITY,
    numeroSaison INT NOT NULL,
    serieID INT NOT NULL,
    FOREIGN KEY(serieID) REFERENCES Serie(serieID)
);

CREATE TABLE Acteurs (
    acteurID INT PRIMARY KEY IDENTITY,
    NomActeur VARCHAR(255) NOT NULL,
    PrenomActeur VARCHAR(255) NOT NULL
);

CREATE TABLE Auteur (
    auteurID INT PRIMARY KEY IDENTITY,
    NomAuteur VARCHAR(255) NOT NULL,
    PrenomAuteur VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('createur', 'producteur'))
);

CREATE TABLE Note (
    noteID INT PRIMARY KEY IDENTITY,
    serie VARCHAR(255) NOT NULL,
    episode VARCHAR(255) NOT NULL,
    note INT NOT NULL CHECK (note BETWEEN 0 AND 20),
    date DATE NOT NULL
);

CREATE TABLE Utilisateur (
    utilisateurID INT PRIMARY KEY IDENTITY,
    pseudo VARCHAR(255) NOT NULL,
    DateInscription DATE NOT NULL,
    age INT NOT NULL,
    sexe VARCHAR(50) NOT NULL CHECK (sexe IN ('homme', 'femme'))
);

CREATE TABLE Commentaire (
    commentaireID INT PRIMARY KEY IDENTITY,
    texte TEXT NOT NULL,
    DateCommentaire DATE NOT NULL,
    noteID INT NOT NULL,
    FOREIGN KEY(noteID) REFERENCES Note(noteID)
);

CREATE TABLE Episode (
    episodeID INT PRIMARY KEY IDENTITY,
    TitreEpisode VARCHAR(255) NOT NULL,
    duree INT NOT NULL,
    DateSortie DATE NOT NULL,
    realisateur VARCHAR(255) NOT NULL,
    resume TEXT NOT NULL,
    saisonID INT NOT NULL,
    NoteMoyenneEpisode INT NOT NULL,
    FOREIGN KEY(saisonID) REFERENCES Saison(saisonID)
);

CREATE TABLE Message (
    messageID INT PRIMARY KEY IDENTITY,
    DateMessage DATE NOT NULL,
    contenu TEXT NOT NULL,
    sujet VARCHAR(255) NOT NULL,
    titre VARCHAR(255) NOT NULL,
    utilisateurID INT NOT NULL,
    FOREIGN KEY(utilisateurID) REFERENCES Utilisateur(utilisateurID)
);

CREATE TABLE NoteUtilisateur (
    noteUtilisateurID INT PRIMARY KEY IDENTITY,
    utilisateurID INT NOT NULL,
    noteID INT NOT NULL,
    FOREIGN KEY(utilisateurID) REFERENCES Utilisateur(utilisateurID),
    FOREIGN KEY(noteID) REFERENCES Note(noteID)
);

CREATE TABLE EpisodeAuteur (
    episodeAuteurID INT PRIMARY KEY IDENTITY,
    auteurID INT NOT NULL,
    episodeID INT NOT NULL,
    FOREIGN KEY(auteurID) REFERENCES Auteur(auteurID),
    FOREIGN KEY(episodeID) REFERENCES Episode(episodeID)
);

CREATE TABLE SerieAuteur (
    serieAuteurID INT PRIMARY KEY IDENTITY,
    auteurID INT NOT NULL,
    serieID INT NOT NULL,
    FOREIGN KEY(auteurID) REFERENCES Auteur(auteurID),
    FOREIGN KEY(serieID) REFERENCES Serie(serieID)
);

CREATE TABLE EpisodeNote (
    episodeNoteID INT PRIMARY KEY IDENTITY,
    noteID INT NOT NULL,
    episodeID INT NOT NULL,
    FOREIGN KEY(noteID) REFERENCES Note(noteID),
    FOREIGN KEY(episodeID) REFERENCES Episode(episodeID)
);

CREATE TABLE SerieNote (
    serieNoteID INT PRIMARY KEY IDENTITY,
    noteID INT NOT NULL,
    serieID INT NOT NULL,
    FOREIGN KEY(noteID) REFERENCES Note(noteID),
    FOREIGN KEY(serieID) REFERENCES Serie(serieID)
);

CREATE TABLE EpisodeActeurs (
    episodeActeursID INT PRIMARY KEY IDENTITY,
    acteurID INT NOT NULL,
    episodeID INT NOT NULL,
    FOREIGN KEY(acteurID) REFERENCES Acteurs(acteurID),
    FOREIGN KEY(episodeID) REFERENCES Episode(episodeID)
);