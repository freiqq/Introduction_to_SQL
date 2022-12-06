SELECT address,
        ((MAX(age)::float - (MIN(age)::float / MAX(age)::float))::float) AS formula,
       ROUND(AVG(age), 2)                                             AS average,
       CASE
           WHEN ROUND(AVG(age), 2) <
                (MAX(age)::float - (MIN(age)::float / MAX(age)::float))::float
               THEN true
           ELSE false
           END

FROM person
GROUP BY address
ORDER BY 1