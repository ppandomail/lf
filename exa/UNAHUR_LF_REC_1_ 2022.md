# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Primer Examen Parcial noviembre 2022

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

1. [3.3 puntos] - Constrúyase un AFD que acepta todas y solo las palabras que tienen número par de letras y también un número par de dígitos. Considerar el alfabeto formado por los símbolos L y D.

    * **Solución:**

    | Q | L | D |
    | -- | -- | -- |
    | >*q0 | q1 | q2 |
    | q1 | q0 | q3 |
    | q2 | q3 | q0 |
    | q3 | q2 | q1 |

1. [3.3 puntos] - Diseñese la ER del siguiente lenguaje L = {wc^(3n) / w ∈ {unahur, uba} ^ la cantidad de unahur es par ^ n >= 0}

    * **Solución:**
    * (uba\*unahuruba\*unahuruba\*)\*(ccc)\*

1. [3.3 puntos] - Diseñese una GR para el lenguaje formado por palabras en {a, b} de longitud par terminadas en a.

    * **Solución:**
    * S -> aA | bA
    * A -> aB | bB | a
    * B -> aA | bA

---
