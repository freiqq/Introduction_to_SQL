CREATE SEQUENCE seq_person_discounts
START WITH 1
INCREMENT BY 1;

SELECT setval('seq_person_discounts', MAX(id)) FROM person_discounts;
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');