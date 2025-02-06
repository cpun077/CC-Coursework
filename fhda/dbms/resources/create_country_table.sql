CREATE TABLE  country  (
   Code  VARCHAR(3) NOT NULL,
   Name  VARCHAR(52) NULL DEFAULT '' NOT NULL,
   -- 'Asia','Europe','North America','Africa','Oceania','Antarctica','South America',
   Continent VARCHAR(20) NULL DEFAULT 'Asia' NOT NULL,
   Region  VARCHAR(26) NULL DEFAULT '' NOT NULL,
   SurfaceArea  FLOAT NULL DEFAULT 0 NOT NULL,
   IndepYear  INTEGER DEFAULT 0,
   Population  INTEGER NULL DEFAULT 0 NOT NULL,
   LifeExpectancy   	FLOAT DEFAULT 0,
   GNP   	FLOAT DEFAULT 0,
   GNPOld   	FLOAT DEFAULT 0,
   LocalName  VARCHAR(45) NULL DEFAULT '' NOT NULL,
   GovernmentForm  VARCHAR(45) NULL DEFAULT '' NOT NULL,
   HeadOfState  VARCHAR(60) DEFAULT NULL,
   Capital  INTEGER DEFAULT 0,
   Code2  VARCHAR(2) NULL DEFAULT '' NOT NULL,
  PRIMARY KEY ( Code )
);