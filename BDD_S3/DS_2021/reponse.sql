-- Active: 1664994810184@@127.0.0.1@3306

-- Q1

-- 1)

-- medicins -> rpps | nom NOT NULL

-- patients -> nir | nom NOT NULL

-- ordonnances -> id | [prescr, patient] FOREIGN KEY | quand NOT NULL

-- 2)

CREATE TABLE
    medecins (
        rpps VARCHAR(11) PRIMARY KEY,
        nom VARCHAR(50),
        CHECK (LENGTH(rpps) = 11)
    );

CREATE TABLE
    patients (
        nir VARCHAR(15) PRIMARY KEY,
        nom VARCHAR(50),
        CHECK (LENGTH(nir) = 15)
    );

CREATE TABLE
    ordonnances (
        id INTEGER PRIMARY KEY,
        prescr VARCHAR(11),
        patient VARCHAR(15),
        quand DATE NOT NULL,
        FOREIGN KEY (prescr) REFERENCES medecins(rpps),
        FOREIGN KEY (patient) REFERENCES patients(nir)
    );

-- Q2

-- 1)

SELECT
    prescr AS rpps,
    patient AS nir
FROM ordonnances
WHERE quand = '2021-10-20';

-- 2)

SELECT
    medecins.nom AS nom_medecin,
    patients.nom AS nom_patient
FROM ordonnances
    JOIN medecins ON medecins.rpps = ordonnances.prescr
    JOIN patients ON patients.nir = ordonnances.patient
WHERE (
        quand >= '2021-09-01'
        AND quand <= '2021-10-20'
    );

-- 3)

SELECT
    MIN(quand) AS plus_ancienne,
    MAX(quand) AS plus_recente
FROM ordonnances
WHERE prescr = '12345678901';

-- 4)

SELECT
    prescr AS rpps,
    MIN(quand) AS plus_ancienne,
    MAX(quand) AS plus_recente
FROM ordonnances
GROUP BY prescr;

-- 5)

SELECT
    prescr AS rpps,
    patient AS nir,
    COUNT(*) AS nombre
FROM ordonnances
GROUP BY prescr, patient;

-- 6)

SELECT
    prescr AS rpps,
    patient AS nir,
    COUNT(*) AS nombre
FROM ordonnances
GROUP BY prescr, patient
HAVING COUNT(*) > 100;

-- 7)

SELECT
    DISTINCT ordonnances.prescr AS rpps
FROM ordonnances
    JOIN (
        SELECT
            prescr,
            patient
        FROM
            ordonnances
    ) AS temp ON ordonnances.prescr = temp.prescr
    AND ordonnances.patient = temp.patient
WHERE (
        ordonnances.patient LIKE '12345%'
        AND temp.patient = '23451%'
    );

-- 8)

SELECT
    prescr AS rpps,
    COUNT(ordo)
FROM medecins
    LEFT JOIN ordonnances ON medecins.rpps = ordonnances.prescr
GROUP BY prescr;

-- Q3

-- ref PRIMARY KEY | ordo FOREIGN KEY | [qte, pu] NOT NULL

-- Q4

-- 1)

SELECT
    ordo,
    quand,
    SUM(pu) AS prix
FROM produits
    JOIN ordonnances ON ordonnances.id = produits.ordo
GROUP BY ordo
WHERE patient LIKE '12345%';

-- 2)