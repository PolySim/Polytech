-- Exo 1

-- Q1 -

-- 1)

SELECT
    pseudo,
    cagnotte,
    inscrit
FROM users
ORDER BY
    DATE_PART(year, inscrit),
    cagnotte DESC;

-- 2)

SELECT id, prix FROM jeux WHERE prix > 10;

-- 3)

SELECT jeu, points FROM parties WHERE joueur = 'Gandalf';

-- 4)

SELECT nom, points
FROM parties
    JOIN jeux ON jeux.id = parties.jeu
WHERE joueur = 'Gandalf';

-- 5)

SELECT COUNT(id), AVG(prix) FROM jeux;

-- 6)

SELECT jeu, SUM(points) FROM parties WHERE joueur = 'Gandalf';

GROUP BY jeu -- 7)
SELECT jeu, COUNT(*) as nombre
FROM parties
GROUP BY jeu
HAVING nombre > 1000000;

-- 8)

SELECT
    users.nom,
    jeux.nom,
    points
FROM parties
    JOIN jeux ON jeux.id = parties.jeu
    JOIN users ON users.pseudo = parties.joueur
WHERE points > 10000;

-- Exercice Supplémentaire

-- Les pseudos des joueurs n'ayant pas joué depuis 2020

SELECT joueur
FROM parties
GROUP BY joueur
HAVING
    MAX(date_part(year, quand)) < 2020;

-- pseudo des joueur qui ont joué au moins 5 fois depuis 2020

SELECT joueur
FROM parties
GROUP BY joueur
WHERE
    date_part(year, quand) >= 2020
HAVING COUNT(quand) >= 5;