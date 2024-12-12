# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Segundo Examen Parcial diciembre 2024

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
* Duración de examen: 3 horas.

---

1. [2 puntos] Diséñese una GIC para L = {be, bne, bse, bn_se, bn_ne, bn_n_s_ne, ...}

    ```grammar
    S -> bAe | be
    A -> n_A | s_A | n | s
    ```

1. [2 puntos] Diséñese una GIC FNC para L = {0^a 1^b 0^c / a, b, c > 0 and a + c = b}

    ```grammar
    L = {0^a 1^a 1^c 0^c / a, c > 0}

    S -> AB
    A -> 0A1 | 01
    B -> 1B0 | 10

    FNC: 
    S  -> AB
    A  -> CA' | CU
    A' -> AU
    B  -> UB' | UC
    B' -> BC
    C  -> 0
    U  -> 1 
    ```

1. [2 puntos] Diséñese AP (por vaciado) que reconozca aba, mostrando movimientos. GIC: S -> XbY  X -> aX | a   Y -> bY | a

    ```grammar
    FNG:
    S -> aXBY | aBY
    X -> aX | a
    Y -> bY | a
    B -> b

    AP:
    δ(q0, a, S) = (q0, XBY)
    δ(q0, a, S) = (q0, BY)
    δ(q0, a, X) = (q0, X)
    δ(q0, a, X) = (q0, λ)
    δ(q0, b, Y) = (q0, Y)
    δ(q0, a, Y) = (q0, λ)
    δ(q0, b, B) = (q0, λ)
    ```

1. [2 puntos] Diséñese una MT unicinta que reconozca L del punto 1

    | Q   |  b   |  n   |  s   |  -   |  e   |  B   |
    | --  |  --  |  --  |  --  |  --  |  --  |  --  |
    | >q0 | q1bR |      |      |      |      |      |
    | q1  |      | q3nR | q3sR |      | q2eR |      |
    | q2  |      |      |      |      |      | q4BS |
    | q3  |      |      |      | q5_R | q2eR |      |
    | *q4 |      |      |      |      |      |      |
    | q5  |      | q3nR | q3sR |      |      |      |

1. [2 puntos] Defínase por comprensión simbólica el L generado por \<prog> ::= \<head>\<body>   \<head> ::= a\<head>b | ab   \<body> ::= a\<body> | a

    ```plain
    L = {a^n b^n a^m / n, m > 0}
    ```

---
