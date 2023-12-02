use cis44a;
set SQL_SAFE_UPDATES = 0;
alter table city modify column countrycode varchar(4);

select connection_id();
select * from city lock in share mode;
insert into city values ('4080', 'Test', 'Test', 'Test', '111111');