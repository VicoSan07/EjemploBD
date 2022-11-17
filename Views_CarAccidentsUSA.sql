-- VIEWS Y JOINS EN SQL SERVER MAS TRIGGERS
-- BASE DE ACCIDENTES AUTOMOVILISTICOS EN USA/*
USE CarAccidentUSA;

-- Tablas a utilizar
SELECT COUNT(*) AS NRDriver FROM Driver;
SELECT COUNT(*) AS NRInsurance FROM Insurance;

--Para la tabla de conductor, incluir informacion de aseguradora, en dado caso de que corresponda*
GO
CREATE VIEW DriverPlus AS 
	SELECT Driver.Id_driver, Driver.Id_car,Insurance.Name_company FROM Driver
	LEFT JOIN Insurance
	ON Driver.Id_car = Insurance.Id_car;
GO

SELECT * FROM DriverPlus ORDER BY DriverPlus.Id_driver;
--

--Conductores asegurados cuyo sexo sea femenino y que se les haya cubierto al menos 80% de los daños
GO
CREATE VIEW HappyFemaleDriver AS 
SELECT Driver.Id_driver, Driver.Gender, Driver.Id_car,Insurance.Coverage FROM Driver
INNER JOIN Insurance
ON Driver.Id_car = Insurance.Id_car
WHERE Insurance.Coverage>80 and Driver.Gender=0;
GO

SELECT * FROM HappyFemaleDriver;
--


-- Accidentes en el que participaron al menos dos carros
GO
CREATE VIEW GroupAccident1 AS 
SELECT COUNT(*) AS GrpAcd1 FROM
(SELECT Car.Id_accident, COUNT(Car.Id_accident) AS NumCars FROM Car
GROUP BY Car.Id_accident
HAVING COUNT(Car.Id_accident)>1
) GRP
;
GO


-- Accidentes en el que participaron al menos dos carros asegurados
GO
CREATE VIEW GroupAccident2 AS 
SELECT COUNT(*) AS GrpAcd2 FROM
(SELECT Car.Id_accident, COUNT(Car.Id_accident) AS NumCars FROM Car
RIGHT JOIN Insurance
ON Car.Id_car = Insurance.Id_car
GROUP BY Car.Id_accident
HAVING COUNT(Car.Id_accident)>1
) GRP
;
GO

SELECT * FROM GroupAccident1;
SELECT * FROM GroupAccident2;
--


-- Trigger para cuando se registre un nuevo accidente
CREATE TABLE NewContract(
	Date_in date,
	Name_user varchar(50)
)
