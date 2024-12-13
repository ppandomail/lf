# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio 1er. Parcial diciembre 2024

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

1. Constrúyase AFDmin para (if | forfor)\*forif\*, con Σ = {for, if}. Partir de un AFNλ

    ```plain
    AFmin:
    Σ = {for, if}
    Q = {q0, q1, q2}
    q0 = q0
    F = {q1, q2}
    δ(q0, if) = q0
    δ(q0, for) = q1
    δ(q1, for) = q0
    δ(q1, if) = q2
    δ(q2, if) = q2
    ```

1. Diseñese usando operadores básicos ER de L2L1 U L2^c para L1 = {w / w con un número impar de símbolos} con Σ = {a, b} y L2 = {w / w no contiene la subpalabra yz} con Σ = {x, y, z}

    ```plain
    1.  (y*x | z)*y* (a | b)(aa | ab | ba | bb)* | (x | y | z)* yz (x | y | z)*
    1'. z*(y | xz*)* (a | b)(aa | ab | ba | bb)* | (x | y | z)* yz (x | y | z)*
    ```

1. Diseñese GR de L1 U L2 para L1 = {0^(2n+1) 11 2^(2m) / n, m >= 0} con Σ = {0, 1, 2} y L2 = {w01^n / w ϵ {1, 00}* ^ n >= 0} con Σ = {0, 1}

    ```grammar
    ER(L1): 0(00)* 11 (22)*
    GR(L1): 
    S -> 0A
    A -> 0B | 1C
    B -> 0A
    C -> 1 | 1D
    D -> 2E
    E -> 2 | 2D

    ER(L2): (00 | 1)* 0 1*
    GR(L2):
    S -> 0F | 1G | 0 | 0H
    F -> 0G
    G -> 0F | 0H | 1G | 0
    H -> 1H | 1
    ```

---
