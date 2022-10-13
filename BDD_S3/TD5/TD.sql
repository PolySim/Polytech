-- Exercice 1

-- Q1

CREATE TABLE
    users (
        pseudo VARCHAR(20) PRIMARY KEY,
        nom VARCHAR(40) NOT NULL,
        inscrit DATE NOT NULL,
        cagnotte NUMERIC(8, 2) NOT NULL,
        CHECK (cagnotte >= 0)
    );

-- Q2

CREATE TABLE
    joueur (
        id VARCHAR(20) PRIMARY KEY,
        nom VARCHAR(40),
        prix NUMERIC(8, 2) NOT NULL,
        CHECK (prix >= 0)
    );

-- Q3 Q4

CREATE TABLE
    parties (
        id VARCHAR(20) PRIMARY KEY,
        joueur VARCHAR(20) NOT NULL,
        jeu VARCHAR(20) NOT NULL,
        quand DATE NOT NULL,
        points INTEGER NOT NULL,
        CHECK (points >= 0),
        FOREIGN KEY joueur REFERENCES users(id),
        FOREIGN KEY jeu REFERENCES jeux(id)
    );

-- Exercice 2

-- Q1

CREATE TABLE
    salle (
        id VARCHAR(20) PRIMARY KEY,
        nom VARCHAR(40),
        capacite INTEGER,
        CHECK (capacite >= 0)
    );