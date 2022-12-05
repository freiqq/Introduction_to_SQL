alter table person_discounts add constraint ch_nn_person_id check (person_id IS NOT NULL);
alter table person_discounts add constraint ch_nn_pizzeria_id check (person_discounts.pizzeria_id IS NOT NULL);
alter table person_discounts add constraint ch_nn_discount check (person_discounts.discount IS NOT NULL);

alter table person_discounts add constraint ch_range_discount check (discount BETWEEN 0 AND 100);

