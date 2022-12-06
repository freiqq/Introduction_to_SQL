CREATE VIEW v_symmetric_union AS

WITH R_S AS ((SELECT * FROM person_visits WHERE visit_date = '2022-01-02')
             EXCEPT
             (SELECT * FROM person_visits WHERE visit_date = '2022-01-06')),
     S_R AS ((SELECT * FROM person_visits WHERE visit_date = '2022-01-06')
             EXCEPT
             (SELECT * FROM person_visits WHERE visit_date = '2022-01-02'))


SELECT person_id
FROM (SELECT *
      FROM R_S
      UNION
      SELECT *
      FROM S_R) AS symmetric_union
ORDER BY person_id;