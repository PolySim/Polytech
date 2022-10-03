-- Exercice 1

-- Q1

-- 1)

SELECT
    jeu,
    COUNT(DISTINCT, jeu) AS nomber_parties
FROM parties
    JOIN jeux ON parties.jeu = jeux.id
WHERE prix > 100
HAVING nomber_parties > 1000;

-- 2)

SELECT
    jeu,
    COUNT(DISTINCT, joueur) AS nomber_joueur
FROM parties
    JOIN jeu ON parties.jeu = jeux.IDENTIFIED
WHERE prix > 100
GROUP BY jeu
HAVING nomber_joueur > 50;

-- 3)

SELECT SUM(points) AS points FROM parties;

-- 4)

SELECT
    date_part(year, quand) AS année,
    SUM(points) AS "points"
FROM parties
GROUP BY année;

-- 5)

SELECT
    date_part(year, quand) AS année,
    date_part(month, quand) AS mois,
    SUM(points) AS "points"
FROM parties
GROUP BY année, mois;

-- 6)

SELECT
    date_part(year, quand) AS année,
    joueur,
    SUM(points) AS "points"
FROM parties
GROUP BY joueur, année;

-- 7)

SELECT pseudo
FROM users
    LEFT JOIN parties ON users.pseudo = parties.joueur
WHERE parties.jeu IS NULL;

-- 8)

SELECT joueur
FROM parties
GROUP BY joueur
HAVING
    COUNT(DISTINCT, jeu) >= 2;

-- 9)

SELECT
    jeu,
    COUNT(*) AS nomber_partie
FROM parties
GROUP BY jeu
HAVING nomber_partie > 10;