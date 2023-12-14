# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Primer Examen Parcial noviembre 2023

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
* Duración de examen: 1.5 horas.

---

1. [3.3 puntos] - Constrúyase AFDmin para L = {w / w ∈ {a, b}* y el segundo y penúltimo símbolo de w son a}

    ```plain
    L = {aa, aaa, baa, aab, bab, ...}
    casos: |w| = 2, |w| = 3 y otros
    ```

    | Q | a | b |
    | -- | -- | -- |
    | >q0| q1 | q4 |
    | q1 | q2 | - |
    | *q2| q3 | - |
    | *q3| q3 | q6 |
    | q4 | q5 | - |
    | q5 | q3 | q6 |
    | *q6| q7 | - |
    | q7 | q3 | q6 |

1. [3.3 puntos] - Diseñese ER para L = {w / w ∈ {a, b, c}* y contiene exactamente una vez dos bes seguidas}

    ```plain
    (b(a|c) | a | c)* bb (a | c | (a|c)b)*
    ```

1. [3.3 puntos] - Diseñese GR para (L1 U L2) L3, siendo L1 = {ba^n / n > 0}, L2 = {a^n b / n > 0}, L3 = {w / w ∈ {a, b}* }

    ```grammar
    (ba+ | a+b) (a|b)*

    S -> bA | aB
    A -> aA | aC | a
    B -> aB | bC | b
    C -> aC | bC | a | b
    ```

---
