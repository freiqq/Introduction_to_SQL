SELECT order_date, FORMAT('%s (age:%s)', name, age) AS person_name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
ORDER BY person_name;