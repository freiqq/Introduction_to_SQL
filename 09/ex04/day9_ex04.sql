create or replace function fnc_persons_female()
returns table(name varchar) as
$female$
    select name
    from person
    where gender = 'female';
$female$ language sql;

create or replace function fnc_persons_male()
    returns table (name varchar) as
$male$
    select name
    from person
    where gender = 'male';
$male$ language sql;

select * from fnc_persons_female();
select * from fnc_persons_male();