--Q1 -

--A)
SELECT dossard, nom 
FROM coureurs;

--B)
SELECT dossard, nom 
FROM coureurs
ORDER BY dossard;

--C)
SELECT equipe, dossard, nom 
FROM coureurs
ORDER BY equipe, nom;

--D)
SELECT dossard, nom, taille 
FROM coureurs
ORDER BY taille;

--E)
SELECT nom, dossard
FROM coureurs
WHERE equipe = 'LavePlusBlanc';

--F)
SELECT coureurs."nom", coureurs."dossard"
FROM coureurs
WHERE equipe = 'LavePlusBlanc';

--G)
SELECT nom, taille, equipe
FROM coureurs
WHERE taille >= 180;

--H)
SELECT nom, taille, equipe
FROM coureurs
WHERE taille >= 180
ORDER BY taille;

--I)
SELECT couleur 
FROM equipes;

--Q2 -
--A)
SELECT nom || ' appartient à l équipe ' || equipe
FROM coureurs;

--B)
SELECT nom || ' appartient à l équipe ' || equipe as appartenance
FROM coureurs;

--C)
SELECT UPPER(nom) as "nom maj", LENGTH(nom) as lg
FROM coureurs;

--D)
SELECT UPPER(nom) as "nom maj", LENGTH(nom) as lg
FROM coureurs
ORDER BY LENGTH(nom);

SELECT UPPER(nom) as "nom maj", LENGTH(nom) as lg
FROM coureurs
ORDER BY lg;

--E)
SELECT dossard, UPPER(SUBSTR(nom,1, 1)) || SUBSTR(nom,2) as "nom", UPPER(SUBSTR(equipe, 1, 3)) as "equipe"
FROM coureurs;

--Q3 -
--A) 
SELECT nom 
FROM coureurs
WHERE nom LIKE 'a%';

--B)
SELECT nom 
FROM coureurs
WHERE nom LIKE '%er%';

--C)
SELECT nom 
FROM coureurs
WHERE LENGTH(nom) = 5; 

--D)
SELECT nom 
FROM coureurs
WHERE nom LIKE '%a__'; 

--E)
SELECT nom 
FROM coureurs
WHERE nom LIKE '%a__%'; 

--Q4 -
--A)
SELECT taille / 100 as "taille"
FROM coureurs; 

--Cela se met en type integer et non floater

--B)
SELECT taille / 100.0 as "taille"
FROM coureurs; 

--C)
SELECT CAST(taille AS float) / 100 as "taille"
FROM coureurs; 

--D)


--Q5 -
--A)
--On fait une jointure avec le nom des équipes

--B)
SELECT dossard, coureurs.nom, equipe, couleur
FROM coureurs
JOIN equipes ON coureurs.equipe = equipes.nom;

--C)
SELECT coureurs.nom, directeur
FROM coureurs
JOIN equipes ON coureurs.equipe = equipes.nom;

--D)
SELECT coureurs.nom, dossard
FROM coureurs
JOIN equipes ON coureurs.equipe = equipes.nom
WHERE directeur = 'Ralph';

--E)
SELECT directeur
FROM equipes
JOIN coureurs ON coureurs.equipe = equipes.nom
WHERE coureurs.nom = 'alphonse';

-- Q6 -
-- A)

INSERT INTO equipes 
VALUES ("Giant", "Noir", "Patrick");

-- B)

INSERT INTO coureurs 
VALUES (8, "warren", "Giant", 180);

INSERT INTO coureurs 
VALUES (9, "dumoulin", "Giant", 192);

-- Q7 - 
-- A)

SELECT nom
FROM equipes
WHERE directeur IS NULL;

-- B)

SELECT nom
FROM equipes
WHERE directeur IS NOT NULL;

-- Q8 -
-- A)

UPDATE coureurs
SET taille = taille - 1
WHERE equipe = "PicsouBank";

-- B)

UPDATE equipes
SET directeur = 'Jules'
WHERE directeur IS NULL;

-- Q9 -
-- 1)

SELECT MAX(taille) AS "taille maxi", AVG(taille) AS "taille moyenne"
FROM coureurs;

-- 2)

SELECT MAX(taille) AS "taille maxi", AVG(taille) AS "taille moyenne", COUNT(nom) AS "nombre de coureur"
FROM coureurs;

-- 3)

SELECT COUNT(nom) AS "nombre d'équipes", COUNT(directeur) AS "nombre d'équipe avec directeur"
FROM equipes;  

-- Q10 -
-- 1)

SELECT dossard, nom, quand
FROM coureurs
LEFT JOIN visites USING (dossard);

-- 2)

SELECT dossard, nom
FROM coureurs
LEFT JOIN visites USING (dossard)
WHERE quand IS NULL;