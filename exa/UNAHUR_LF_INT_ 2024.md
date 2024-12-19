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

1. [2.5 puntos] - Constrúyase AFDmin para L = {w / w ∈ {a, b}* y contiene al menos dos aes y al menos dos bes}

1. [2.5 puntos] - Diséñese AP por vaciado de pila para L = {0^n 1^m 2^k / n, m, k >= 0; n = m v m <= k}

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

---
