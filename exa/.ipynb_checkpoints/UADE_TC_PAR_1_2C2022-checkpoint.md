# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo / Ing. Fernando Basteiro

---

### Primer Examen Parcial setiembre 2022

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
* Condiciones de aprobación: 60% coorecto.
* Duración de examen: 3 horas.

---

1. [2 puntos]: Diséñese una gramática regular que genere las palabras del lenguaje concatenación L1L2, donde L1 = {w / w es cualquier palabra, excepto 01, 101, 0100} y L2 = {w / w tiene cualquier longitud compuestas por las subcadenas "1", "01" y "001" y finalizadas con una subcadena de 0s con longitud menor a 3}. Ambos lenguajes con Σ = {0, 1}

    **Solución:**

    ```grammar
    L1 = Σ* - {01, 101, 0100}
    L2 = {01, 101, 0100, ...}
    L1L2 = Σ*

    S -> 0S | 1S | λ
    ```

1. [2 puntos]: Diseñese una gramática regular que genere las palabras del lenguaje L sobre el Σ = {a, b} cuyas palabras verifican las siguientes restricciones:
    * Si una palabra tiene menos de cinco b, entonces tiene un número par de b.
    * Si una palabra tiene cinco b o más, entonces contiene un número impar de b.
    * Cualquier palabra contiene al menos una b.

    **Solución:**

    ```grammar
    S -> aS | bA
    A -> aA | bB | b
    B -> aB | bC | a
    C -> aC | bD | b
    D -> aD | bE | a | b
    E -> aE | bF | a
    F -> aF | bE | b
    ```

1. [2 puntos]: Obténgase la ER que representa al lenguaje de todas las cadenas sobre {a, b, c} que no tienen ninguna subcadena ac.

    **Solución:**

    ```plain
    c*(a | bc*)*
    (a*b | c)* a*
    ```

1. [2 puntos]: Obténgase la ER que representa al lenguaje de las cadenas en {a, b}* que no empiezan por b y no contienen dos a’s consecutivas.

    **Solución:**

    ```plain
    ab(b | ab)* (a | λ) | a | λ
    a(b | ba)* | λ
    ```

1. [2 puntos]: Diséñese el AFD mínimo (grafo) que reconoce el lenguaje en el alfabeto {a, b} en que las palabras son de longitud par y además contienen un número par de a’s.

    **Solución:**

    * L1 ∩ L2 = (L1^c U L2^c)^c

    | Q | a | b |
    | -- | -- | -- |
    | >*q0 | q1 | q2 |
    | q1 | q0 | q3 |
    | q2 | q3 | q0 |
    | q3 | q2 | q1 |

---
