BULK INSERT dbo.Country
FROM 'C:\AIS\AIS-4\Countries.csv'
WITH (fieldterminator = ' ', rowterminator = '\n');

BULK INSERT dbo.City
FROM 'C:\AIS\AIS-4\Cities.csv'
WITH (fieldterminator = ';', rowterminator = '0x0A');

CREATE NONCLUSTERED INDEX FK_INDEX ON City (CC_FIPS)

SELECT city1.name 
from City city1, Country country
where country.COUNTRY_NAME = 'Australia' and country.CC_FIPS = city1.CC_FIPS and LOWER(city1.name) like 'st%'