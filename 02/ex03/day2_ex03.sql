WITH pv AS (SELECT visit_date
            FROM person_visits
            GROUP BY visit_date)

SELECT pv.visit_date
FROM pv
         FULL JOIN (SELECT visit_date
                    FROM person_visits
                    WHERE person_id
                              BETWEEN 1 AND 2
                    GROUP BY visit_date) AS person_visits ON pv.visit_date = person_visits.visit_date
WHERE person_visits IS NULL
ORDER BY pv.visit_date;