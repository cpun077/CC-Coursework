use cis44a;
set SQL_SAFE_UPDATES = 0;


select count(*) from city 
join country on city.countrycode = country.code 
where country.continent='North America' or country.continent='South America';

lock tables country read, city write;
unlock tables;

select city.name as city_name, country.name as country_name from city 
join country on city.countrycode = country.code 
where country.region='Caribbean' 
order by city.name;

 create table STUDENT (
	ID INTEGER CHECK (id BETWEEN 1 AND 9999999) NOT NULL,
	First VARCHAR(50) NOT NULL,
    Last VARCHAR(50) NOT NULL,
	StreetAddress VARCHAR(100) NOT NULL,
	City VARCHAR(50) NOT NULL,
	ZipCode VARCHAR(10) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    GPA DECIMAL(3, 2) NOT NULL,
    MajorStudy VarChar(50) NOT NULL,
	PRIMARY KEY (ID)
);

insert into student values (1, 'Joe', 'Bob', '1234 Joe House', 'Sunnyvale', '94087', 'California', '4151234545', 4.0, 'Computer Science');
update student set ZipCode='95148' where id=1;
delete from student where id=1;
drop table student;