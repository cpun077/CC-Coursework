use cis44a;
set SQL_SAFE_UPDATES = 0;

start transaction;
update city set population = 10000 where name = 'San Jose';
rollback;
select population from city where name = 'San Jose';