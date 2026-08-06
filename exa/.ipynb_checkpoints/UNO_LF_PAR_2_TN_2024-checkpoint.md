# UNIVERSIDAD NACIONAL DEL OESTE

## ESCUELA DE INFORMÁTICA

## LENGUAJES FORMALES

### Profesor: Mag. Ing. Pablo Pandolfo / Sr. Pablo Rechimon

---

### Segundo Parcial 2024

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
* Duración de examen: 2,5 horas.

---

Parte Práctica

---

1. Diséñese una GIC en formato BNF para una declaración de variables múltiple como la siguiente: [Lista de variables : Lista de Tipos]
    * Lista de variables es una lista de variables: id1, id2, id3, ..., idN
    * Lista de Tipos es una lista de tipos: tipo1, tipo2, tipo3, ..., tipoN
    * Lista de variables debe tener la misma cantidad que la lista de tipos. Ambas listas no pueden ser vacías.
    * Variable: es el símbolo terminal id.
    * Tipos: son los símbolos terminales Integer, Real, String.

1. Diséñese una GIC para generar las palabras del lenguaje, con alfabeto {a, b, c, x, y, z}: L = { x/x = a^k a b a b^p c b^(2p + 1) x^q y^r z^(q + r) donde k, p, q, r ≥ 0 }
    1. ¿Cuál es la palabra mínima o más corta?
    1. Construir el árbol de derivación de una cadena válida de al menos 7 símbolos terminales.

1. Muéstrese el contenido de la pila con mayor cantidad de símbolos durante el proceso de análisis sintáctico descendente para la cadena dabaaf. Considérese la GIC = <{d, a, f, b, c}, {S, T, R}, S, {S -> daT, S -> f, T -> aS, T -> baT, R -> caTR}>

1. Dada la MT = <{q0, q1, q2, q3, q4, q5, q6}, {a, b}, {a, b, B}, δ, q0, B, {q6}>, donde:

    | Q   | a    | b    | B    |
    | --  | --   | --   | --   |
    | >q0 | q1BR | q2BR | q6BR |
    | q1  | q1aR | q1bR | q4BL |
    | q2  | q2aR | q2bR | q3BL |
    | q3  |      | q5BL | q6BR |
    | q4  | q5BL |      | q6BR |
    | q5  | q5aL | q5bL | q0BR |
    | *q6 |      |      |      |

    1. Determínese si las siguientes cadenas pertenecen o no al lenguaje aceptado por la MT:
        * bababa
        * a
        * abbba
        * bbbbaa
    1. Determínese qué lenguaje reconoce la MT.
    1. ¿Existe algún otro autómata que pueda reconocer el L(MT)? Justificar.

---

Parte Teórica

---

1. Resolver según se indica en cada caso:
    1. Se tiene la siguiente afirmación "La unión de un LIC y un LR da como resultado un LR". ¿Es cierta esta afirmación?  Si la respuesta es afirmativa, justifique. Si la respuesta es negativa, de un contraejemplo.
    2. Se tiene 2 GIC, G1 y G2 que generan los lenguajes L1 y L2 respectivamente. ¿Cómo se diseñaría una G3 que genere la intersección de L1 y L2? Ejemplifique.
    3. Para cada nivel de la Clasificación de Chomsky, proporcione un ejemplo de un lenguaje que exista en ese nivel pero no en el inmediato inferior (excluya tipo 1).
    4. La siguiente gramática:

        ```grammar
        →S → DLL | 0 | λ
            D → 0D | 0
            L → 1L | 1
        
        Genera un lenguaje que puede ser reconocido por (marque la/s respuestas correctas):
        a. AF    b. AP  c. MT  d. Ninguno  e. Todos
        ```

2. Marcar si las siguientes afirmaciones son Verdaderas o Falsas:
    1. Una GIC puede generar sólo algunos de los lenguajes reconocidos por un AF.
    2. La GIC = <{S}, {i, c, t, e, s}, S, P> con producciones P: S → ictS,  S → ictSeS, S → s  es ambigua.
    3. Dado L = { a^i b^j c^i con 1<= i,j,k <= 1000, donde i ≠ j + k}, con ∑= {a, b, c}, sus cadenas pueden ser aceptadas sólo por un AP.
    4. La GIC = <{S, A}, {a, b}, S, P>, donde P: S → AAA, A → AAA | a | bA | Ab Genera las cadenas bbabaab y abababba.

3. Marcar si las siguientes afirmaciones son Verdaderas o Falsas:
    1. La sintaxis de un lenguaje de programación está basada en una gramática tipo 2 de la Clasificación de Chomsky.
    2. Un analizador sintáctico o parser está basado en una MT.
    3. El compilador LR es un analizador sintáctico que lee la cadena de entrada de izquierda a derecha.
    4. El Lema del Bombeo para LIC sirve para demostrar que un lenguaje es LIC.

4. Marcar si las siguientes afirmaciones son Verdaderas o Falsas:
    1. Para cualquier lenguaje del Universo de los Lenguajes puedo construir una MT que acepte sus cadenas.
    2. Una MT puede no desplazar su cabezal después de leer un símbolo en una celda de la cinta.
    3. El lenguaje L = {x / x ∈ {a, b, c, d}*   y  x = a^n b^p c^k d^p para n, k ≥ 1 y p = 3n} puede ser reconocido  por un  AP y por una MT.
    4. Si un lenguaje es reconocido por una MTND, no puedo construir una MTD que reconozca el mismo lenguaje.

---
