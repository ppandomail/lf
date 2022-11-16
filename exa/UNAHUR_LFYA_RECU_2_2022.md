# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Segundo Examen Parcial noviembre 2022

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

1. [3.3 puntos] - Diséñese una GIC para L = {x^n y^m z^n / n > 0 ^ m es par} U {a^n b^m a^m b^n / n, m >= 0}

    * **Solución:**
    * S -> A | C | λ
    * A -> xAz | xBz | xz
    * B -> yyB | yy
    * C -> aCb | ab | D
    * D -> bDa | ba

1. [3.3 puntos] - Hágase el reconocimiento formal de la cadena unahurubaubaunahur, sobre un AP por vaciado de pila, mostrando en cada paso cómo queda la pila. L = {ww^R / w ∈ {unahur, uba}*}

    * **Solución:**
    * S -> unahurSA | ubaSB | λ
    * A -> unahur
    * B -> uba

1. [3.3 puntos] - Diséñese una MT unicinta que reconozca el siguiente lenguaje L = {w / w ∈ {x, y}* ^ |w|x = |w|y}

    * **Solución:**

    | Q | x | y | X | Y | B |
    | -- | -- | -- | -- | -- | -- |
    | q0 | q2XR| q1XR | | q0YR | q4BS |
    | q1 | q3YL | q1yR | | q1YR | |
    | q2 | q2xR| q3YL | | q2YR | |
    | q3 | q3xL | q3yL | q0XR | q3YL | |
    | *q4 | | | | | |

---
