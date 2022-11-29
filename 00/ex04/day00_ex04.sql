SELECT FORMAT('%s (age:%s,gender:%L,address:%L)',
              name,
              age,
              gender,
              address) AS person_information
FROM person
ORDER BY 1;