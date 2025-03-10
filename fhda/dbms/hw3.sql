SHOW DATABASES;
CREATE DATABASE cis44a;
USE cis44a;

CREATE TABLE CITY (
	ID INTEGER NOT NULL,
	Name VARCHAR(50) NOT NULL,
	CountryCode CHAR(3) NOT NULL,
	District VARCHAR(50) NOT NULL,
	Population INTEGER NOT NULL,
	PRIMARY KEY (ID)
);

SELECT COUNT(*) FROM CITY;
SELECT * FROM CITY WHERE CountryCode = 'PHL';
SELECT * FROM CITY WHERE Population > 8000000;
SELECT * FROM CITY WHERE Population BETWEEN 5000000 AND 10000000;