## **Tarea 06 - Consultas en SQL**

<img src="https://upload.wikimedia.org/wikipedia/commons/9/90/Logo_de_la_UANL.svg"  width="200" height="100"> 

### Facultad de Ciencias Fisico Matematicas, UANL
### Maestría en Ciencia de Datos
### Base de Datos Relacionales

#### Profr. Alberto Benavides
#### Victor Sanchez

Funciones

Una vez que hemos [creado la base de datos](https://github.com/VicoSan07/EjemploBD/blob/main/tarea3.md) que necesitabamos, a la cuál posteriormente le insertamos datos, podemos realizar consultas mediante el uso de funciones. A continuación se comparten algunos ejemplos partículares:

**Media o promedio**

Podemos calcular la duración promedio de obstrucción en las carreteras o avenidas por accidentes automovilisticos.

~~~~sql
SELECT CAST(ROUND(AVG(Duration),2) AS DEC(10,2)) FROM Accident;
SELECT * FROM Accident WHERE Duration > (SELECT AVG(Duration) FROM Accident);
~~~~

Lo cuál nos arroja un resultado de 195.06 minutos, es decir, más de 3 horas de obstrucción.

**Mínimos y máximos**

Las condiciones de un accidente no son las mismas en epoca de invierno que en epoca de verano, es por ello que podría interesarnos analizar temperatura máxima y mínima del ambiente en el que aconteció el accidente. 

~~~~sql
SELECT MIN(Temperature) AS ColdTemp FROM Accident;
SELECT MAX(Temperature) AS HotTemp FROM Accident;
~~~~

Siendo la temperatura mínima de -89°F y la máxima de 170.6°F. A esas temperaturas no te concentras conduciendo.

***Quantiles**

Es posible identificar el quantil al que pertenece cierto elemento, en el siguiente ejemplo se asignan cuantiles a cada una de las observaciones para la columna duración

~~~~sql
SELECT Duration,NTILE(4) OVER (PARTITION BY Duration ORDER BY Duration) AS Quartile FROM Accident
~~~~

**Moda**

Uno esperaría observar que las ciudades con mayor circulación de vehículos, sean aquellas en donde ocurran mayor cantidad de accidentes. Para calcular el Top 1, es decir la moda, podemos utilizar la siguiente instrucción:

~~~~sql
SELECT City, COUNT(City) FROM Place GROUP BY City ORDER BY COUNT(City) DESC;
~~~~

Resultando que Houston es la ciudad con mayor cantidad de accidentes automovílisticos seguido de Miami.

_Comentarios finales_  
Realmente fue un reto obtener estos valores ya que no estoy tan familiarizado con el lenguaje, aún así considero que con un poco de practica y reforzando la asignación de variables sea capaz de crear funciones complejas más adelante.
