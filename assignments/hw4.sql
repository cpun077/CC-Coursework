use cis44a;
set SQL_SAFE_UPDATES = 0;

update city
set Population = 1050000
where Name = 'San Jose' and CountryCode = 'USA' and District = 'California';

select * from city where Name = 'San Jose' and CountryCode = 'USA';

insert into city values ('4080', 'Twin Peaks', 'USA', 'Washington', '10500');
select * from city where Name = 'Twin Peaks';

delete from city where Name = 'Twin Peaks';
select count(*) from city;