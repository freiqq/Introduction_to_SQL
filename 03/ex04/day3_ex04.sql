WITH male_visited AS (
    SELECT p.name
    FROM (SELECT *
          FROM person
          WHERE person.gender = 'male') as man
             INNER JOIN person_order AS po ON po.person_id = man.id
             INNER JOIN menu m on m.id = po.menu_id
             INNER JOIN pizzeria p on p.id = m.pizzeria_id
    ORDER BY p.name
),
     female_visited AS (
         SELECT p.name
         FROM (SELECT *
               FROM person
               WHERE person.gender = 'female') as man
                  INNER JOIN person_order AS po ON po.person_id = man.id
                  INNER JOIN menu m on m.id = po.menu_id
                  INNER JOIN pizzeria p on p.id = m.pizzeria_id
         ORDER BY p.name
     )

(SELECT *
FROM female_visited
EXCEPT
SELECT *
FROM male_visited)
UNION
(SELECT *
FROM male_visited
EXCEPT
SELECT *
FROM female_visited)
ORDER BY 1;