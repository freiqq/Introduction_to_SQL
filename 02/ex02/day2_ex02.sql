SELECT CASE
           WHEN person.name IS NOT NULL THEN person.name
           ELSE '-'
           END AS person_name,
       person_visits.visit_date,
       CASE
           WHEN pizzeria.name IS NOT NULL THEN pizzeria.name
           ELSE '-'
           END AS pizzeria_name
FROM (SELECT *
      FROM person_visits
      WHERE visit_date
                BETWEEN '2022-01-01' AND '2022-01-03') person_visits
         FULL OUTER JOIN person ON person.id = person_visits.person_id
         FULL OUTER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
ORDER BY 1, 2, 3;
