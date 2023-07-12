# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo / Ing. Fernando Basteiro

---

### Segundo Examen Parcial junio 2023

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
* Condiciones de aprobación: 60% correcto.
* Duración de examen: 3 horas.

---

1. [1 punto]: Diséñese la GIC bien formada del lenguaje L = {a^n b^m c^(n+m) / n, m >= 0}

    * **Solución**

    ```grammar
    S -> λ | aSc | bAc | bc
    A -> bAc | bc
    ```

1. [1 punto]: Diseñese AP por vaciado de pila (algoritmo) que reconoce el lenguaje generado por GIC <{a, b}, {S, A}, S, {S -> AA, S -> a, A -> AA, A -> b}>

    * **Solución**

    ```grammar
    S -> bA | bZA | a
    A -> b | bZ
    Z -> b | bZ | bZZ
    ```

1. [1 punto]: Determínese por comprensión simbólica el LIC generado por GIC <{a, b, c, d}, {S, A}, S, {S -> aSd, S -> A, S -> λ, A -> bAc, A -> bc}>

    * **Solución**

    ```plain
    L = {a^i b^j c^j d^i / i, j >= 0}
    ```

1. [1 punto]: Elimínese recursividad por la izq de GIC <{a, b, c, d}, {S}, S, {S -> Sa, S -> Sbcd, S -> ab, S -> c}>

    * **Solución**

    ```grammar
    S -> ab | c | abA | cA
    A -> a | bcd | aA | bcdA
    ```

1. [1 punto]: Factorícese a izq la GQIC <{a, b, c}, {S, A, B}, S, {S -> abSA, S -> abSBba, A -> cccSa, A -> cccBbb, B -> a, B -> λ}>

    * **Solución**

    ```grammar
    S -> abSD
    D -> A | Bba
    A -> cccE
    E -> Sa | Bbb
    B -> a | λ
    ```

1. [1 punto]: Muéstrese el contenido de la pila con mayor cantidad de símbolos durante el proceso de análisis sintáctico ascendente con retroceso para la cadena zazabzbz. Considerar la GIC <{z, a, b}, {S, M, N}, S, {S -> zMNz, M -> aMa, M -> z, N -> bNb, N -> z}>

    * **Solución**

    ```plain
    #zMbNb
    ```

1. [1 punto]: Determínese por comprensión simbólica el lenguaje reconocido por MT <{a, b, c, B, X}, {a, b, c}, q0, {q0, q1, q2}, {q2}, B, {δ(q0, (a,B)) = (q0, (a,X), (R,R)), δ(q0, (b,B)) = (q0, (b,X), (R,R)), δ(q0, (c,B)) = (q1, (c,B), (S,L)), δ(q1, (c,X)) = (q1, (c,B), (R,L)), δ(q1, (B,B)) = (q2, (B,B), (S,S))}>
Muéstrese de ser posible las δ necesarias para volver a la configuración inicial.

    * **Solución**

    ```plain
    L = {w c^n / w ∈ {a, b}* ^ n > 0 ^ |w| = n}
    ```

1. [1 punto]: Marcar si las siguientes afirmaciones son Verdaderas o Falsas:
    * a. La intersección de dos LIC da siempre como resultado un LR.
    * b. Dado el lenguaje L = {a^i b^j e^k / i, j, k >= 0 tal que i = j o i = k }, sus cadenas pueden generarse con una GIC de la Clasificación de Chomsky.
    * c. La GIC <{S, A, B}, {a, b}, P, S> donde P: S -> bAAA | aBBB A -> aba B -> bab genera un LR.
    * d. Dada la siguiente definición BNF: \<expr> ::= \<expr>\<expr> + | \<expr>\<expr> \* | a | b | c, la palabra cba*+ pertenece al lenguaje.

    * **Solución**

    ```plain
    a.F b.V c.V d.V
    ```

1. [1 punto]: Marcar si las siguientes afirmaciones son Verdaderas o Falsas:
    * a. Existen APD y APND.
    * b. Un AP puede aceptar una palabra si vacía su pila, sin importar en el estado en que se encuentre.
    * c. Dado el lenguaje L = {[()], [(())], [((()))]} El modelo abstracto de menor potencia que reconoce sus palabras es el AP.
    * d. Las palabras del lenguaje L = {x pertenece {a, b, c, d, e}\* / x = b^(2r) a^(n+1) b^n d^m e^(r+1) para n, r >= 0 y m = 3r} pueden ser reconocidas por un AP.

    * **Solución**

    ```plain
    a.V b.V c.F d.F
    ```

1. [1 punto]: Marcar si las siguientes afirmaciones son Verdaderas o Falsas:
    * a. Una MT reconoce palabras generadas por una GIC.
    * b. Dado el lenguaje L = {f^m h^n ff g^(2n+2) e^i d^(3i) / i, n, m >= 0}, con ∑ = {d, e, f, g, h}. Sus palabras pueden ser aceptadas por una MT y no por un AP.
    * c. La MT multicinta tiene más poder de cómputo que la MT unicinta.
    * d. Las palabras del lenguaje L = {w^n x^m y^n z^m com n >= 1 y 2 >= m >=1} sólo pueden ser reconocidas por una MT.

    * **Solución**

    ```plain
    a.V b.F c.F d.F
    ```

---
