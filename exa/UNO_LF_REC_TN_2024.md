# UNIVERSIDAD NACIONAL DEL OESTE

## ESCUELA DE INFORMÁTICA

## LENGUAJES FORMALES

### Profesor: Mag. Ing. Pablo Pandolfo / Sr. Pablo Rechimon

---

### Recuperatorio Parciales

* ALUMNO:  
* LU:
* CARRERA:

---

| PARCIAL 1 |
| -- |

---

1. Diséñese ER del lenguaje complemento cuyas palabras están formadas por los símbolos del alfabeto {a, b}, que tiene longitud mayor a 2, el segundo símbolo es "a" y el anteúltimo símbolo es "b".

    * **Resuelto**

    ```plain
    ER(L) = (a | b) a (a | b)* b (a | b)
    1. Hacer el AFD y completarlo
    2. Los estados finales dejan de ser finales y los estados no finales pasan a ser finales
    3. Hallar la ER(L^c)
    ```

2. Diséñese AFDmin del lenguaje cuyas palabras comienzan con "a" y no contienen la secuencia "bc". Σ = {a, b, c}

    * **Resuelto**

    |    | a  | b  | c  |
    | -- | -- | -- | -- |
    |>qo | q1 | -  | -  |
    |*q1 | q1 | q2 | q1 |
    |*q2 | q1 | q2 | -  |

3. Diséñese una gramática regular bien formada que genere las palabras del lenguaje concatenación L1. L2-1, donde L1 = {a^p w1 w2 g / w1 ∈ {bb, cc, λ}, w2 ∈ {de, def}*,  p ≥ 1}, considerando el siguiente alfabeto Σ = {a, bb, cc, d, e, f, g} y L2 ={palabras que se pueden descomponer en secuencias de xy, se admite la palabra vacía}, considerando el siguiente alfabeto Σ = {x, y}. Sólo producciones. (Para facilitar el diseño/corrección usar los nombres de los símbolos no terminales en este orden: S, A, B, C ...)

    * **Resuelto**

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

4. Justifíquese por Lema de Bombeo que {a^n b^n / n >= 0} no es LR

    * **Resuelto**

    ```plain
    w = xyz, de modo que:
    |y| ≥ 1
    |xy| ≤ n
    Para todo k ≥ 0, la palabra xy^kz también pertenece a L.

    n = 3
    x = aa
    y = a
    z = bbb
    k = 0 => aaa^0bbb => aabbb no pertenece a L => L no es LR
    ```

---

| PARCIAL 2|
| -- |

---

1. Diséñese la GIC del lenguaje L = {a^n b^m c^m d^n / n, m >= 0} . {0^n 1^n 2^m 3^m / n, m >= 0}

    * **Resuelto**

    ```grammar
    S -> AB | A | B | λ
    A -> aAd | ad | X
    X -> bXc | bc
    B -> CD | C | D
    C -> 0C1 | 01
    D -> 2D3 | 23
    ```

2. Diseñese AP por vaciado de pila (algoritmo) que reconoce el lenguaje generado por GIC <{a, b, q}, {R, A, M, N, L}, R, {R -> ML, R -> a, R -> b, R -> MA, A -> a, A -> RN, A -> q, M -> b, N -> q, L -> AA}>

   * **Resuelto**

    ```grammar
    FNG:
    R -> bL | a | b | bA
    L -> aA | bLNA | aNA | bNA | bANA | qA
    A -> a | bLN | aN | bN | bAN | q
    N -> q

    APv => un solo estado no final => ejemplo de 1 transición δ(q0, b, R) = (q0, L), ...
    ```

3. Determínese por comprensión simbólica el lenguaje reconocido por MT <{0, 1, B}, {0, 1}, q0, {q0, q1, q2, qf}, {qf}, B, {δ(q0,0)=(q1,1,R), δ(q1,1)=(q2,0,L), δ(q2,1)=(q0,1,R), δ(q1,B)=(qf,B,R)}>

   * **Resuelto**

    ```plain
    L = {0 1^n / n >= 0}
    ```

4. Justifíquese por Lema de Bombeo que {a^n b^n c^n / n >= 0} no es LIC

    * **Resuelto**

    ```plain
    w = uvxyz, de modo que:
    |vy| ≥ 1
    |vxy| ≤ n
    Para todo k ≥ 0, la palabra uv^kxy^kz también pertenece a L.

    n = 3
    u = aa
    v = a
    x = b
    y = b
    z = bccc
    k = 0 => aaa^0bb^0bccc => aabbccc no pertenece a L => L no es LIC
    ```

---
