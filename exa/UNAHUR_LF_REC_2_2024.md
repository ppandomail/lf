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
* Duración de examen: 2 horas

---

1. Diséñese GIC bien formada para L = {a^n b^m c^k / n, m, k >= 0; n = m v m <= k}
1. Diséñese AP por vaciado de pila (algoritmo) para L = {0^i 1^j 2^k / i, j, k >= 0; k + j = i v k + i = j}
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

---
