## **Tarea 02 - Modelo E-R**

<img src="https://upload.wikimedia.org/wikipedia/commons/9/90/Logo_de_la_UANL.svg"  width="200" height="100"> 

### Facultad de Ciencias Fisico Matematicas, UANL
### Maestría en Ciencia de Datos
### Base de Datos Relacionales

#### Profr. Alberto Benavides
#### Victor Sanchez

Diagrama Entidad - Relación: 

Respecto a la [base establecida](https://github.com/VicoSan07/EjemploBD/blob/main/tarea1.md) para el registro de accidentes automovilísticos en Estados Unidos, se muestra su diagrama e-r correspondiente:

```mermaid
    flowchart TD
     classDef someclass fill:#f5fff5;
    %%% Entidades principales
    E0[Accidente]:::someclass--1---R1{Sucede}
    R1:::someclass--1---E1[Tiempo]
    E0--N---R2{En}
    R2:::someclass--1---E2[Ubicación]
    E0--1---R3{Participa}
    R3:::someclass--1---E3[Automóvil]
    
    %%% Entidades secundarias
    E2:::someclass--1---R4{Bajo}
    R4:::someclass--1----E4[Condiciones]
    E3:::someclass--1---R5{Con}
    R5:::someclass--1----E5[Conductor]

    %%% Tiempo
    E1:::someclass---A11([Id ac])
    E1---A12([Inicio])
    E1---A13([Fin])
    A11:::someclass---D11{{Texto}}
    A12:::someclass---D12{{Fecha}}
    A13:::someclass---D13{{Fecha}}
    D11:::someclass
    D12:::someclass
    D13:::someclass

    %%% Ubicación
    E2---A21([Id ac])
    E2---A22([Id ub])
    E2---A23([Calle])
    E2---A24([Ciudad])
    E2---A25([Condado])
    E2---A26([Estado])
    E2---A27([CP])
    E2---A28([País])
    A21:::someclass---D21{{Texto}}
    A22:::someclass---D22{{Texto}}
    A23:::someclass---D23{{Texto}}
    A24:::someclass---D24{{Texto}}
    A25:::someclass---D25{{Texto}}
    A26:::someclass---D26{{Texto}}
    A27:::someclass---D27{{Número}}
    A28:::someclass---D28{{Texto}}
    D21:::someclass
    D22:::someclass
    D23:::someclass
    D24:::someclass
    D25:::someclass
    D26:::someclass
    D27:::someclass
    D28:::someclass

    %%% Automóvil
    E3---A31([Id ac])
    E3---A32([Id au])
    E3---A33([Color])
    E3---A34([Tipo])
    E3---A35([No. Pasajeros])
    A31:::someclass---D31{{Texto}}
    A32:::someclass---D32{{Texto}}
    A33:::someclass---D33{{Texto}}
    A34:::someclass---D34{{Texto}}
    A35:::someclass---D35{{Número}}
    D31:::someclass
    D32:::someclass
    D33:::someclass
    D34:::someclass
    D35:::someclass

    %%% Condiciones
    E4:::someclass---A41([Id ac])
    E4---A42([Id ub])
    E4---A43([Temperatura])
    E4---A44([Sens.term])
    E4---A45([Humedad])
    E4---A46([Presión aire])
    E4---A47([Dirección viento])
    E4---A48([Velocidad viento])
    E4---A49([Precipitación])
    E4---A410([Meteorología])
    A41:::someclass---D41{{Texto}}
    A42:::someclass---D42{{Texto}}
    A43:::someclass---D43{{Número}}
    A44:::someclass---D44{{Número}}
    A45:::someclass---D45{{Número}}
    A46:::someclass---D46{{Número}}
    A47:::someclass---D47{{Número}}
    A48:::someclass---D48{{Número}}
    A49:::someclass---D49{{Número}}
    A410:::someclass---D410{{Texto}}
    D41:::someclass
    D42:::someclass
    D43:::someclass
    D44:::someclass
    D45:::someclass
    D46:::someclass
    D47:::someclass
    D48:::someclass
    D49:::someclass
    D410:::someclass

    %%% Conductor
    E5:::someclass---A51([Id au])
    E5---A52([Fecha nacimiento])
    A51---D51{{Texto}}
    A52---D52{{Fecha}}
    A51:::someclass
    A52:::someclass
    D51:::someclass
    D52:::someclass
```