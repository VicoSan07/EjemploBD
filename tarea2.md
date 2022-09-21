## **Tarea 02 - Modelo E-R**

<img src="https://upload.wikimedia.org/wikipedia/commons/9/90/Logo_de_la_UANL.svg"  width="200" height="100"> 

### Facultad de Ciencias Fisico Matematicas, UANL
### Maestría en Ciencia de Datos
### Base de Datos Relacionales

#### Profr. Alberto Benavides
#### Victor Sanchez

Diagrama Entidad - Relación: 

Para la [base establecida](https://github.com/VicoSan07/EjemploBD/blob/main/tarea1.md) para el registro de accidentes automovilísticos en Estados Unidos, se muestra su diagrama e-r correspondiente:

```mermaid
    flowchart TD
    A[[Formulación y evaluación de proyectos]]---B([Definición de objetivos])
    B-.-C[/Retroalimentación/]  
    B---D([Análisis de mercado])
    B---E([Análisis técnico operativo])
    B---F([Análisis económico financiero])
    B---G([Análisis socio-económico])
    B---H([Análisis legal])
    B---I([Análisis ambiental])
    C-.-J[/Resumen y conclusiones/]
    D---J
    E---J
    F---J
    G---J
    H---J
    I---J
    J---K[/Decisión sobre el proyecto/]
```