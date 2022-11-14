# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Segundo Examen Parcial noviembre 2022

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

1. [2 puntos] - Diséñese una GIC para L = {a^n b^m / n <> m; n,m > 0}

    * **Solución:**
    * Podemos desglosar el LIC de la siguiente manera: L = {a^n b^m / n > m; n, m > 0} U {a^n b^m / n < m; n, m > 0}
    * S -> A | B
    * A -> aAb | aA | aab
    * B -> aBb | Bb | abb

1. [2 puntos] - Diseñese una GIC en FNC para L = {bcc, abccc, abbccccc, aabcccc, aabbcccccc, aaaaabccccccc, ...}

    * **Solución:**
    * L={a^n b^m c^(n+2m) / n >= 0, m >= 1}
    * GIC:
      * S -> aSc | A
      * A -> bAcc | bcc
    * GIC FNC:
      * S -> XB | YC | YD
      * A -> YC | YD
      * B -> SZ
      * C -> AD
      * D -> ZZ
      * X -> a
      * Y -> b
      * Z -> c

1. [2 puntos] - Hágase el reconocimiento de la cadena aaaabc, sobre un AP por vaciado de pila, mostrando en cada paso cómo queda la pila:

    S -> AB
    A -> aA | a
    B -> aBc | C
    C -> aCb | ab

    * **Solución:**

1. [2 puntos] - Diséñese una MT unicinta que reconozca el siguiente lenguaje con alfabeto {0, 1, B}. L = {números binarios pares con dos dígitos como mínimo}.

    * **Solución**

    | Q | 0 | 1 | B |
    | -- | -- | -- | -- |
    | >p | q0R | q1R | - |
    | q | r0R | r1R | - |
    | r | r0R | r1R | sBL |
    | s | t0S | - | - |
    | *t | - | - | - |

1. [2 puntos] - Determínese si las siguientes cadenas pertenecen o no al lenguaje aceptado por la MT, y defínase por comprensión simbólica el lenguaje aceptado por la misma:

    | Q | a | b | B |
    | -- | -- | -- | -- |
    | >1 | - | - | 2BR |
    | 2 | 3aR | 2bR | - |
    | 3 | 3aR | 4bR | - |
    | 4 | 5aR | 2bR | - |
    | *5 | - | - | - |

    1. ab
    1. bbaba
    1. bbab
    1. aaaba

    * **Solución:**

    * L = {waba / w pertenece {a, b}*}
    * L = {bbaba, aaaba, ...}

---
