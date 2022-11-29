SELECT person_id
FROM person_visits
WHERE pizzeria_id = 2
   OR visit_date BETWEEN '2022-01-06' AND '2022-01-09'
GROUP BY person_id
ORDER BY person_id DESC;
