# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Primer Examen Parcial setiembre 2021

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

1. [2 puntos] - Diséñese una gramática regular bien formada que genere las palabras del lenguaje concatenación L1. L2-1, donde L1 = {ap w1 w2 g / w1 ∈ {bb, cc, λ}, w2 ∈ {de, def}*,  p ≥ 1}, considerando el siguiente alfabeto Σ = {a, bb, cc, d, e, f, g} y L2 ={palabras que se pueden descomponer en secuencias de xy, se admite la palabra vacía}, considerando el siguiente alfabeto Σ = {x, y}. Sólo producciones. (Para facilitar el diseño/corrección usar los nombres de los símbolos no terminales en este orden: S, A, B, C ...)

    **Solución:**

    ```grammar
    S -> aS | aA | aB | aE
    A -> bbB | ccB | bbE | ccE
    B -> dC
    C -> eB | eD | eE
    D -> fB | fE
    E -> g | gF
    F -> yG
    G -> x | xF
    ```

1. [2 puntos] - Defínase por comprensión simbólica el lenguaje generado por la gramática regular < {a, b}, {S, A, B, C, E, F}, S, P>, donde P es el siguiente conjunto de reglas. Expresarlo como unión de lenguajes.

    S -> aA
    A ->aB | bE
    B -> aA | bC | b
    C -> bD | aF | a
    D -> bC | b | aF | a
    E -> bE | aF | a
    F -> aF | a | bF | b

    **Solución:**

    ```plain
    L = {a^(2n)b^(2k+1) / n ≥ 1 y k ≥ 0} ∪ {aw / w ∈ {a, b}* y w contiene la subpalabra ba}
    ```

1. [2 puntos] - Obténgase la ER que representa al lenguaje L = {palabras de x’s e y’s que nunca contuvieran tres y’s seguidas}. Solo usar operadores básicos.

    **Solución:**

    ```plain
    (x | yx | yyx)*  (λ | y | yy)
    ```

1. [2 puntos] - Obténgase la ER que representa al lenguaje L^c, donde el lenguaje L = {todas las palabras que tengan por lo menos dos 0’s consecutivos o por lo menos dos 1’s consecutivos sobre el Σ = {0, 1}}. Mostrar proceso algorítmico.

    **Solución:**

    ```plain
    0(1 (01)*(0 | λ) | λ) |   1(01)*(0 | λ)             |    λ
    0(10)*(1 | λ)           |   1(0 (10)*(1 | λ) | λ)   |    λ
    ```

1. [2 puntos] - Diséñese el AFD mínimo (grafo) que reconoce el lenguaje L = {w / w ∈ {1, 2, 3, 4}*,  w no contiene la subsecuencia 2212}

    **Solución:**

    | Q | 1 | 2 | 3 | 4 |
    | -- | -- |  -- | -- | -- |
    | >*q0 | q0 | q1 | q0 | q0 |
    | *q1 | q0 | q2 | q0 | q0 |
    | *q2 | q3 | q2 | q0 | q0 |
    | *q3 | q0 | | q0 | q0 |

---
