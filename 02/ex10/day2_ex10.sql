SELECT person.name AS person_name1, p.name AS person_name2, p.address AS common_address
FROM person
    FULL JOIN person p ON p.address = person.address
WHERE person.id > p.id
ORDER BY 1, 2, 3;