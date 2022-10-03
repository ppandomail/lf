# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Primer Examen Parcial setiembre 2022

* ALUMNO:  
* LU:
* CARRERA:

---

### NOTA: EL EXAMEN ESCRITO ES UN DOCUMENTO DE GRAN IMPORTANCIA PARA LA EVALUACIÓN DE LOS CONOCIMIENTOS ADQUIRIDOS, POR LO TANTO, SE SOLICITA LEER ATENTAMENTE LO SIGUIENTE

* Responda claramente cada punto, detallando con la mayor precisión posible lo solicitado.
* Sea prolijo y ordenado en el desarrollo de los temas.
* Sea cuidadoso con las faltas de ortografía y sus oraciones.
* No desarrollar el examen en lápiz.
* Aprobación del examen: Con nota mayor o igual a 4 (cuatro)
* Condiciones de aprobación: 60%
* Duración de examen: 3 horas.

---

1. [2 puntos] - Constrúyase un AFD M que acepta el L(N), a partir del AFN N = <{q0, q1}, {0, 1}, q0, {q1}, {δ(q0, 0)={q0, q1}, δ(q0, 1) = {q1}, δ(q1, 1) = {q0, q1}}>

    **Solución:**

    | Q | 0 | 1 |
    | -- | -- | -- |
    | >q0 | q0q1 | q1 |
    | *q1 | - | q0q1 |
    | *q0q1 | q0q1 | q0q1 |

1. [2 puntos] - Diseñese la ER del siguiente lenguaje "secuencias de cero o mas 1s o 01s o 001s, seguidas de menos de tres 0s"

    **Solución:**

    ```plain
    (1 | 01 | 011)* (λ | 0 | 00)
    ```

1. [2 puntos] - Constrúyase un AFD para L = {w / w contiene por lo menos tres 0s}

    **Solución:**

    | Q | 0 |
    | -- | -- |
    | >q0 | q1 |
    | q1 | q2 |
    | q2 | q3 |
    | *q3 | q3 |

1. [2 puntos] - Diseñese una GR o ER para L = {w / w es cualquier palabra, excepto 01, 101, 0100}

    **Solución:**

    ```plain
    λ | 0 | 010 | 1 | 10 | (00 | 11 | 100 | 1010 | 1011 | 011 | 0101 | 01000 | 01001) (0 | 1)*
    ```

1. [2 puntos] - Diseñe una GR para L = {w / w tiene longitud par o termina en 01}

    **Solución:**

    ```grammar
    ER: (00 | 01 | 10 | 10)* | (0 | 1)* 01

    S -> 0A | 1A | λ
    A -> 0S | 1S | 0B | 0 | 1
    B -> 1
    ````

---
