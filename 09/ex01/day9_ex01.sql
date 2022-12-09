create or replace function fnc_trg_person_update_audit() returns trigger AS
$$
begin
        if (TG_OP = 'UPDATE') then
            insert into person_action values(now(), 'U', NEW.*);
            return NEW;
        end if;
end;
$$ language plpgsql;

create trigger trg_person_update_audit
after update on person
    for each row execute procedure fnc_trg_person_update_audit();


UPDATE person set name = 'Bulat' WHERE id = 10;