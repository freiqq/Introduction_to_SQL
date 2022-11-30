SELECT person.name AS name1, p.name AS name2, p.address
FROM person
    FULL JOIN person p ON p.address = person.address
WHERE person.id > p.id
ORDER BY 1, 2, 3;