WITH male_visited AS (
    SELECT p.name
    FROM (SELECT *
          FROM person
          WHERE person.gender = 'male') as man
             INNER JOIN person_visits AS pv ON pv.person_id = man.id
             INNER JOIN pizzeria p on p.id = pv.pizzeria_id
    ORDER BY p.name
),
     female_visited AS (
         SELECT p.name
         FROM (SELECT *
               FROM person
               WHERE person.gender = 'female') as man
                  INNER JOIN person_visits AS pv ON pv.person_id = man.id
                  INNER JOIN pizzeria p on p.id = pv.pizzeria_id
         ORDER BY p.name
     )

(SELECT *
FROM female_visited
EXCEPT ALL
SELECT *
FROM male_visited)
UNION ALL
(SELECT *
FROM male_visited
EXCEPT ALL
SELECT *
FROM female_visited)
ORDER BY 1;






