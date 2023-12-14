use cis44a;
set SQL_SAFE_UPDATES = 0;

select count(*) from country;

select city.name, country.name from city 
join country on city.countrycode = country.code 
where country.continent='Africa' 
order by city.name;

select count(*) from city 
join country on city.countrycode = country.code 
where country.continent='Europe';