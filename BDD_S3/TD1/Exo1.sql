--1-2

--Q1 -

--π^^name, years(name)

SELECT name, years FROM members;

--Q2 -

--λ^^years<2015(members)

SELECT * FROM members WHERE years < 2015;

--Q3 -

--λ^^pop>=50000(towns)

SELECT * FROM towns WHERE pop >= 5000;

--Q4 -

--λ^^pop>=50000 and area<=15(towns)

SELECT * FROM towns WHERE ( pop >= 5000 AND area < 15 );

--Q5 -

--λ^^area<=15(π^^nom, area(towns))

SELECT name, area FROM towns WHERE area >= 15;

--3

--Q1 -

--Non car les deux n'ont pas le même schéma

--Q2 -

--π^^name,town(members) U users

SELECT name, town FROM members UNION SELECT name, town FROM users;

--Q3 -

--π^^name(users) - π^^name(members)

SELECT name FROM users EXCEPT SELECT name FROM members;

--4

--Q1 -

--id      name.members    year    town    town    name.towns  pop     area

--27B-6   Martin          2019    86194   86195   Poitiers    88291   42

--78Y-9   Thomas          2018    69123   69123   Lyon        516092  47

--66A-7   Petit           1999    33036   33036   Bordeaux    254436  49

--42Z-6   Robert          2010    86194   86195   Poitiers    88291   42

--59S-4   Richard         2019    33062   33062   Bordeaux    254436  49

--78T-8   Durand          2012    67482   67482   Strasbourg  280966  78

--Q2 -

--la valeur town (59350) n'appartient pas à la table town

--Q3 -

SELECT
    id,
    name.members,
    town,
    name.towns
FROM members
    JOIN towns USING(town)
WHERE town = "86194";