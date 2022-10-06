-- Simon DESDEVISES

-- Exercice 1

-- Q1

SELECT
    nom,
    CAST( (superficie / 5) + 1 AS INTEGER) AS categorie
FROM communes;

-- Q2

SELECT
    COUNT(*) AS nombre_communes,
    AVG(superficie) AS moyenne
FROM communes
GROUP BY
    CAST(superficie / 5 AS INTEGER)
ORDER BY
    CAST(superficie / 5 AS INTEGER);

-- Q3

SELECT
    communes.*,
    CAST( (superficie / 5) + 1 AS INTEGER) AS cat_sup,
    CAST( (pop_totale / 1000) + 1 AS INTEGER) AS cat_pop,
    pop_totale AS pop_2016
FROM population
    JOIN communes USING(insee)
WHERE recensement = 2016;

-- Q4

SELECT
    COUNT(*) AS nombre_communes,
    MIN(superficie) AS minimum,
    MAX(superficie) AS maximum,
    ROUND(AVG(superficie), 2) AS moyenne_superficie
FROM communes
    JOIN population USING(insee)
WHERE recensement = 2016
GROUP BY
    CAST(pop_totale / 1000 AS INTEGER)
ORDER BY
    CAST(pop_totale / 1000 AS INTEGER);

SELECT
    COUNT(*) AS nombre_communes,
    MIN(superficie) AS minimum,
    MAX(superficie) AS maximum,
    ROUND(AVG(superficie), 2) AS moyenne_superficie
FROM communes
    JOIN population USING(insee)
WHERE recensement = 2016
GROUP BY
    CAST(pop_totale / 1000 AS INTEGER)
HAVING nombre_communes > 5
ORDER BY nombre_communes DESC;

-- Exercice 2

-- Q1

CREATE VIEW EXO_2 AS 
	SELECT
	    communes.*,
	    CAST( (superficie / 5) + 1 AS INTEGER) AS cat_sup,
	    CAST( (pop_totale / 1000) + 1 AS INTEGER) AS cat_pop,
	    pop_totale AS pop_2016
	FROM population
	    JOIN communes USING(insee)
	WHERE recensement =
2016; 

CREATE OR REPLACE VIEW EXO_2 AS 
	SELECT
	    COUNT(*) AS nombre_communes,
	    MIN(superficie) AS minimum,
	    MAX(superficie) AS maximum,
	    ROUND(AVG(superficie), 2) AS moyenne_superficie
	FROM communes
	    JOIN population USING(insee)
	WHERE recensement = 2016
	GROUP BY
	    CAST(pop_totale / 1000 AS INTEGER)
	HAVING nombre_communes > 5
	ORDER BY nombre_communes
DESC; 

-- Exercice 3

SELECT
    insee,
    nom,
    MIN(pop_totale) AS pop_2012,
    MAX(pop_totale) AS pop_2016,
    MAX(pop_totale) - MIN(pop_totale) AS progression,
    ROUND(
        CAST(
            MAX(pop_totale) - MIN(pop_totale) AS FLOAT
        ) / CAST(MAX(pop_totale) AS FLOAT) * 100,
        2
    ) || "%" AS "pourcentage de progression"
FROM population
    JOIN communes USING(insee)
WHERE
    recensement = 2012
    OR recensement = 2016
GROUP BY nom;