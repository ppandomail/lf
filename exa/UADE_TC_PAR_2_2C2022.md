# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo / Ing. Fernando Basteiro

---

### Segundo Examen Parcial noviembre 2022

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

1. [2 puntos]: Diséñese el AP, utilizando el algoritmo visto en clase, que reconoce por vaciado de pila el lenguaje generado por la siguiente GIC: <{a, b, x, y}, {S, A, B}, S, {S -> aSb, S -> AB, A -> xA, A -> AA, A -> y, B -> bbBa, B -> bba}>

    * **Solución**

    ```grammar
    S -> aSX | xAB | yAB | yB
    A -> xA | yA | y
    B -> bXBY | bXY
    X -> b
    Y -> a
    ```

1. [2 puntos]: Defínase por comprensión simbólica el L que genera la GIC (Puede definirse L como la unión, intersección y/o concatenación de lenguajes si es necesario): GIC: <{x, a, b, c, d}, {S, S', A, B, C, D}, S, {S -> xS, S -> xS', S' -> AC, S' -> B, A -> aAb, A -> ab, B -> cBd, B -> cd, C -> aCd, C -> aDd, D -> bDc, D -> bc}>

    * **Solución**
    * L = {x^n a^m b^m a^i b^j c^j d^i / n, m i, j > 0} U {x^n c^m d^m / n, m > 0}

1. [2 puntos]: Diséñese una GIC en notación BNF para describir la sintaxis de una operación matemática válida. La operación no debe incluir el resultado, pero debe finalizar con el símbolo =. La operación puede incluir la utilización de paréntesis, con los cuidados que ello requiere. No se admiten números con ceros a la izquierda (Ej: 08) excepto cuando el valor es exactamente 0. Σ = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, +, -, *, /, (, ), = }
    * **Palabras válidas del lenguaje**: {13 + 5 \* ( 8 – 0 + ( 3 / 2 ) – 3 ) =, 7 =, ( 13 + 2 ) =, ...}
    * **Palabras no válidas del lenguaje**: {13 \* + 6 = -> "No puede contener dos operaciones consecutivas", 15 + 2 -> "Debe finalizar siempre con el símbolo =", 7 ) * 3 + ( 2 = -> "No puede cerrar paréntesis antes de abrirlos, ni puede dejar paréntesis sin cerrar", ( ) = -> "Debe contener al menos un valor", ...}

    * **Solución**

    ```grammar
    <S> ::= <E> =
    <E> ::= <E> <O> <E> | (<E>) | <D>
    <O> ::= + | - | * | /
    <D> ::= 0 | ... | 9 | 1 <D'> | ... | 9 <D'>
    <D'>::= 0 | ... | 9 | 0 <D'> | ... | 9 <D'>
    ```

1. [2 puntos]: Comprúebese si la GIC definida a continuación es LL(1). Si no es LL(1), hacer las modificaciones pertinentes (si es posible) para convertirla en LL(1). Si lo es, o se pudo convertir, construir su tabla de análisis y verificar si la siguiente entrada es analizada correctamente: z and or y x. GIC: <{or, and, x, y, z}, {S, S', Q, Q', R, F}, S, {S -> QS', S' -> orQS', S' -> λ, Q -> RQ', Q' -> RQ', Q' -> λ, R -> F and, R -> x, R -> y, F -> z}>

    * **Solución**
    * PRIM(S) = {z, x, y}
    * PRIM(S’) = {or, λ}
    * PRIM(Q) = {z, x, y}
    * PRIM(Q’) = {z, x, y, λ}
    * PRIM(R) = {z, x, y}
    * PRIM(F) = {z}
    * SIG(S) = {$}
    * SIG(S’) = {S}
    * SIG(Q) = {or, $}
    * SIG(Q’) = {or, $}
    * SIG(R) = {z, x, y, or, $}
    * SIG(F) = {and}
    * PRED(S -> QS’) = {z, x, y}
    * PRED(S’ -> orQS’) = {or}
    * PRED(S’ -> λ) = {$}
    * PRED(Q -> RQ’) = {z, x, y}
    * PRED(Q’ -> RQ’) = {z, x, y}
    * PRED(Q’ -> λ) = {or, $}
    * PRED(R -> Fand) = {z}
    * PRED(R -> x) = {x}
    * PRED(R -> y) = {y}
    * PRED(F -> z) = {z}

    || or | and | x | y | z | $ |
    | -- | -- | -- | -- | -- | -- | -- |
    | S | error | error | S -> QS' | S -> QS' | S -> QS' | error |
    | S' | S’ -> orQS’ | error | error | error | error | S’ -> λ |
    | Q | error | error | Q -> RQ' | Q -> RQ' | Q -> RQ' | error |
    | Q' | Q' -> λ | error | Q' -> RQ' | Q' -> RQ' | Q' -> RQ' | Q' -> λ |
    | R | error | error | R -> x | R -> y | R -> Fand | error |
    | F | error | error | error | error | F -> z | error |

    | Pila | Entrada | Regla o Acción |
    | -- | -- | -- |
    | $ S | z and or y x $ | S -> QS’ |
    | $ S’ Q | z and or y x $ | Q -> RQ’ |
    | $ S’ Q’ R | z and or y x $ | R -> Fand |
    | $ S’ Q’ and F | z and or y x $ | F -> z |
    | $ S’ Q’ and z | z and or y x $ | Emparejar(z) |
    | $ S’ Q’ and | and or y x $ | Emparejar(and) |
    | $ S’ Q’ | or y x $ | Q’ -> λ |
    | $ S’ | or y x $ | S’ -> orQS’ |
    | $ S’ Q or | or y x $ | Emparejar(or) |
    | $ S’ Q | y x $ | Q -> RQ’ |
    | $ S’ Q’ R  | y x $ | R -> y |
    | $ S’ Q’ y | y x $ | Emparejar(y) |
    | $ S’ Q’ | x $ | Q’ -> RQ’ |
    | $ S’ Q’ R | x $ | R -> x |
    | $ S’ Q’ x | x $ | Emparejar(x) |
    | $ S’ Q’ | $ | Q’ -> λ |
    | $ S’ | $ | S’ -> λ |
    | $ | $ | Aceptar |

1. [2 puntos]: Defínase por comprensión coloquial la computación que realiza la siguiente MT, con alfabeto = {a, b}. Calcúlese la complejidad espacial y temporal de cadena mas corta y la dos siguientes en cuanto a longitud.

    | Q | a | b | B |
    | -- | -- | -- | -- |
    | >q1| q1aR | q2aR | |
    | q2 | q2aR | | q3BL |
    | q3 | q4bL | | |
    | q4 | q4aL | | q5BR |
    | *q5 | | | |

    * **Solución**
    * f: {a^nba^m / n, m >= 0} -> {a^(n+m)b / n, m >= 0}

---
