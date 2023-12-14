# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Examen Integrador diciembre 2023

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
* Duración de examen: 2 horas.

---

1. [2.5 puntos] - Diseñese ER para L = {w / w ∈ {a, b}* y el segundo y penúltimo símbolo de w son a}

    ```plain
    aa | (a|b) a (a|b) | (a|b) a (a|b)* a (a|b)
    ```

1. [2.5 puntos] - Constrúyase AFDmin para L = {w / w ∈ {a, b, c}* y contiene exactamente una vez dos bes seguidas}

    | Q | a | b | c |
    | -- | -- | -- | -- |
    |>q0 | q0 | q1 | q0 |
    | q1 | q0 | q2 | q0 |
    |*q2 | q3 | -  | q3 |
    |*q3 | q3 | q2 | q3 |

1. [2.5 puntos] - Diséñese AP por vaciado de pila para L = {w1w2w3w2^R / w1,w3 ∈ {a, b}^2 ^ w2 ∈ {a, b}* }

    ```grammar
    S -> λ | aAZ | aBY | aZ | aY | aCYD | aYD | bZ | aCY | bDZ
    A -> aAZ | aZ | aBZ
    B -> aBY | aY
    C -> aCY | aY
    D -> bDZ | bZ
    Y -> b
    Z -> c
    ```

1. [2.5 puntos] - Diséñese MT unicinta L = {(ab^2)^n / n > 0}

    | | a | b | B |
    | -- | -- | -- | -- |
    | >q0 | q1aR | - | - |
    | q1  | - | q2bR | - |
    | q2  | - | q3bR | - |
    | q3  | q1aR | - | q4BL |
    | *q4 | - | - | - |

---
