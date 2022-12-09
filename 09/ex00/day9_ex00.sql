create table person_action
(
    created    timestamp without time zone not null
                                                    default (current_timestamp AT TIME ZONE 'UTC'),
    type_event char(1)                     not null default ('I'),
    row_id     bigint                      not null,
    name       varchar                     not null,
    age        integer                     not null default 10,
    gender     varchar                              default 'female' not null,
    address    varchar
);


alter table person_action
    add constraint ch_type_event check (type_event in ('I', 'D', 'U'));

create or replace function fnc_trg_person_insert_audit() returns trigger AS
$$
begin
        if (TG_OP = 'INSERT') then
            insert into person_action values(now(), 'I', NEW.*);
            return NEW;
        end if;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit
after insert on person
    for each row execute procedure fnc_trg_person_insert_audit();


insert into person values (10, 'damir', 22, 'male', 'kazan');