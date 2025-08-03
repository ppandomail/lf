# Análisis Sintáctico Descendente (ASD)

## Ejercicios ASD con retroceso

1. Verificar si la construcción aaabddccd es correcta

    ```grammar
    S -> aST | b
    T -> cT | d
    ```

1. Verificar si la construcción 01210 es correcta

    ```grammar
    S -> 0S0 | 1S1 | 2
    ```

1. Verificar si la construcción 11100 es correcta. L = {palabras están formadas por un conjunto de 1´s seguidos de un conjunto de 0´s, donde la cantidad de símbolos 1 debe ser impar  y la cantidad de  símbolos 0 debe ser par}

1. GIC:

    ```grammar
    S -> AA | 0
    A -> SS | 1
    ```

1. GIC:

    ```grammar
    S -> z | xSzz
    ```

## Ejercicios eliminar factores comunes por la izquierda

1. GIC:

    ```grammar
    S -> aTbRba | aTbc
    T -> a | Ta
    R -> c | cRb
    ```

1. GIC:

    ```grammar
    A -> aBcDe | CD 
    A -> aBcDF
    A -> aBcDf
    C -> k
    D -> h
    F -> d
    ```

1. GIC:

    ```grammar
    <if> -> if (<cond>) <sent> else <sent>
    <if> -> if (<cond>) <sent>
    ```

## Ejercicios eliminar recursividad a izquierda

1. GIC:

    ```grammar
    <listaExp> -> <operando> | <listaExp> <operador> <operando>
    ```

1. GIC:

    ```grammar
    E -> E+T | E-T | T | F
    T -> T*F | T/F | F
    F -> num | (E)
    ```

1. GIC:

    ```grammar
    listaExp -> exp | listaExp ; exp
    exp -> termino | exp + termino
    termino -> factor | termino * factor
    factor -> num | (exp)
    ```

## Ejercicios calcular el conjunto primero

1. GIC

    ```grammar
    A -> (A)A | λ
    ````

1. GIC

    ```grammar
    A -> BC
    B -> λ | m
    C -> λ | s
    ```

1. GIC:

    ```grammar
    S -> ABc
    A -> a | λ
    B -> b | λ
    ```

## Ejercicios calcular el conjunto siguiente

1. GIC

    ```grammar
    S -> aBCd
    B -> bb
    C -> cc
    ```

1. GIC

    ```grammar
    S -> aBCd
    B -> bB | d
    C -> cc
    ```

1. GIC

    ```grammar
    S -> aBCd
    B -> CB | b
    C -> cc | λ
    ```

1. GIC

    ```grammar
    S -> if B then S | write B | id:= B
    B -> id = id | id <> id | true | false
    ```

## Ejercicios comprobar si GIC son LL(1). Si no lo son tranformarlas a LL(1)

1. GIC:

    ```grammar
    S -> if S E | otro
    E -> else S end if | end if
    ```

1. GIC:

    ```grammar
    A -> abB | Bb
    B -> b | c
    ```

1. GIC:

    ```grammar
    A -> CD | aB
    B -> aCd |λ
    C -> dCd | a | λ | ae
    D -> a
    ```

1. GIC:

    ```grammar
    S -> AD| aB
    B -> aC
    C -> dC | a | ae
    D -> bD | λ
    A -> a | λ
    ```

1. GIC:

    ```grammar
    E -> E + T | T
    T -> T * F | F
    F -> num | (E)
    ```

1. GIC:

    ```grammar
    A -> cbB | Bb | ab
    B -> a | b | c
    ```

1. GIC:

    ```grammar
    A -> adB | Bd
    B -> d | c | e
    ```

1. GIC:

    ```grammar
    T -> T + T | T * H | H
    H -> num | (T)
    ````

1. GIC:

    ```grammar
    A -> C | BCd
    B -> a | c | d | λ | aB
    C -> d | λ | aC
    ```

## Ejercicios ASDP

1. Sea la siguiente gramática, comprobar si es LL(1) y si lo es, construir su tabla de análisis y verificar si la entrada siguiente es analizada correctamente: a b ( 0 ) a c a

    ```grammar
    S -> A | a
    A -> b ( E ) S L
    L -> c S | λ
    E -> 0 | 1
    ```

    ```plain
    PRIM(S) = {b, a}
    PRIM(A) = {b}
    PRIM(L)  = {c, λ}
    PRIM(E) = {0, 1}
    SIG(S) = {$, c}
    SIG(A) = {$, c}
    SIG(L) = {$, c}
    SIG(E) = {)}
    PRED(S -> A) = {b}
    PRED(S -> a) = {a}
    PRED(A -> b(E)SL) = {b}
    PRED(L -> cS) = {c}
    PRED(L -> λ) = {$, c}
    PRED(E -> 0) = {0}
    PRED(E -> 1) = {1}

    Se observa que para L hay dos conjuntos de predicción con el mismo terminal, por lo que la gramática no es LL(1)
    ```

1. Hacer lo mismo que en caso anterior y si no es LL(1) hacer las modificaciones pertinentes (si se puede) para convertirla en LL(1). Construir su tabla de análisis y verificar si la entrada siguiente es analizada correctamente: z and or y x

    ```grammar
    S -> S or Q | Q
    Q -> Q R | R
    R -> F and | x | y
    F -> z
    ```

    ```plain
    No es LL(1) porque es recursiva por la izquierda. Se elimina esta recursividad.

    S -> QS’ 
    S’ -> orQS’
    S’ -> λ
    Q -> RQ’
    Q’ -> RQ’
    Q’ -> λ
    R -> Fand 
    R -> x
    R -> y
    F -> z

    PRIM(S) = {z, x, y}
    PRIM(S’) = {or, λ}
    PRIM(Q) = {z, x, y}
    PRIM(Q’) = {z, x, y, λ}
    PRIM(R) = {z, x, y}
    PRIM(F) = {z}
    SIG(S) = {$}
    SIG(S’) = {S}
    SIG(Q) = {or, $}
    SIG(Q’) = {or, $}
    SIG(R) = {z, x, y, or, $}
    SIG(F) = {and}
    PRED(S -> QS’) = {z, x, y}
    PRED(S’ -> orQS’) = {or}
    PRED(S’ -> λ) = {$}
    PRED(Q -> RQ’) = {z, x, y}
    PRED(Q’ -> RQ’) = {z, x, y}
    PRED(Q’ -> λ) = {or, $}
    PRED(R -> Fand) = {z} 
    PRED(R -> x) = {x}
    PRED(R -> y) = {y}
    PRED(F -> z) = {z}

    Se observa que es LL(1).
    ```

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

1. Sea la GIC LL(1):

    ```grammar
    LE -> fdt | E ; LE
    E -> T E’
    E’ -> + T E’ | λ
    T -> F T’
    T’ -> * F T’ | λ
    F -> n | ( E )
    ```

    1. Construir su tabla de análisis.
    1. Verificar si las entradas siguientes son analizadas correctamente:
        1. 1 + 2;
        1. 1 + 2*;

1. Comprobar si la siguiente GIC es LL(1) y construir la tabla, calculando todos los conjuntos siguiente y primero. Luego si es LL(1), reconocer la cadena "cab" con el analizador construido.

    ```grammar
    S -> cA
    A -> aB
    B -> b | λ
    ```

1. Comprobar si la siguiente GIC es LL(1) y construir la tabla, calculando todos los conjuntos siguiente y primero. Luego si es LL(1), reconocer la cadena "id;a+a;" con el analizador construido.

    ```grammar
    B -> DL
    D -> id ; D | λ
    L -> S ; L | λ
    S -> a + a
    ```

1. Constrúyase si es posible la matriz predictiva para la siguiente GIC

    ```grammar
    S -> (A)
    A -> CB
    B -> ;A | λ
    C -> x | S
    ```
