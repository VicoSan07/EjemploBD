## **Tarea 03 - Modelo Relacional**

<img src="https://upload.wikimedia.org/wikipedia/commons/9/90/Logo_de_la_UANL.svg"  width="200" height="100"> 

### Facultad de Ciencias Fisico Matematicas, UANL
### Maestría en Ciencia de Datos
### Base de Datos Relacionales

#### Profr. Alberto Benavides
#### Victor Sanchez

Esquema relacional

Respecto a la [base establecida](https://github.com/VicoSan07/EjemploBD/blob/main/tarea1.md) para el registro de accidentes automovilísticos en Estados Unidos, se muestra el esquema de su modelo relacional correspondiente:

---------------------------------------------------------
Ubicacion (id_ub, calle, ciudad, condado, estado, pais)

Accidente (id_ac, fecha_ac, duracion, temperatura, sensacion_term, humedad, presion_aire, direccion_viento, velocidad_viento, precipitacion, meteorologia, id_ub)

Automovil (id_auto, color, tipo)

Conductor (id_auto, fecha_nac, genero, estado_nac, pais_nac)

Poliza (id_auto, id_poliza, nombre_empresa, fecha_venc, porc_cobertura)

---------------------------------------------------------

**Notas**:
1. En una ubicación pueden acontecer varios accidentes
2. En un accidente pueden involucrarse varios automóviles
3. Un automóvil solo tiene un conductor
4. Un automóvil puede estar asegurado por varias pólizas, pero una póliza no puede asegurar varios autos. 

Diagrama relacional

El esquema anterior, puede ser representado a tráves del siguiente diagrama relacional:

```mermaid
   erDiagram
    Ubicacion ||--}o Accidente : "ocurren"    
    Accidente ||--}o Automovil: "involucran"
    Automovil ||--|| Conductor: "manejados"
    Automovil ||--}o Poliza: "cubiertos"    
    
    Ubicacion {
        entero id_ub
        texto calle
        texto ciudad
        texto condado
        texto estado
        texto pais
    }

    Accidente {
        entero id_ac
        fecha fecha_ac
        numero duracion
        numero temperatura
        numero sensacion_term
        numero humedad
        numero presion_aire
        texto direccion_viento
        numero velocidad_viento
        numero precipitacion
        texto meteorologia
        entero id_ub
    }

    Automovil {
        entero id_auto
        texto color
        texto tipo
    }

    Conductor {
        entero id_auto
        fecha fecha_nac
        entero genero
        texto estado_nac
        texto pais_nac
    }

    Poliza {
        entero id_auto
        entero id_poliza
        fecha fecha_venc_contrato
        numero porc_cobertura
        texto nombre_empresa
    }
```

Operaciones de álgebra relacional

De la base he seleccionado los siguientes operadores básicos del algebra relacional:

- *Selección*

    Nueva York es una de las ciudades con mayor tráfico en Estados Unidos, por lo que seleccionar las tuplas que corresponden a dicha ciudad, nos podría permitir analizar más adelante el volumen o proporción de accidentes que tiene este lugar.

    **σ<sub>ciudad=Nueva York</sub> (Ubicacion)**  

    Relacionado al tema de las pólizas, se seleccionarán aquellas que han cubierto el 100% del daño colateral en el accidente del automóvil. Inclusive también resulta interesante analizar aquellas que no cubrieron daños.

    **σ<sub>(porc_cobertura=100)</sub> (Poliza)**  
    **σ<sub>(porc_cobertura=0)</sub> (Poliza)**

    Más aún cuando provienen de aseguradoras tan famosas y comerciales en Estados Unidos, por ejemplo State Farm

    **σ<sub>(porc_cobertura=0 and nombre_empresa=State Farm)</sub> (Poliza)**

- *Proyección*

    Dos atributos importantes a la hora de analizar un accidente son la duración del mismo y la condición meteorológica del lugar, por lo que se podrían extraer ambos atributos, esto es:

    **π<sub>duracion,meteorologia</sub> (Accidente)**

    En la relación conductor, se tienen atributos correspondientes al nacimiento de la persona, por lo que se extraerían de la tabla

    **π<sub>fecha_nac,estado_nac,pais_nac</sub> (Conductor)**

- *Composición*

    Se seleccionan aquellas pólizas que cubren el 100% del daño, y se extrae la fecha de vencimiento de la póliza y el nombre de la compañía encargada:

    **π<sub>fecha_venc_contrato,nombre_empresa</sub> (σ<sub>porc_cobertura=100</sub> (Poliza) )**
