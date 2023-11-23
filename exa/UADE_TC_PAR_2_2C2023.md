# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Segundo Examen Parcial noviembre 2023

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
* Duración de examen: 2,5 horas.

---

1. [2 puntos] Diséñese GIC bien formada para L = {a^n b^m c^k / n, m, k >= 0; n = m v m <= k v m != k}

    ```grammar
    caso 1: n,m,k >= 0; n = m

    S -> AB
    A -> aAb | λ
    B -> cB | λ

    S -> λ | ab | aAb | aAbB | c | cB | abB
    A -> aAb | ab
    B -> c | cB

    caso 2: n,m,k >= 0; m <= k
    k = m + a  a>= 0
    L = {a^n b^m c^(m+a) / n,m,a >= 0}
    L = {a^n b^m c^m c^a / n,m,a >= 0}

    S -> CDE
    C -> aC | λ
    D -> bDc | λ
    E -> cE | λ

    S -> λ | a | aC | bc | bDc | c | CE | abCc | aCD | CDE | aCE | aE | DE | cE
    C -> aC | a
    D -> bDc | bc
    E -> cE | c

    caso 3: n,m,k >= 0; m != k
    caso 3.1 m < k
    k = m + a   a > 0
    L = {a^n b^m c^(m+a) / n,m >= 0; a > 0}
    L = {a^n b^m c^m c^a / n,m >= 0; a > 0}

    S -> FGH
    F -> aF | λ
    G -> bGc | λ
    H -> cH | c

    S -> c | aH | FH | cH | FGH | GH
    F -> aF | a
    G -> bGc | bc
    H -> cH | c

    caso 3.2 m > k
    m = k + a   a > 0
    L = {a^n b^(k+a) c^k / n,k >= 0; a > 0}
    L = {a^n b^a b^k c^k / n,k >= 0; a > 0}

    S -> IJK
    I -> aI | λ
    J -> bJ | b
    K -> bKc | λ

    S -> b | bJ | IJ | JK | IJK
    I -> aI | a
    J -> bJ | b
    K -> bKc | bc

    GIC:

    S -> λ | ab | aAb | aAbB | c | cB | abB | a | aC | bc | bDc | CE | abCc | aCD | CDE | aCE | aE | DE | cE | aH | FH | cH | FGH | GH | b | bJ | IJ | JK | IJK
    A -> aAb | ab
    B -> c | cB
    C -> aC | a
    D -> bDc | bc
    E -> cE | c
    F -> aF | a
    G -> bGc | bc
    H -> cH | c
    I -> aI | a
    J -> bJ | b
    K -> bKc | bc
    ```

1. [2 puntos] Diséñese AP por vaciado de pila (algoritmo) para L = {a^n b^m c^k / n, m , k >= 0; k + m = n v k + n = m}

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

1. [2 puntos] Determínese por comprensión simbólica el LIC generado por GIC <{a, b}, {S, U, T, V}, S, {S -> UT, U -> aa, U -> ab, U -> ba, U -> bb, T -> aTa, T -> bTb, T -> V, V -> aa, V -> ab, V -> ba, V -> bb}>. Normalícese a FNC.

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

1. [2 puntos] Muéstrese el contenido de la pila con mayor cantidad de símbolos durante el proceso de ASDP LL(1) para la cadena dabaaf. Considérese la GIC <{d, a, f, b, c}, {S, T, R}, S, {S -> daT, S -> Rf, T -> aS, T -> baT, T -> λ, R -> caTR, R -> λ}>

    |  | a | b | c | d | f | $ |
    | -- | -- | -- | -- | -- | -- | -- |
    | S | error | error | S -> Rf | S -> daT | S -> Rf | error |
    | T | T -> aS | T -> baT | T -> λ | error | T -> λ | T -> λ |
    | R | error | error | R -> caTR | error | R -> λ | error |

    | Pila | Entrada | Acción o Regla |
    | -- | -- | -- |
    | $S | dabaaf$ | S -> daT |
    | **$Tad** | dabaaf$ | emparejar(d) |
    | $Ta | abaaf$ | emparejar(a) |
    | $T | baaf$ | T -> baT |
    | **$Tab** | baaf$ | emparejar(b) |
    | $Ta | aaf$ | emparejar(a) |
    | $T | af$ | T -> aS |
    | $Sa | af$ | emparejar(a) |
    | $S | f$ | S -> Rf |
    | $fR | f$ | R -> λ |
    | $f | f$ | emparejar(f) |
    | $ | $ | accept |

1. [2 puntos] Diséñese MT unicinta sobre  Σ = {a, b} para la función suma f(n, m) = n + m, representando los enteros positivos mediante cadenas de a´s. Así el entero positivo n estaría representado por a^n. La función se implementa mediante la transformación de a^n b a^m en a^(n+m) b. Calcúlese la complejidad S(n) y T(n) de las cadenas: aba, aaba y abaa.

    ```plain
    Q = {q0, q1, q2, q3}
    q0 = q0
    F = {q3}
    Σ = {a, b}
    Γ = {a, b, B}
    b = B
    δ(q0, a) = (q0, a, R)
    δ(q0, b) = (q1, a, R)
    δ(q1, a) = (q1, a, R)
    δ(q1, B) = (q2, B, L)
    δ(q2, a) = (q3, b, S)
    ```

---
