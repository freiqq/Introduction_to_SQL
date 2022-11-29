-- Напишите SQL-запрос, который возвращает недостающие
-- дни с 1 по 10 января 2022 года (включая все дни) для визитов лиц с
-- идентификаторами 1 или 2. Пожалуйста, упорядочьте по дням посещений
-- в порядке
-- возрастания. Образец данных с именем столбца представлен ниже.

SELECT rrj_pv.visit_date AS missing_date
FROM (SELECT pv.visit_date
      FROM (SELECT visit_date, person_id
            FROM person_visits
            WHERE person_id = '1'
               OR person_id = '2'
           ) AS pv
               RIGHT JOIN person_visits rj_pv ON rj_pv.person_id = pv.person_id
      GROUP BY pv.visit_date) AS temp_table
         RIGHT JOIN person_visits rrj_pv ON rrj_pv.visit_date = temp_table.visit_date
WHERE temp_table.visit_date IS NULL
GROUP BY missing_date
ORDER BY missing_date;

-- SELECT person_visits.visit_date
-- FROM person_visits
--          LEFT JOIN (SELECT *
--                     FROM person_visits
--                     WHERE person_id = '1'
--                        OR person_id = '2') pv
--                    ON person_visits.person_id = pv.person_id
-- WHERE pv.visit_date IS NOT NULL
-- GROUP BY person_visits.visit_date;
