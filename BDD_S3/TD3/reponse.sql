-- Exo 1
-- Q1 -
-- 1)

SELECT pseudo, cagnotte, inscrit
FROM users
ORDER BY DATE_PART(year, inscrit), cagnotte DESC;

-- 2)

SELECT id, prix
FROM jeux
WHERE prix > 10;

-- 3)

SELECT jeu, points
FROM parties
WHERE joueur = 'Gandalf';

-- 4)

SELECT nom, points
FROM parties
JOIN jeux ON jeux.id = parties.jeu
WHERE joueur = 'Gandalf';

-- 5)

SELECT COUNT(id), AVG(prix)
FROM jeux;

-- 6)

SELECT jeu, SUM(points)
FROM parties
GROUP BY jeu 
WHERE joueur = 'Gandalf';

-- 7)

SELECT jeux.id, COUNT(parties.jeu) as 'nomber'
FROM jeux
JOIN parties ON jeux.id = parties.jeu
GROUP BY id 
WHERE 'number' > 1000000;

-- 8)

SELECT joueur, nom, points
FROM parties
JOIN jeux ON jeux.id = parties.jeu
WHERE points > 10000;