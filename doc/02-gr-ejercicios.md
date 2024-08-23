# Gramática Regular (GR)

## Ejercicios Diseño de GR

1. L = {a^nb / 1 ≤ n ≤ 3}
1. L = {a^nb^n / 0 ≤ n ≤ 2}
1. L = {a^nb^n / 1 ≤ n ≤ 3}
1. L = {a^nb^t / 1 ≤ n, 1 ≤ t}
1. L = {(ab)^n(cde)^ta^z/ 1 ≤ n, 1 ≤ t, 0 ≤ z}
1. "Cualquier secuencia de uno o más dígitos decimales"
1. Números múltiplos de 3 de cualquier número de cifras. Σ = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
1. Cadenas que no contengan la secuencia "bc". Σ = {a, b, c, d}
1. "Todas las palabras formadas por una o más aes"
1. "Todos los números binarios que comienzan con una cantidad impar de 1s que es seguida por un 0 como último símbolo"

## Ejercicios w mas corta generada

1. Indique cuál es la mínima palabra del LR generado por la GR: {S -> aS|aT, T -> b}. Muestre cómo la genera

## Ejercicios Diseño de GQR

1. "Cualquier secuencia de uno o más dígitos decimales"
1. LR infinito cuyas palabras son secuencias de tres o más dígitos octales (en base 8)

## Ejercicios GR vs GQR

1. Escriba una GR equivalente a la GQR <{S -> L | SL | SD, L -> a|b|c|d, D -> 2|3|4|5|6}>. ¿Cuál es más sencilla de ser leída? Justifique su respuesta

## Ejercicios Derivación de w

1. Escriba la sucesión de producciones que aplicaría para generar la palabra aaab del LR definido en el punto anterior
1. Dada la GQR <{S -> L | SL | SD, L -> a|b|c|d, D -> 2|3|4|5|6}>. Determine si las siguientes palabras son válidas: ab23, 2a3b. Verifiquelo aplicando derivación a izquierda y derivación a derecha
1. Obtener las derivaciones de las palabras 002 y 0001 a partir de la siguiente gramática: G = <{0, 1, 2}, {A, B}, A, {(A::=0B), (A::=2), (B::=0A), (B::=1)}>. Describir el árbol de derivación y obtener el lenguaje que genera

## Ejercicios L(GR)

1. Obtener el LR que genera la siguiente G = <ΣT, ΣN, E, P>, donde ΣT = {0, 1}, ΣN = {S}, S es el axioma y P es: S -> 0S | 1S | λ
1. Para cada una de las siguientes GR determine el lenguaje que genera:
    1. S -> 1B    S  -> 1    A -> 1B    A -> 1    B -> 0A
    1. S -> aA    A -> bB    B -> aA    B -> aC   C -> aD    C -> a    D -> aD    D -> a
    1. S -> aA    A -> bB    B -> bB    B -> c    B -> cC    C -> cC   C -> c
    1. S -> aA    A -> aB    B -> aA    B -> b    B -> bC    C -> bC   C -> b

## Ejercicios GR equivalentes

1. Dada una GLD obtener una GLI equivalente:

        ```plain
        A -> 1B | λ
        B -> 0A | 0
        ```

1. Dada una GLI, obtener una GLD equivalente:

        ```plain
        S -> A1 | 1
        A -> S0
        ```
