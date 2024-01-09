use cis44a;
set SQL_SAFE_UPDATES = 0;

show index from city;
explain select * from city where name = 'San Jose';
create index name_index on city(name);
explain select * from city where name = 'San Jose' and countrycode = 'USA';
create index name_countrycode_index on city(name, countrycode);