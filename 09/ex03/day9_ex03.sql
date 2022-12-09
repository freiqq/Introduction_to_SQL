create or replace function fnc_trg_person_audit() returns trigger AS
$$
begin
        if (TG_OP = 'INSERT') then
            insert into person_action values(now(), 'I', NEW.*);
            return NEW;
        elseif (TG_OP = 'UPDATE') then
            insert into person_action values(now(), 'U', NEW.*);
            return NEW;
        elseif (TG_OP = 'DELETE') then
            insert into person_action values(now(), 'D', OLD.*);
            return OLD;
        end if;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit
after insert or update or delete on person
    for each row execute procedure fnc_trg_person_audit();


insert into person values (10, 'damir', 22, 'male', 'kazan');
update person set name = 'Bulat' WHERE id = 10;
delete from person where id = 10;