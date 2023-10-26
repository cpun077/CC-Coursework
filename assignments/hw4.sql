use cis44a;
set SQL_SAFE_UPDATES = 0;

update city
set Population = 1050000
where Name = 'San Jose' and CountryCode = 'USA' and District = 'California';

select * from city where Name = 'San Jose' and CountryCode = 'USA';

insert into city (ID, Name, CountryCode, District, Population) 
select max(ID)+1, 'Twin Peaks', 'USA', 'Washington State', '10500' from city;
select * from city where Name = 'Twin Peaks';

delete from city where Name = 'Twin Peaks';
select count(*) from city;