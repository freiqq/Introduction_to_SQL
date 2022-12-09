create or replace function fnc_trg_person_delete_audit() returns trigger AS
$$
begin
        if (TG_OP = 'DELETE') then
            insert into person_action values(now(), 'D', OLD.*);
            return OLD;
        end if;
end;
$$ language plpgsql;

create trigger trg_person_delete_audit
after delete on person
    for each row execute procedure fnc_trg_person_delete_audit();


delete from person where id = 10;