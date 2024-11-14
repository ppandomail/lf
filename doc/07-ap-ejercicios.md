# Autómata de Pila (AP)

## Ejercicios conceptuales

1. Investigue y justifique L = {a^nb^n / n ≥ 1} no es un LR. Demuestre que las producciones de la siguiente gramática generan al lenguaje L: S -> aSb | ab
1. Sea la transición T(4, λ, Z) = {(5, RP)}. Describa qué significa

## Ejercicios diseño de AP por pila vacia

1. {a^nb^n / n ≥ 1}. Describa el trabajo del AP anterior para reconocer la palabra aaabbb y no reconocer las palabras: aabbb, aaabb, aabba y λ

## Ejercicios diseño de AP que reconoce el LIC definido simbólicamente

1. {a^nb^(n+1) / n ≥ 1}
1. {a^(n+1)b^n / n ≥ 1}
1. {xyxy^nzy^(2n+1) / n ≥ 0}
1. {a^nb^(2n)a^t/ n ≥ 1, t ≥ 0}
1. {a^nb^mc^(m+n) / m, n ≥ 0}
1. {a^nb^mc^pa^qb^n / q = p + m, n, m ≥ 1, p ≥ 0}
1. {a^nb^mc^pa^qb^rc^s/ q = p + m, 2n = r + s, n, m ≥ 1, p ≥ 0}
1. {wa^rb^rw^(-1) / w ∈ {a, b}*, r ≥ 1}.
1. {(ab)^(2s+1) c^j (d)^n e^(t+2n) / s, t, n ≥ 0 y j > t} U {(ab)^(h+1) d^(2k) e^(k+i) / h, i ≥ 0; k ≥ 1}
1. {a^(2k)b^(2n)c^kd^j / k, n, j ≥ 0}
1. {x^ry^sz^t / t = r+s y r, s ≥ 1}
1. {x^ry^sz^t / s = r+t y r, s ≥ 1}
1. {x / x = a Y e donde Y = b^(3n)cd^(3n), n ≥ 1}
1. {1^n0^k / n ≥ 0 y k = 3n}

## Ejercicios diseño de AP que reconoce el LIC definido coloquialmente

1. Sea el lenguaje de todas las palabras sobre el Σ = {a, b} en las que la cantidad de aes es igual a la cantidad de bes, como ab, abba, bababaab, etc
1. LIC de todas las expresiones aritméticas cuyo único operando es 4, los operadores son + (suma) y \* (producto), y puede haber paréntesis. Algunos casos correctos de estas expresiones son: 4, 4*(4+4), 4+4+4*4+((4))
1. Un lenguaje de programación tipo Pascal estructura los programas en forma anidada. La estructura de anidamientos está determinada por las siguientes palabras claves y símbolos:
    * if ... fi (condicional)
    * do ... od (iteración)
    * begin ... end (secuencia)
    * ( ... ) (expresiones)
    * Por ejemplo, la siguiente palabra es válida: begin if () do () begin end od fi do () begin end od end

## Ejercicios diseño de AP (estado final y vaciado de pila) que reconoce el LIC generado por la GIC

1. GIC = <ΣT = {a, b}, ΣN = {S, A}, S, P>

    ```grammar
    S -> λ | A
    A -> aAb | bAa | ab | ba
    ```

1. GIC = <ΣT = {x, y}, ΣN = {S, A, B}, S, P>

    ```grammar
    S -> xAy | xByy | xy | xyy | λ
    A -> xAy | xy
    B -> xByy | xyy
    ```

1. GIC = <ΣT = {0, 1}, ΣN = {S, B, C}, S, P>

    ```grammar
    S -> CB | BC | 0C1 | 1C0 | 0
    C -> 0C1 | 1C0 | 0
    B -> 0B1 | 1B0 | 01 | 10
    ```

1. GIC = <ΣT = {a, b}, ΣN = {S}, S, P>

    ```grammar
    S -> aabS| baaS | abaS | aaSb | baSa | abSa | aSab | bSaa |    aSba | Saab | Sbaa | Saba | λ
    ```

1. GIC = <ΣT = {0, 1}, ΣN = {S, A, B}, S, P>

    ```grammar
    S -> 0A1 | 0
    A -> 0A1 | 0B | 0
    B -> 0B | 0
    ```

1. GIC = <ΣT = {u, v}, ΣN = {S, A}, S, P>

    ```grammar
    S -> uAvv | uuAv | uvv | uuv
    A -> uuA | Avv | uu | vv 
    ```

1. GIC = <ΣT = {a, b, c, d, e, 0, 1}, ΣN = {S, A, B}, S, P>

    ```grammar
    S -> AaB | AaC
    A -> Ab | Ac | b | c
    B -> BdC | 0
    C -> CeB | 1 
    ```

1. GIC = <ΣT = {0, ..., 9, x, sin, cos, (, ), d, D, +, -, a, k, ↑, ∫},  ΣN = {Prob, Exp, Term, Power, Trig, Const, Var, Int}, S, P>

    ```grammar
    Prob -> ∫ Exp d Var | D Exp Var
    Exp -> Term | Term + Exp | Term – Exp 
    Term -> Const | Var | (-Term) | Trig | Power | Prob | (Exp)
    Power -> (Var ↑ Term)
    Trig -> (sin Var) | (cos Var)
    Const -> Int | a | k
    Var -> x
    Int -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 
    ```

1. GIC = <ΣT = {[, ], and, or, not, =, >, <, id, num},  ΣN = {S, C, V}, S, P>

    ```grammar
    S -> [C and C] | [C or C] | [not C]
    C -> [V = V] | [V > V] | [V < V]
    V -> id | num 
    ```

1. GIC = <ΣT = {(, do, ), id, num, and, or, not, print, cdr, length, +},  ΣN = {S, A, C, E, ME, V, N, VN}, S, P>

    ```grammar
    S -> (do(A)(C E) ME) | (do(A)(C E))
    A -> (V E E)A | (V E E)
    C -> (and E E) | (or E E) | (not E)
    E -> (print V) | (cdr V) | (length V) | (+ VN VN) | V | N
    ME -> E ME | E
    V -> id
    N -> num
    VN -> V | N
    ```

## Ejercicios Lema Pumping

1. {a^(i^2), palabras con un número cuadrado perfecto de letras idénticas (por ejemplo, aaaa)}
1. {a^ib^jc^r / 0 < i < j < r}
1. {a^ib^j / i ≤ j2}
1. {a^ib^j / i ≥ (j - 1)^3}
1. {a^ib^jc^r / r = j*i}
1. {a^ib^jc^r / r > i,  r > j}
1. {w ∈ {a, b, c}* / |w|a < |w|b < |w|c}
1. {w ∈ {a, b, c}\* / |w|a = |w|b \* |w|c}
1. {a^ib^ic^j / i ≤ j ≤ 2i}
1. {ww^Rw / w ∈ {0, 1}*}
