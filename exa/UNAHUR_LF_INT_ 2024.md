# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Examen Integrador diciembre 2024

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
* Duración de examen: 2 horas.

---

1. [2.5 puntos] - Diseñese ER para L1 U L2 U L3 con Σ = {0, 1}
    * L1 = {w con un número par de ceros}
    * L2 = {w que tienen a 000 o a 101 como subcadena}
    * L3 = {w que empiezan por 000 y después no aparece mas esta cadena}

    ```plain
    1* (01*01*)* | (0|1)* (000|101) (0|1)* | 000 (1|10|100)*
    ```

1. [2.5 puntos] - Constrúyase AFDmin para L = {w / w ∈ {a, b}* y contiene al menos dos aes y al menos dos bes}

    | Q  | a  | b  |
    | -- | -- | -- |
    |>q0 | q3 | q1 |
    | q1 | q4 | q2 |
    | q2 | q5 | q2 |
    | q3 | q6 | q4 |
    | q4 | q7 | q5 |
    | q5 | q8 | q5 |
    | q6 | q6 | q7 |
    | q7 | q7 | q8 |
    |*q8 | q8 | q8 |

1. [2.5 puntos] - Diséñese AP por vaciado de pila para L = {0^n 1^m 2^k / n, m, k >= 0; n = m v m <= k}

    ```grammar
    caso 1: n,m,k >= 0; n = m

    S -> AB
    A -> 0A1 | λ
    B -> 2B | λ

    S -> λ | 01 | 0A1 | 0A1B | 2 | 2B | 01B
    A -> 0A1 | 01
    B -> 2 | 2B

    caso 2: n,m,k >= 0; m <= k
    k = m + a  a>= 0
    L = {0^n 1^m 2^(m+a) / n,m,a >= 0}
    L = {0^n 1^m 2^m 2^a / n,m,a >= 0}

    S -> CDE
    C -> 0C | λ
    D -> 1D2 | λ
    E -> 2E | λ

    S -> λ | 0 | 0C | 12 | 1D2 | 2 | CE | 01C2 | 0CD | CDE | 0CE | 0E | DE | 2E
    C -> 0C | 0
    D -> 1D2 | 12
    E -> 2E | 2

    GIC en FNG:
    1. Elimino producciones repetidas en S
    2. Elimino producciones símbolo E y producciones, ya que es eqquivalente a B. Actualizo referencias
    3. Subo producciones a S, cuando la parte derecha empieza con no terminal
    4. Reemplazo 1 por O, 2 por T 

    S -> λ | 0O | 0AO | 0AOB | 2 | 2B | 0OB | 0 | 0C | 1T | 1DT | 0CB | 0OCT | 0CD | 0CDB | 0CB | 0B | 1DTB | 1TB | 0DB
    A -> 0AO | 0O
    B -> 2 | 2B
    C -> 0C | 0
    D -> 1DT | 1T
    O -> 1
    T -> 2
    
    AP:
    Q = {q0}
    F = {}
    Σ = {0, 1, 2}
    q0 = q0
    p = S
    Γ = {S, A, B, C, D, O, T}
    δ(q0, λ, S) = (q0, λ)
    δ(q0, 0, S) = (q0, O)
    δ(q0, 0, S) = (q0, AO)
    ...
    ```

1. [2.5 puntos] - Determínese por comprensión simbólica L aceptado por MT sobre Σ = {begin, end}

    |  Q  | begin    |  end   |  X   | Y    | B    |
    | --  |  --      |  --    |  --  | --   | --   |
    | >q0 | q1XR     | q2YR   | q6XR | q6YR | q6BR |
    | q1  | q1beginR | q1endR | q3XL | q3YL | q3BL |
    | q2  | q2beginR | q2endR | q4XL | q4YL | q4BL |
    | q3  | q5XL     |        | q6XR | q6YR |      |
    | q4  |          | q5YL   | q6XR | q6YR |      |
    | q5  | q5beginL | q5endL | q0XR | q0YR |      |
    | *q6 |          |        |      |      |      |

    ```plain
    L = {ww-1 / w pertenece {begin,end}*}
    ```

---
