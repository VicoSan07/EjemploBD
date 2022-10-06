## **Tarea 04 - DB en SGBDs**

<img src="https://upload.wikimedia.org/wikipedia/commons/9/90/Logo_de_la_UANL.svg"  width="200" height="100"> 

### Facultad de Ciencias Fisico Matematicas, UANL
### Maestría en Ciencia de Datos
### Base de Datos Relacionales

#### Profr. Alberto Benavides
#### Victor Sanchez

Creación de una base de datos

En base al [modelo relacional](https://github.com/VicoSan07/EjemploBD/blob/main/tarea3.md) establecido para la base de accidentes automovilisticos en Estados Unidos, se puede crear su BD en *Microsoft Server SQL* a partir de las siguientes instrucciones: 

~~~~sql
/*CREATE DATABASE CarAccidentUSA*/
/*DROP DATABASE CarAccidentUSA*/
/*USE CarAccidentUSA;*/

CREATE TABLE Place(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Street VARCHAR(50),
	City VARCHAR(20),
	County VARCHAR(20),
	State_p VARCHAR(20),
	Country VARCHAR(20)
);

CREATE TABLE Accident(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Date_accident DATE,
	Duration SMALLINT,
	Temperature FLOAT(10),
	Wind_Chill FLOAT(10),
	Humidity FLOAT(10),
	Pressure FLOAT(10),
	Wind_direction VARCHAR(20),
	Wind_speed FLOAT(10),
	Precipitation FLOAT(10),
	Weather_condition VARCHAR(20),
	Id_place INT,
	FOREIGN KEY (Id_place) REFERENCES Place (Id)
);

CREATE TABLE Car(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Colour VARCHAR(10),
	Type_car VARCHAR(10),
	Id_accident INT,
	FOREIGN KEY (Id_accident) REFERENCES Accident (Id)
);

CREATE TABLE Driver(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Gender INT,
	Birth_date DATE,
	Birth_state VARCHAR(20),
	Birth_country VARCHAR(20),
	Id_car INT,
	FOREIGN KEY (Id_car) REFERENCES Car (Id)
);

CREATE TABLE Insurance(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Name_company VARCHAR(20),
	Expiration_date_contract DATE,
	Coverage FLOAT(10),
	Id_car INT,
	FOREIGN KEY (Id_car) REFERENCES Car (Id),
	Id_driver INT,
	FOREIGN KEY (Id_driver) REFERENCES Driver (Id)
);
~~~~

Continuando con esta misma base, de manera informativa más no limitativa se incluyen un par de registros en cada una de las tablas a tráves de los siguientes comandos:

~~~~sql
INSERT INTO Place
	VALUES
	('Cadiz Rd','Freeport','Harrison','OH','USA'),
	('Colombus Pike','Lewis Center','Delaware','OH','USA'),
	('Highway 99','Cambridge Springs','Crawford','PA','USA'),
	('Iron Ct','Cleveland','Cuyahoga','OH','USA'),
	('Long Lake Ln','Indianapolis','Marion','IN','USA'),
	('Madison Pike','De Mossville','Pendleton','KY','USA'),
	('N Meridian St','Redkey','Jay','IN','USA'),
	('Oakwood Rd','Charleston','Kanawha','WV','USA'),
	('S Broadway St','Dayton','Montgomery','OH','USA'),
	('S State Road 1','Milton','Wayne','IN','USA'),
	('State Route 49','Willshire','Van Wert','OH','USA'),
	('Titus Rd','Freeport','Guernsey','OH','USA'),
	('US Highway 23','Lockbourne','Franklin','OH','USA'),
	('W State Road 26','Dunkirk','Jay','IN','USA'),
	('Dr Martin Luther King Jr Expy N','Louisville','Jefferson','KY','USA'),
	('E Hanthorn Rd','Lima','Allen','OH','USA'),
	('E National Rd','South Charleston','Clark','OH','USA'),
	('Henry Watterson Expy W','Louisville','Jefferson','KY','USA'),
	('Hopple St','Cincinnati','Hamilton','OH','USA'),
	('I-271 N','Cleveland','Cuyahoga','OH','USA')

INSERT INTO Accident
	VALUES
	('08/02/2016','130','33.1',NULL,'0.92','29.62','Calm',NULL,NULL,'Mostly Cloudly','1'),
	('09/02/2016','60','26.6','16.8','0.86','29.68','West','10.4',NULL,'Light Snow','2'),
	('10/02/2016','77','21','9.9','0.85','29.69','WSW','10.4','0','Light Snow','3'),
	('10/02/2016','32','24.1','7.1','0.75','29.82','West','28.8','0','Light Snow','4')


INSERT INTO Car
	VALUES
	('Red','Sport','1'),
	('Yellow','Truck','1'),
	('Black','Sedan','2')


INSERT INTO Driver
	VALUES
	('1','07/05/1997','OH','USA','1'),
	('1','02/04/1980','IN','USA','2'),
	('2','01/01/1966','OH','USA','3')

INSERT INTO Insurance
	VALUES
	('State Farm','10/05/2017','0.95','1','1'),
	('Liberty Mutual','06/10/2022','0.60','2','2'),
	('Allstate','01/03/2016','0','3','3')
~~~~

Bitácora de cambios respecto a la última revisión

1. Se retorna al lenguaje original de la BD: De español a inglés.
2. Se crea una relación entre conductor y seguro, donde no necesariamente el conductor participe en el accidente es dueño del automóvil.


