drop function fnc_fibonacci;
create or replace function fnc_fibonacci(pstop decimal default 10) returns table(num decimal) as
$$
    with recursive fibonacci as
        (select 0::decimal as first, 1::decimal as second
         union
         select second, first + second
         from fibonacci
         where second < pstop)
        select first from fibonacci;
$$ language sql;