
-- ##############################
-- ###########DIA 12##############
-- ##############################


-- uso de la base de datos

use world;

SELECT COUNT(*) from country;
SELECT * FROM countrylanguage c;

-- Creamos un query complejo

SELECT * FROM city c where Name = "Peking";
SELECT * FROM city WHERE CountryCode = "CHN";

-- crear indexacion
CREATE INDEX idx_cityName ON city(Name);
CREATE INDEX idx_cityCountry on city(CountryCode);

-- Revisar indexaciones creadas
SHOW KEYS FROM city;
