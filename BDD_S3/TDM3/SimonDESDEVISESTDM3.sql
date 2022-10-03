-- Simon DESDEVISES

-- Q1 -
-- 1)

SELECT insee, nom, superficie
FROM communes
ORDER BY superficie DESC;

-- 2)

SELECT insee, nom
FROM communes
WHERE nom LIKE '%Lille%';

-- 3)

SELECT insee, SUBSTR(insee, 1, 2) AS "departement", nom
FROM communes;

-- 4)

SELECT insee, nom, recensement, pop_totale
FROM communes
JOIN population USING(insee)
ORDER by nom DESC, recensement;

-- 5)

SELECT insee, nom, pop_totale
FROM communes
JOIN population USING(insee)
WHERE recensement = 2016
ORDER by pop_totale DESC; 

-- 6)

SELECT insee, nom, pop_mun, superficie, CAST(pop_mun / superficie AS INTEGER) AS "densité" 
FROM communes
JOIN population USING(insee)
ORDER by "densité" DESC;


-- Q2 -

SELECT insee, nom, pop_mun, superficie, CAST(pop_mun / superficie AS INTEGER) AS "densité" 
FROM communes
JOIN population USING(insee)
ORDER by "densité" DESC;


-- Q3 -
-- 1)

SELECT nom AS "nom de commune", nom_station AS "nom de station", lat as latitude, lon as longitude
FROM stations
JOIN communes USING(insee)
ORDER BY nom;

-- 2)

SELECT nom AS "nom de commune", nom_station AS "nom de station", lat as latitude, lon as longitude
FROM communes
LEFT JOIN stations USING(insee)
ORDER BY nom;


-- Q4 -
-- 1)

SELECT COUNT(*) AS "Nombre total de mesure"
FROM mesures_mensuelles;

-- 2)

SELECT AVG(valeur) AS "moyenne", MAX(valeur) AS "maximun", MIN(valeur) AS "minimum"
FROM mesures_mensuelles
WHERE code_polluant = 7;

-- 3)

SELECT  COUNT(*) AS "nombre de mesure", AVG(valeur) AS "moyenne", MAX(valeur) AS "maximun", MIN(valeur) AS "minimum"
FROM mesures_mensuelles
WHERE code_polluant = 7
GROUP BY code_station;

-- 4)

SELECT  COUNT(*) AS "nombre de mesure", AVG(valeur) AS "moyenne", MAX(valeur) AS "maximun", MIN(valeur) AS "minimum", nom_station
FROM mesures_mensuelles
JOIN stations USING(code_station)
WHERE code_polluant = 7
GROUP BY code_station;

-- 5)

SELECT  COUNT(*) AS "nombre de mesure", AVG(valeur) AS "moyenne", MAX(valeur) AS "maximun", MIN(valeur) AS "minimum", nom_station
FROM mesures_mensuelles
JOIN stations USING(code_station)
WHERE code_polluant = 6001
GROUP BY code_station;

-- 6)

SELECT  COUNT(*) AS "nombre de mesure", AVG(valeur) AS "moyenne", MAX(valeur) AS "maximun", MIN(valeur) AS "minimum", nom_station
FROM mesures_mensuelles
JOIN stations USING(code_station)
WHERE code_polluant = 6001
GROUP BY code_station
HAVING "moyenne" > 10;

-- 7)

SELECT code_station, code_polluant, AVG(valeur) AS "moyenne", MAX(valeur) AS "maximum", MIN(valeur) AS "minimum"
FROM mesures_mensuelles
GROUP BY code_station, code_polluant
ORDER BY code_polluant;

-- 8)

SELECT nom_station, nom_polluant, COUNT(valeur) AS "nombre de mesure", AVG(valeur) AS "moyenne", MAX(valeur) AS "maximum", MIN(valeur) AS "minimum"
FROM mesures_mensuelles
JOIN polluants USING(code_polluant)
JOIN stations USING(code_station)
GROUP BY code_station, code_polluant;


-- Q5 -
-- 1)

SELECT code_station, code_polluant
FROM stations
CROSS JOIN polluants;