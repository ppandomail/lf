# Análisis Sintáctico Ascendente (ASA)

## Ejercicios ASA con retroceso

1. Cadena: aaabddccd

    ```grammar
    S -> aST | b
    T -> cT | d
    ```

1. Cadena: aacbb

    ```grammar
    S -> aaRbb | ab
    R -> c
    ```

1. Cadena: zxzxyzyz

    ```grammar
    S -> zABz
    A -> xAx | z
    B -> yBy | z
    ```

1. Cadena: iiaea

    ```grammar
    S -> iSeS | iS | a
    ```

1. Cadena: 0101011

    ```grammar
    S -> 0A1 | 1A0 | 1
    A -> 0S0 | 1A1 | 0
    ```

1. Cadena: 011110

    ```gramma
    S -> 0A0
    A -> 1A | 1
    ```

1. Cadena: idbeginotroendend

    ```grammar
    S -> id X | id Y end
    X -> otro | λ
    Y -> begin X end | λ 
    ```

1. Cadena: var id , id : int ;

    ```grammar
    D -> var V : T ;
    V -> id , V | id
    T -> int | bool
    ```
