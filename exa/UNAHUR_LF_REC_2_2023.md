# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Segundo Examen Parcial noviembre 2023

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

1. [3.3 puntos] - Diséñese AP por vaciado de pila para L = {a^n b^m c^k / n, m , k >= 0; k + m = n v k + n = m}

    ```grammar
    caso 1: n,m,k >= 0; k + m = n
    L = {a^k a^m b^m c^k / m,k >= 0}

    S -> λ | aAc | aBb | ac | ab
    A -> aAc | ac | aBc
    B -> aBb | ab

    caso 2: n,m,k >= 0; k + n = m
    L = {a^n b^n b^k c^k / n,k >= 0}

    S -> λ | aCbD | abD | ab | bc | aCb | bDc
    C -> aCb | ab
    D -> bDc | bc

    S -> λ | aAc | aBb | ac | ab | aCbD | abD | bc | aCb | bDc
    A -> aAc | ac | aBc
    B -> aBb | ab
    C -> aCb | ab
    D -> bDc | bc 

    FNG:
    S -> λ | aAZ | aBY | aZ | aY | aCYD | aYD | bZ | aCY | bDZ
    A -> aAZ | aZ | aBZ
    B -> aBY | aY
    C -> aCY | aY
    D -> bDZ | bZ
    Y -> b
    Z -> c

    AP
    Q = {q0}
    F = {}
    Σ = {a, b, c}
    q0 = q0
    p = S
    Γ = {A, Z, B, Y, C, D, S}
    δ(q0, λ, S) = (q0, λ)
    δ(q0, a, S) = (q0, AZ)
    δ(q0, a, S) = (q0, BY)
    ...
    ```

1. [3.3 puntos] - Determínese por comprensión simbólica el LIC generado por GIC <{a, b}, {S, U, T, V}, S, {S -> UT, U -> aa, U -> ab, U -> ba, U -> bb, T -> aTa, T -> bTb, T -> V, V -> aa, V -> ab, V -> ba, V -> bb}>. Normalícese a FNC.

    ```grammar
    L = {w1w2w3w2^R / w1,w3 ∈ {a, b}^2 ^ w2 ∈ {a, b}* }

    FNC
    S -> UT
    U -> AA | AB | BA | BB
    T -> AX | BY | AA | AB | BA | BB
    X -> TA
    Y -> TB
    A -> a
    B -> b
    ```

1. [3.3 puntos] - Diséñese MT unicinta L = {(ab^2)^n / n > 0}

| | a | b | B |
| -- | -- | -- | -- |
| >q0 | q1aR | - | - |
| q1  | - | q2bR | - |
| q2  | - | q3bR | - |
| q3  | q1aR | - | q4BL |
| *q4 | - | - | - |

---
