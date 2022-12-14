alter table person_discounts
    add constraint ch_nn_person_id check (person_id IS NOT NULL);
alter table person_discounts
    add constraint ch_nn_pizzeria_id check (person_discounts.pizzeria_id IS NOT NULL);
alter table person_discounts
    add constraint ch_nn_discount check (person_discounts.discount IS NOT NULL);
alter table person_discounts
    add constraint ch_range_discount check (discount BETWEEN 0 AND 100);
alter table person_discounts
    alter column discount SET default (0);

INSERT INTO person_discounts values(30, 2, 3);
