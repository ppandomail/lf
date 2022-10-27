# Análisis Sintáctico Descendente (ASD)

## ASD con retroceso

* Consiste en recorrer el árbol de izquierda a derecha y de arriba abajo de manera que para la sentencia a analizar, se la compara con cada nodo del árbol que va recorriendo y en el caso de que los terminales a la izquierda del primer no terminal no coincidan, se termina la búsqueda por esa rama y se vuelve hacia atrás para buscar otra rama.
* Problema: ineficiente

### Ejemplo ASD con retroceso

```grammar
S -> c(S,S) | g(S) | 1 | 2
```

![ASD con retroceso](img/asd.png)

| Pila | Entrada | Transición |
| -- | -- | -- |
| λ | c(g(1),2) | δ(q0, λ, λ) = (q1, #) |
| # | c(g(1),2) | δ(q1, λ, λ) = (q2, S) |
| #S | c(g(1),2) | δ(q2, λ, S) = (q2, c(S,S)) |
| #)S,S(c | c(g(1),2) | δ(q2, c, c) = (q2, λ) |
| #)S,S( | (g(1),2) | δ(q2, (, () = (q2, λ) |
| #)S,S | g(1),2) | δ(q2, λ, S) = (q2, g(S)) |
| #)S,)S(g | g(1),2) | δ(q2, g, g) = (q2, λ) |
| #)S,)S( | (1),2) | δ(q2, (, () = (q2, λ) |
| #)S,)S | 1),2) | δ(q2, λ, S) = (q2, 1) |
| #)S,)1 | 1),2) | δ(q2, 1, 1) = (q2, λ) |
| #)S,) | ),2) | δ(q2, ), )) = (q2, λ) |
| #)S, | ,2) | δ(q2, ,, ,) = (q2, λ) |
| #)S | 2) | δ(q2, λ, S) = (q2, 2) |
| #)2 | 2) | δ(q2, 2, 2) = (q2, λ) |
| #) | ) | δ(q2, ), )) = (q2, λ) |
| # | λ |  δ(q2, λ, #) = (q3, λ) |
| λ | λ |  accept |

## ASDP LL(1)

* Analizador Sintáctico Descendente Predictivo (ADSP) o Left to right Leftmost derivation (LL)
  * L: left to right: lee la entrada de izquierda a derecha.
  * L: leftmost derivation: produce una derivación por la izquierda.
* *e aumenta la eficiencia, siendo capaces de saber que producción aplicar del conjunto de producciones aplicables en cada caso.
* Es decir, si se tiene un token y una serie de reglas a aplicar, se debe poder elegir una de ellas mirando si el primer token coincide con el que se tiene seleccionado (un solo símbolo de preanálisis)
* A las gramáticas que cumplen estos requisitos, se les llama LL(1).
* Los ASDP son muchos menos costosos computacionalmente que los ASD, por lo que se utilizan a la hora de implementar compiladores.
* Para implementar un ASDP, se utiliza el concepto de predicción.
* Se trata de relacionar cada producción con todos los posibles terminales a que se puede acceder aplicada dicha producción.
* Cuando el Parser no puede decidir qué producción aplicar se llama CONFLICTO y una de las tareas más difíciles en el diseño de un compilador es la creación de una GIC que no tenga conflictos.
* Varias técnicas producen GIC equivalentes y sin conflictos.
* En resumen: LL(1) es una GIC que trabaja con un Parser que lee la entrada de izquierda a derecha y realiza una derivación por izquierda. LL(1) es muy útil porque sólo necesita conocer un símbolo de preanálisis (un token) para realizar la derivación por izquierda.
* Se debe conocer el conjunto de predicción para poder implementar un ASDP.
* Para obtener el conjunto de predicción, se deben obtener: el conjunto de primeros y el conjunto de siguientes.

### Algoritmo Conjunto de Primeros

```plain
Sea A -> a1...an una producción

Si (a1...an  =  λ) 
    PRIM(a1...an) = {λ
Sino    
    Si (a1 ∈ ΣT)
        PRIM(a1...an) = {a1} 
    Si (a1 ∈ ΣN)
        Calcular PRIM(a1). PRIM(a1) es el resultado de unir todos los PRIM de todas las partes derechas de las producciones de a1 en la gramática.
        Si (λ ∈ PRIM(a1) y a1 no es el último símbolo de a1...an)
            PRIM(a1...an) = (PRIM(a1) – {λ}) U PRIM(a2...an)
        Sino
            PRIM(a1...an) = PRIM(a1)
```

### Algoritmo Conjunto de Siguientes

```plain
Sea A -> a1...an una producción
Para obtener SIG(A), se inspecciona la GIC buscando todas las ocurrencias de A. 

Si (A es el axioma) 
    SIG(A) = {$}
Sino 
    SIG(A) = {}
Para (Produccion p : producciones) se pueden dar estas situaciones
    (...Ax...), donde x ∈ ΣT, entonces SIG(A) = SIG(A) U {x}
    (...AB...), donde B ∈ ΣN, entonces SIG(A) = SIG(A) U (PRIM(B) – {λ})
    (T -> ...A), donde A es el último símbolo del lado derecho en cierta producción o (T -> ...AB) en que λ ∈ PRIM(B), entonces SIG(A) = SIG(A) U SIG(T)
```

### Algoritmo Conjunto de Predicciones

```plain
Si (λ ∈ PRIM(a1...an))
    PRED(A -> a1...an) = (PRIM(a1...an) – {λ}) U SIG(A)
Sino
    PRED(A -> a1...an) = PRIM(a1...an)
```

### Ejemplos

* Ejemplo 1:

  ```grammar
  S -> aST | b
  T -> cT | d
  ```

  * PRIM(S) = PRIM(S -> aST) U PRIM(S -> b) = {a, b}
  * PRIM(T) = PRIM(T -> cT) U PRIM(T -> d) = {c, d}
  * SIG(S) = {$, c, d}
  * SIG(T) = {$, c, d}
  * PRED(S -> aST) = {a}
  * PRED(S -> b) = {b}
  * PRED(T -> cT) = {c}
  * PRED(T -> d) = {d}

* Ejemplo 2:

  ```grammar
  S -> c(S,S) | g(S) | 1 | 2
  ```

  * PRIM(S) = PRIM(S -> c(S,S)) U PRIM(S -> g(S)) U PRIM(S -> 1) U PRIM(S -> 2) = {c, g, 1, 2}
  * SIG(S) = {$, ',', )}
  * PRED(S -> c(S,S)) = {c}
  * PRED(S -> g(S)) = {g}
  * PRED(S -> 1) = {1}
  * PRED(S -> 2) = {2}

* Ejemplo 3:

  ```grammar
  S -> aSe | B
  B -> bBe | C
  C -> cCe | d
  ```

  * PRIM(S) = {a, b, c, d}
  * PRIM(B) = {b, c, d}
  * PRIM(C) = {c, d}
  * SIG(S) = {e, $}
  * SIG(B) = {e, $}
  * SIG(C) = {e, $}
  * PRED(S -> aSe) = {a}
  * PRED(S -> B) = {b, c, d}
  * PRED(B -> bBe) = {b}
  * PRED(B -> C) = {c, d}
  * PRED(C -> cCe) = {c}
  * PRED(D -> d) = {d}

* Ejemplo 4:

  ```grammar
  S -> aSb | λ
  ```

  * PRIM(S) = {a, λ}
  * SIG(S) = {$, b}
  * PRED(S -> aSb) = {a}
  * PRED(S -> λ) = {$, b}

* Ejemplo 5:

  ```grammar
  S -> iSE | o
  E -> eSfi | fi
  ```

  * PRIM(S) = {i, o}
  * PRIM(E) = {e, f}
  * SIG(S) = {$, e, f}
  * SIG(E) = {$, e, f}
  * PRED(S -> iSE) = {i}
  * PRED(S -> o) = {o}
  * PRED(E -> eSfi) = {e}
  * PRED(E -> fi) = {f}

* Ejemplo 6:

  ```grammar
  E -> TS
  T -> + | -
  S -> num | λ
  ```

  * PRIM(E) = {+, -}
  * PRIM(T) = {+, -}
  * PRIM(S) = {num, λ}
  * SIG(E) = {$}
  * SIG(T) = {num, $}
  * SIG(S) = {$}
  * PRED(E -> TS) = {+, -}
  * PRED(T -> +) = {+}
  * PRED(T -> -) = {-}
  * PRED(S -> num) = {num}
  * PRED(S -> λ) = {$}

* Ejemplo 7:

  ```grammar
  A -> BCD 
  B -> aCb | λ
  C -> cAd | eBf | gDh | λ
  D -> i
  ```

  * PRIM(A) = {a, c, e, g, i}
  * PRIM(B) = {a, λ}
  * PRIM(C) = {c, e, g, λ}
  * PRIM(D) = {i}
  * SIG(A) = {$, d}
  * SIG(B) = {f, c, e, g, i}
  * SIG(C) = {i, b}
  * SIG(D) = {h, $, d}
  * PRED(A -> BCD) = {a, c, e, g, i}
  * PRED(B -> aCb) = {a}
  * PRED(B -> λ) = {c, e, g, f, i}
  * PRED(C -> cAd) = {c}
  * PRED(C -> eBf) = {e}
  * PRED(C -> gDh) = {g}
  * PRED(C -> λ) = {i, b}
  * PRED(D -> i) = {i}

* Ejemplo 8:

  ```grammar
  S -> zMNz
  M -> aMa|z
  N -> bNb|z
  ```

  * PRIM(S) = {z}
  * PRIM(M) = {a, z}
  * PRIM(N) = {b, z}
  * SIG(S) = {$}
  * SIG(M) = {b, z, a}
  * SIG(N) = {z, b}
  * PRED(S -> zMNz) = {z}
  * PRED(M -> aMa) = {a}
  * PRED(M -> z) = {z}
  * PRED(N -> bNb) = {b}
  * PRED(N -> z) = {z}

* Ejemplo 9:

  ```grammar
  S -> AB
  A -> a | λ
  B -> bCd
  C -> c | λ
  ```

  * PRIM(S) = {a, b}
  * PRIM(A) = {a, λ}
  * PRIM(B) = {b}
  * PRIM(C) = {c, λ}
  * SIG(S) = {$}
  * SIG(A) = {b}
  * SIG(B) = {$}
  * SIG(C) = {d}
  * PRED(S -> AB) = {a, b}
  * PRED(A -> a) = {a}
  * PRED(A -> λ) = {b}
  * PRED(B -> bCd) = {b}
  * PRED(C -> c) = {c}
  * PRED(C -> λ) = {d}

* Ejemplo 10:

  ```grammar
  terminales = {f, i, v, s, fd}

  P -> HDB | Pf 
  H -> i | λ
  D -> v | λ
  B -> s | Dfd | λ
  ```

  * PRIM(P) = {i, s, v, fd, λ, f}
  * PRIM(H) = {i, λ}
  * PRIM(D) = {v, λ}
  * PRIM(B) = {s, v, fd, λ}
  * SIG(P) = {$, f}
  * SIG(H) = {s, v, fd, $, f}
  * SIG(D) = {s, v, fd, $, f}
  * SIG(B) = {$, f}
  * PRED(P -> HDB) = {i, s, v, fd, $, f}
  * PRED(P -> Pf) = {i, s, v, fd, f}
  * PRED(H -> i) = {i}
  * PRED(H -> λ) = {s, v, fd, $, f}
  * PRED(D -> v) = {v}
  * PRED(D -> λ) = {s, v, fd, $, f}
  * PRED(B -> s) = {s}
  * PRED(B -> Dfd) = {v, fd}
  * PRED(B -> λ) = {$, f}

* Ejemplo 11:

  ```grammar
  S  -> iCtP
  C -> CoD | D | (C)
  D -> DaE | E
  E -> l
  P -> P+Q | Q
  Q -> Q*R | R
  R -> d
  ```

  * PRIM(S) = {i}
  * PRIM(C) = {(, l}
  * PRIM(D) = {l}
  * PRIM(E) = {l}
  * PRIM(P) = {d}
  * PRIM(Q) = {d}
  * PRIM(R) = {d}
  * SIG(S) = {$}
  * SIG(C) = {t, o, )}
  * SIG(D) = {t, a}
  * SIG(E) = {t, a}
  * SIG(P) = {$, +}
  * SIG(Q) = {$, +, *}
  * SIG(R) = {$, +, *}
  * PRED(S -> iCtP) = {i}
  * PRED(C -> CoD) = {(, l}
  * PRED(C -> D) = {l}
  * PRED(C -> (C)) = {()}

### Gramáticas LL(1)

* La condición para que se pueda construir un ASDP a partir de una GIC dice si la GIC es del tipo LL(1).
* Es decir, toda GIC del tipo LL(1) permite construir un ASDP sobre ella, y viceversa.
* Condición LL(1): para todas las producciones de la gramática para un mismo no terminal A:
  * A -> α1| α2 | ... | αn
  * Se debe cumplir: Para todo i, j distintos => PRED(A -> αi) ∩ PRED(A -> αj) = {} = Ø

* Ejemplo 1: La siguiente GIC es LL(1) porque...

  ```grammar
  S -> aST | b
  T -> cT | d
  ```

  * PRED(S -> aST) ∩ PRED(S -> b) = {a} ∩ {b} = {}
  * PRED(T -> cT) ∩ PRED(T -> d) = {c} ∩ {d} = {}

* Ejemplo 2: La siguiente GIC es LL(1) porque...

  ```grammar
  S -> c(S,S) | g(S) | 1 | 2
  ```

  * PRED(S -> c(S,S)) ∩ PRED(S -> g(S)) ∩ PRED(S -> 1) ∩ PRED(S -> 2) = {c} ∩ {g} ∩ {1} ∩ {2} = {}

### Conversión a GIC LL(1)

* Con seguridad se sabe que una GIC no es LL(1) si:
  * Es una GIC ambigua -> replantear la GIC
  * Tiene factores comunes por la izquierda

    ```grammar
    Cambiar las reglas del tipo: A -> aβ1 | aβ2 | ... | aβn
    Por estas reglas:
        A -> aA’
        A’-> β1 | β2 | ... | βn
    ```

  * Es recursiva por la izquierda

    ```grammar
    Cambiar las reglas del tipo: A ->  Aa | β
    Por estas reglas:
        A -> βA’
        A’-> aA’ | λ
    ```

* El caso contrario no tiene porqué ser cierto. Es decir,
  * Si una GIC no es ambigua no permite decir que es LL(1).
  * Si una GIC no tiene factores comunes por la izquierda, no indica con certeza que sea LL(1).
  * Si una GIC no es recursiva por la izquierda, no asegura que sea LL(1).

### Implementación de ASDP’s

* Si se conoce el siguiente símbolo a analizar, se puede construir un ASDP mediante diagramas de sintaxis y un lenguaje que admita recursión.
* Hay otra manera de construir este tipo de analizadores: tabla de análisis.
* La tabla que se construye representa el Parser LL (Autómata Finito a Pila de la gramática LL), por lo que es capaz de analizar cualquier palabra y ver si es reconocida por el Parser LL correspondiente.

* Ejemplo 1:

  * PRED(S -> aST) = {a}
  * PRED(S -> b) = {b}
  * PRED(T -> cT) = {c}
  * PRED(T -> d) = {d}

| | a | b | c | d | $ |
| -- | -- | -- | -- | -- | -- |
| S | S -> aST | S -> b | error | error | error |
| T | error | error | T -> cT | T -> d | error |

| Pila | Entrada | Regla o Acción |
| -- | -- | -- |
| $S | aabcdd$ | S -> aST |
| $TSa | aabcdd$ | Emparejar(a) |
| $TS | abcdd$ | S -> aST |
| $TTSa | abcdd$ | Emparejar(a) |
| $TTS | bcdd$ | S -> b |
| $TTb | bcdd$ | Emparejar(b) |
| $TT | cdd$ | T -> cT |
| $TTc | cdd$ | Emparejar(c) |
| $TT | dd$ | T -> d |
| $Td | dd$ | Emparejar(d) |
| $T | d$ | T -> d |
| $d | d$ | Emparejar(d) |
| $ | $ | accept |

* Ejemplo 2:

  * PRED(S -> c(S,S)) = {c}
  * PRED(S -> g(S)) = {g}
  * PRED(S -> 1) = {1}
  * PRED(S -> 2) = {2}

| | c | ( | , | ) | g | 1 | 2 | $ |
| -- | -- | -- | -- | -- | -- | -- | -- | -- |
| S | S -> c(S,S) | error | error | error | S -> g(S) | S -> 1 | S -> 2 | error |

| Pila | Entrada | Regla o Acción |
| -- | -- | -- |
| $S | c(g(1),2)$ | S -> c(S,S) |
| $)S,S(c | c(g(1),2)$ | Emparejar(c) |
| $)S,S( | (g(1),2)$ | Emparejar('(') |
| $)S,S | g(1),2)$ | S -> g(S) |
| $)S,)S(g | g(1),2)$ | Emparejar(g) |
| $)S,)S( | (1),2)$ | Emparejar('(') |
| $)S,)S | 1),2)$ | S -> 1 |
| $)S,)1 | 1),2)$ | Emparejar(1) |
| $)S,) | ),2)$ | Emparejar(')')|
| $)S, | ,2)$ | Emparejar(,)|
| $)S | 2)$ | S -> 2 |
| $)2 | 2)$ | Emparejar(2) |
| $) | )$ | Emparejar(')')|
| $ | $ | accept |

* Ejemplo 3:

  * PRED(S -> zMNz) = {z}
  * PRED(M -> aMa) = {a}
  * PRED(M -> z) = {z}
  * PRED(N -> bNb) = {b}
  * PRED(N -> z) = {z}

| | z | a | b | $ |
| -- | -- | -- | -- | -- |
| S | S -> zMNz | error | error | error |
| M | M -> z | M -> aMa | error | error |
| N | N -> z | error | N -> bNb | error |

| Pila | Entrada | Regla o Acción |
| -- | -- | -- |
| $S | zazabzbz$ | S -> zMNz |
| $zNMz | zazabzbz$ | Emparejar(z) |
| $zNM | azabzbz$ | M -> aMa |
| $zNaMa | azabzbz$ | Emparejar(a) |
| $zNaM | zabzbz$ | M -> z |
| $zNaz | zabzbz$ | Emparejar(z) |
| $zNa | abzbz$ | Emparejar(a) |
| $zN | bzbz$ | N -> bNb |
| $zbNb | bzbz$ | Emparejar(b) |
| $zbN | zbz$ | N -> z |
| $zbz | zbz$ | Emparejar(z) |
| $zb | bz$ | Emparejar(b) |
| $z| z$ | Emparejar(z) |
| $| $ | accept |

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
