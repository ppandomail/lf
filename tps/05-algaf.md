# Algoritmos con Autómata Finito

## Ejercicios Algoritmo de Thompson: ER -> AFNλ

1. b | λ
1. b | c | a
1. bb
1. baa
1. b*
1. (ba)* | a
1. (a | b)*
1. ab\* | a\*bb | a+b
1. (a | ba)*
1. (a | ba)+
1. (0 | 1)\*000(0 | 1)\*
1. (((00)\*11) | 01)\*
1. (000)\*
1. (0 | 1)\*0 (0 | 1)\*1(0 | 1)\*0(0 | 1)\*
1. 010 | 101
1. (λ | 0)1
1. (0 | 10)(0 | 1)\*
1. 0(011)\* | 1
1. 0+ | (01)+
1. (0 | 1+)0+1+

## Ejercicios Clausura-λ(q)

1. AFN

  | Q | a | λ |
  | -- | -- | -- |
  | >0 | 1 | {2,3,6} |
  | 1  | - | 2 |
  | *2 | - | 3 |
  | 3  | - | 6 |
  | 4  | 5 | 5 |
  | *5 | - | - |
  | *6 | 6 | 1 |

1. AFN

  | Q | a | λ |
  | -- | -- | -- |
  | >0 | 1 | {3,6} |
  | 1  | - | 2 |
  | *2 | - | 4 |
  | 3  | - | 4 |
  | 4  | 5 | - |
  | *5 | - | - |
  | *6 | 6 | - |

## Ejercicios Hacia(Clausura-λ(q), ó)

1. Sea el conjunto M formado por los estados 1, 2 y 3. Suponer que estos estados tienen las siguientes transiciones: δ(1, a) = 1; δ(2, a) = 1; δ(3, b) = 2; δ(2, b) = 4. Obtenga: hacia(M, a), hacia(M, b), hacia(M, c)

## Ejercicios Algoritmo Clausura-λ: AFNλ/AFN -> AFD

1. Diseñe un AFN que tenga 4 transiciones-λ, 2 ciclos y 3 estados finales

1. AFN

    | Q | a | b |
    | -- | -- | -- |
    | >0 | {1,3} | 1 |
    | 1  | -     | {1,2} |
    | 2  | -     | {2,3} |
    | *3 | 3     | {1,2,3} |

1. AFN = <{a, b}, {p, q, r, s}, f, p, {s}>

    | Q | a | b | c |
    | -- | -- | -- | -- |
    | >p | {q,s} | p       | {q,r} |
    | q  | -     | {q,r}   | r |
    | r  | -     | {p,s}   | q |
    | *s | s     | {q,r,s} | - |

1. AFN = <{q0, q1}; {a, b}; δ(qo, a) = {q0, q1}; δ(qo, b) = {q1}; δ(q1, b) = {q0}; F = {q0}>
1. AFN = <{q0, q1, q2}; {a, b}; δ(qo, a) = {q2}; δ(qo, λ) = {q1}; δ(q1, a) = {q0} δ(q2, a) = {q1}; δ(q2, b) = {q1, q2}; F = {q1}>

## Ejercicios Algoritmo AF -> ER

1. AFD:

    | Q | a | b |
    | -- | -- | -- |
    | >0 | 1 | 6 |
    | 1  | 1 | 4 |
    | 2  | - | - |
    | *4 | - | 4 |
    | 5  | 2 | 2 |
    | *6 | - | 5 |

1. AFN:

    | Q | a | b |
    | -- | -- | -- |
    | >0 | {1,2} | {0,6} |
    | 1  | 1     | 4 |
    | 2  | -     | - |
    | *4 | -     | {4,5} |
    | 5  | 2     | 2 |
    | *6 | -     | 5 |

1. AFD:  

    | Q | a | b |
    | -- | -- | -- |
    | >p | s | s |
    | *s | s | s |

1. AFN:

    | Q | 0 | 1 |
    | -- | -- | -- |
    | >q0 | {q0,q1} | q0 |
    | q1  | q2      | q2 |
    | q2  | q3      | - |
    | *q3 | q3      | q3 |

1. AFD:

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q0 | q1 |
    | q1  | q2 | q0 |
    | *q2 | q1 | q2 |

1. AFD:

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q0 |
    | q1  | q2 | q1 |
    | *q2 | q2 | q1 |

1. AFD:

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q3 |
    | *q1 | q2 | q3 |
    | q2  | q1 | q1 |
    | q3  | q3 | q3 |

1. AFD = <{q0, q1}; {0, 1}; δ(qo, 0) = q0; δ(qo, 1) = q1; δ(q1, 0) = q1; δ(q1, 1) = q0; F = {q1}>

1. AFD = <{q0, q1, q2}; {0, 1}; δ(qo, 0) = q1; δ(qo, 1) = q1; δ(q1, 0) = q1; δ(q1, 1) = q2; δ(q2, 0) = q0; δ(q2, 1) = q1; F = {q0, q2}>

## Ejercicios Algoritmo de Clases: AFD -> AFDmin

1. AFD

    | Q | a | b |
    | -- | -- | -- |
    | >0 | 1 | 5 |
    | 1  | 5 | 2 |
    | *2 | 2 | 3 |
    | *3 | 4 | 2 |
    | *4 | 3 | 4 |
    | 5  | 5 | 5 |

1. AFD

    | Q | a | b |
    | -- | -- | -- |
    | >*0 | 1 | 2 |
    | *1  | 1 | 4 |
    | 2   | 3 | 2 |
    | *3  | 4 | 4 |
    | 4   | 4 | 4 |

1. a\*ba\* | a\*b\*aa

1. AFN

    | Q | a | b | c | λ |
    | -- | -- | -- | -- | -- |
    | >0 | 1 | 1 | -     | - |
    | 1  | {2,3} | -     | 3     | {4,5} |
    | 2  | 2     | -     | 4     | 5 |
    | *3 | -     | -     | {1,2} | 5 |
    | 4  | {4,5} | {0,2} | -     | - |
    | *5 | -     | {3,4} | -     | - |

1. AFN = <{a, b, c}, {p, q, r, s, t, u, v}, f, p, {v}>. Donde f = {f(q, b) = {r, s}, f(u, c) = {v}, f(r, λ) = q, f(s, a) = {t, p}, f(p, λ) = q, f(r, λ) = u, f(s, c) = {u}, f(p, λ) = t, f(t, λ) = q, f(t, b) = {v}, f(q, λ) = r, f(u, λ) = s, f(u, a) = {s, q}, f(q, λ) = s, f(v, λ) = r}

1. AFN = <{a, b, c}, {q0, q1, q2, q3, q4, q5}, f, p, {q2, q5}>. Donde f = {f(q0, a) = {q0, q3}, f(q0, b) = {q2}, f(q0, c) = {q5}, f(q1, a) = {q3}, f(q1, b) = {q2, q5}, f(q1, c) = {q2}, f(q2, a) = {q2}, f(q2, b) = {q1, q4}, f(q2, c) = {q4}, f(q3, a) = {q0}, f(q3, b) = {q5}, f(q3, c) = {q2, q5}, f(q4, c) = {q5}, f(q5, a) = {q2}, f(q5, b) = {q4}, f(q5, c) = {q1, q4}}

## Ejercicios Algoritmo GR -> AFD

1. GR

    ```grammar
    S -> bS | aA | λ
    A -> aA | bB | b
    B -> bS
    ```

1. GR

    ```grammar
    R0 -> bR1 | cR2 | a | b
    R1 -> aR1 | a
    R2 -> cR2 | a 
    ```

## Ejercicios Algoritmos intermedios ER -> AFDmin

1. (ab)\* | (a | c) | (a | b | c)
1. (ab | c)\* | (a | c)\* | a\*
1. (01\*0 | 11)\* | (00 | 1)\*
1. ab | 0\*(01\*0 | 11)\*
1. (aa | b)\*(c | d)(cd)\*
1. (abc)*
1. a+bc*  
1. a(b | λ)b+

## Ejercicios Algoritmos intermedios LR -> AFDmin

1. L = {w / w ∈ {a, b, c}* y en w las palabras deben cumplir que luego de una a siempre venga dos b, antes de una b no pueden venir una c, y la cantidad de a son pares}
1. L = {w / w ∈ {a, d}* y w la cantidad de d debe ser par y la de a impar, y w no puede comenzar con d ni finalizar con a}

## Ejercicios Algoritmos intermedios ER -> GR

1. aa\*bb\* | ab
1. (b | ab\*a)\*ab\*

## Ejercicios Algoritmos intermedios GR -> ER

1. GR:

    ```grammar
    S -> 1A | 1B
    A -> 0A | 0C | 1C | 1
    B -> 1A | 1C | 1
    C -> 1
    ```

1. GR:

    ```grammar
    S -> aA | λ
    A -> aA | aC | bB | aB
    B -> bB | bA | b
    C -> aC | bC 
    ```

1. GR:

    ```grammar
    S -> aA | cA | a | c
    A -> bS 
    ```

## Ejercicios Algoritmos intermedios GR -> AFDmin

1. GR:

    ```grammar
    S -> λ | bB | a | aA
    B -> b | bA
    A -> aA | bB | a | aC
    C -> c | cC | bB | aA | a
    ```

1. GR:

    ```grammar
    S -> aA | λ
    A -> aA | aC | bB | aB
    B -> bB | bA | b
    C -> aC | bC 
    ```

1. GR:

    ```grammar
    S -> aA | cA | a | c
    A -> bS 
    ```

1. GR:

    ```grammar
    A -> 0B | λ
    B -> 1C | 1
    C -> 0B
    ```

1. GR:

    ```grammar
    S -> bA | cB | a | b
    A -> aA | a
    B -> cB | a 
    ```

1. GR:

    ```grammar
    S -> T | R
    T -> aT | V
    V -> bV | b
    R -> cX | e
    X -> cX | cd 
    ```

1. GR:

    ```grammar
    S -> aT | V
    T -> aR | bR
    R -> aR | bR | V
    V -> cV | λ
    ```

## Ejercicios Lema Pumping

1. L1 = {a^(n+1)cb^n / n ≥ 0} sobre Σ = {a, b, c}
1. L2 = {da^(n+1)c^nb^n / n ≥ 1} sobre Σ = {a, b, c, d}
1. L3 = {0^n1^n2^n / n ≥ 0} sobre Σ = {0, 1, 2}
1. L4 = {a^nb^(n+1) / n ≥ 1} sobre Σ = {a, b}
1. L5 = {e^(n+1)cf^(n+2) / n ≥ 0} sobre Σ = {e, c, f}
