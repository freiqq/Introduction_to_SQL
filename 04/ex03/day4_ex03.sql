SELECT vgd.generated_date AS missing_date
FROM v_generated_dates vgd
FULL JOIN person_visits pv ON pv.visit_date = vgd.generated_date
WHERE id IS NULL
ORDER BY missing_date