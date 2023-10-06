# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Primer Examen Parcial setiembre 2023

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

1. Dados los lenguajes L1 = {w / w tienen un número impar de símbolos} con Σ = {0, 1} y L2 = {w / w no contiene la subcadena yz} con Σ = {x, y, z}, diséñese usando operadores básicos:
    1. [1.5 puntos] ER de L2.L1
    1. [1.5 puntos] ER de L2^c

        ```plain
        1.  (y*x | z)*y* (0 | 1)(00 | 01 | 10 | 11)*
        1'. z*(y | xz*)* (0 | 1)(00 | 01 | 10 | 11)*
        2.  (x | y | z)* yz (x | y | z)* 
        ```

1. Dado los lenguajes L1 = {a^(2n+1) bb c^(2m) / n, m >= 0} con Σ = {a, b, c} y L2 = {wab^n / w ϵ {b, aa}* ^ n >= 0} con Σ = {a, b}
    1. [2 puntos] Diséñese la GR del lenguaje L1 U L2.
    1. [0.25 puntos] Indíquese la palabra mínima del lenguaje.
    1. [0.25 puntos] Indíquese la cantidad de símbolos no terminales y de producciones que utilizó.

        ```plain
        ER(L1): a(aa)* bb (cc)*
        GR(L1): 
        S -> aA
        A -> aB | bC
        B -> aA
        C -> b | bD
        D -> cE
        E -> c | cD

        ER(L2): (aa | b)* a b*
        GR(L2):
        S -> aF | bE | a | aG
        F -> aE
        E -> aF | aG | bE | a
        G -> bG | b

        Palabra mínima: a
        Palabras que no pertenecen a L1 U L2 = {aba, bbbcc, ...}
        ```

1. [2 puntos] Dada la siguiente GR =<{a, b, c}, {A, B, C, X, D, E}, X, {A -> aA, X -> λ, A -> a, A -> bB, A -> cC, B -> aB, B -> bA, X -> aA, B -> b, X -> bB, C -> cD, D -> cE, D -> c, X -> a, E -> cC, X -> cC}, defínase por comprensión simbólica el lenguaje generado.

    ```plain
    X -> λ | aA | bB | a | cC
    A -> aA | a | bB | cC
    B -> aB | bA | b
    C -> cD
    D -> cE | c
    E -> cC

    L = {λ, a, aa, aaa, abb, bb, ccc, ...}

    L = {wc^(3n) / w ϵ {a, b}* ^ cant pares de bes ^ n >= 0}

    L = {a^x (b a^y b)^i a^z (ccc)^j / x, y, z, i, j >= 0}
    ```

1. [2.5 puntos] Dada la ER: (uade | ubauba)\*ubauade\*, diséñese el AFDmin que reconoce las palabras del lenguaje representado por la ER con Σ = {uba, uade}. Partir de un AFNλ.

    ```plain
    AFmin:
    Σ = {uba, uade}
    Q = {q0, q1, q2}
    q0 = q0
    F = {q1, q2}
    δ(q0, uade) = q0
    δ(q0, uba) = q1
    δ(q1, uba) = q0
    δ(q1, uade) = q2
    δ(q2, uade) = q2
    ```

---
