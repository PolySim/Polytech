--Ex 1

--Q1

--Q2 -

SELECT
    members.name as nom,
    town.name as ville
FROM members
    LEFT JOIN town USING (town);

--Ex 2

--Q1 -

SELECT id, name, note
FROM members
    LEFT JOIN actiA USING(id);

--Q2 -

SELECT
    id,
    name,
    actiA.note as noteA,
    actiB.note as noteB
FROM members
    LEFT JOIN actiA USING(id)
    LEFT JOIN actiB USING(id);

--Ex 3

--Q1 -

--(A, B) (D, C)

--Q2 -

SELECT follower, target FROM abos INTERSECT ;

SELECT target, follower FROM abos WHERE follower < target;

--Q3 -

SELECT t1.follower, t1.target
FROM abo as t1
    JOIN abo as t2 ON t1.target = t2.follower
WHERE t1.follower = t2.target;