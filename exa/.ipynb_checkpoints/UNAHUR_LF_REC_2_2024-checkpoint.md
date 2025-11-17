# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio 2do. Parcial diciembre 2024

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
* Condiciones de aprobación: 60%
* Duración de examen: 1.5 horas.

---

1. Diséñese GIC bien formada para L = {a^n b^m c^k / n, m, k >= 0; n = m v m <= k}

    ```plain
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
    ```

1. Diséñese AP por vaciado de pila (algoritmo) para L = {0^i 1^j 2^k / i, j, k >= 0; k + j = i v k + i = j}

    ```plain
    caso 1: i,j,k >= 0; k + j = i
    L = {0^k 0^j 1^j 2^k / j,k >= 0}

    S -> λ | 0A2 | 0B1 | 02 | 01
    A -> 0A2 | 02 | 0B2
    B -> 0B1 | 01

    caso 2: i,j,k >= 0; k + i = j
    L = {0^i 1^i 1^k c^k / i,k >= 0}

    S -> λ | 0C1D | 01D | 01 | 12 | 0C1 | 1D2
    C -> 0C1 | 01
    D -> 1D2 | 12

    S -> λ | 0A2 | 0B1 | 02 | 01 | 0C1D | 01D | 12 | 0C1 | 1D2
    A -> 0A2 | 02 | 0B2
    B -> 0B1 | 01
    C -> 0C1 | 01
    D -> 1D2 | 12 

    FNG:
    S -> λ | 0AZ | 0BY | 0Z | 0Y | 0CYD | 0YD | 1Z | 0CY | 1DZ
    A -> 0AZ | 0Z | 0BZ
    B -> 0BY | 0Y
    C -> 0CY | 0Y
    D -> 1DZ | 1Z
    Y -> 1
    Z -> 2

    AP 
    Q = {q0}
    F = {}
    Σ = {0, 1, 2}
    q0 = q0
    p = S
    Γ = {A, Z, B, Y, C, D, S}
    δ(q0, λ, S) = (q0, λ)
    δ(q0, 0, S) = (q0, AZ)
    δ(q0, 0, S) = (q0, BY)
    ...
    ```

1. Determínese por comprensión simbólica L aceptado por MT sobre Σ = {if, for}

    |  Q  |  if   |  for   |  X   | Y    | B    |
    | --  |  --   |  --    |  --  | --   | --   |
    | >q0 | q1XR  | q2YR   | q6XR | q6YR | q6BR |
    | q1  | q1ifR | q1forR | q3XL | q3YL | q3BL |
    | q2  | q2ifR | q2forR | q4XL | q4YL | q4BL |
    | q3  | q5XL  |        | q6XR | q6YR |      |
    | q4  |       | q5YL   | q6XR | q6YR |      |
    | q5  | q5ifL | q5forL | q0XR | q0YR |      |
    | *q6 |       |        |      |      |      |

    ```plain
    L = {ww-1 / w pertenece {if,for}*}
    ```

---
