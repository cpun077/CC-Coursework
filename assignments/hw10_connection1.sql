use cis44a;
set SQL_SAFE_UPDATES = 0;
alter table city modify column countrycode varchar(4);

select connection_id();
lock tables city read;
insert into city values ('4080', 'Test', 'Test', 'Test', '111111');
unlock tables;
lock tables city write;
insert into city values (4081,'Test','XXX','Test',111111);
unlock tables;