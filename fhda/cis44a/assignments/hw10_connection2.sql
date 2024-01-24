use cis44a;
set SQL_SAFE_UPDATES = 0;

select connection_id();
insert into city values (4080,'Test','XXX','Test',111111);
select count(*) from city;
insert into city values (4082,'Test','XXX','Test',111111);
show processlist;