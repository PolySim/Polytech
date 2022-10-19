-- Active: 1666170243398@@127.0.0.1@3306

-- Simon DESDEVISES

-- Exercice 1

-- Q1

CREATE TABLE
    etapes(
        numero INT PRIMARY KEY,
        nom VARCHAR(40)
    );

-- Q2

CREATE TABLE
    temps(
        dossard INT,
        etape INT,
        chrono INTERVAL NOT NULL,
        id INTEGER PRIMARY KEY SERIAL,
        FOREIGN KEY (dossard) REFERENCES coureurs(dossard),
        FOREIGN KEY (etape) REFERENCES etapes(numero)
    );

-- Q3

-- Il faut ajouter les FOREIGN KEY (fait dès la question 2)

-- Q4

ALTER TABLE temps ADD CHECK (chrono <= '6h' AND chrono >'0');

-- Q5

INSERT INTO etapes VALUES (1, 'one');

INSERT INTO etapes VALUES(2, 'two');

INSERT INTO etapes VALUES(3, 'three');

INSERT INTO
    temps (etape, dossard, chrono)
VALUES (1, 1, '3h 5 minutes 53s'), (2, 7, '4h 2 minutes 2s'), (1, 7, '2h 56 minutes 23s');

-- Q6

-- 1)

CREATE TABLE temp_etapes AS SELECT * FROM etapes;

CREATE TABLE temp_temps AS SELECT * FROM temps;

-- 2)

DELETE FROM etapes;

-- Supprime toutes les lignes car on a pas mit de condition

-- 3)

DELETE FROM temps;

INSERT INTO
    temps (etape, dossard, chrono)
VALUES (1, 5, '2h 13 minutes 23s');

-- C'est l'id 4 qui a été généré

-- 4)

DELETE FROM temps;

ALTER SEQUENCE temps_id_seq RESTART;

-- 5)

DELETE FROM etapes;

-- 6)

INSERT INTO etapes VALUES (SELECT * FROM temp_etapes);

INSERT INTO temps VALUES (SELECT * FROM temp_temps) ;

-- Q7

SELECT
    dossard,
    chrono,
    RANK() OVER(
        ORDER BY chrono
    )
FROM temps;