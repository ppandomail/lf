# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Segundo Examen Parcial noviembre 2021

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

1. [2 puntos] - Diséñese una GIC para el siguiente lenguaje formal, con alfabeto {a, b, c, e}:   L= { a^n b^(n+2) c^m e^k  b^(m+1) / n, m >= 1, k >= 0}

1. [2 puntos] - Escríbase las reglas de una GIC en formato BNF para describir la sintaxis de la siguiente función. Considerar las constantes y los identificadores como símbolos terminales (CTE y ID respectivamente). Todos los símbolos unarios son parte del lenguaje al que pertenece la sentencia (ej. paréntesis, corchetes, símbolos aritméticos, coma). Un cierto lenguaje de programación utiliza la función Qequal: Esta función del lenguaje tomará como entrada un identificador pivot y una lista. Devolverá la cantidad de elementos iguales al pivot que se encuentran en la lista. La lista estará conformada por expresiones aritméticas separadas por coma (,) y delimitadas por corchetes. La lista puede ser vacía. Formato de la función: Qequal(identificador, [expresion1, expresion2, … , expresionN]). Ejemplos:
    * Qequal (ID, [ID\*CTE, CTE,  CTE\*ID/ID])
    * Qequal (ID, [])

1. [2 puntos] - Hágase el análisis sintáctico de la cadena dist(id id $ $ cte cte), mostrando en cada paso cómo queda la pila, al ejecutar el Parser LL con retroceso sobre la GIC= <{S, A},  {dist, id, cte, (, ), $}, S, P}, donde S es el axioma, las producciones P:

    S -> dist ( A )
    A -> id A cte
    A -> id $ $ cte

1. [2 puntos] - Diséñese una MT unicinta que reconozca el siguiente lenguaje con alfabeto {0, 1, b}
L = {números binarios en Lenguaje C} La estructura de los números binarios en lenguaje C es: 0b y a continuación al menos un dígito binario. Ejemplos: 0b1, 0b0011010, 0b111001, 0b0.

1. [2 puntos] - Determínese si las siguientes cadenas pertenecen o no al lenguaje aceptado por la MT, y defínase por comprensión simbólica el lenguaje aceptado por la misma: MT=< {q0, q1, q2, q3, q4, q5, q6}, {x, y, z, #}, {x, y, z, #, @}, δ, q0, @, {q6}>
    * δ(q0, (x,@))=(q1, (x,z), (R,R))
    * δ(q1, (x,@))=(q1, (x,z), (R,R))
    * δ(q1, (#,@))=(q2, (#,@), (R,S))
    * δ(q2, (y,@))=(q3, (y,z), (R,R))
    * δ(q3, (y,@))=(q3, (y,z), (R,R))
    * δ(q3, (#,@))=(q4, (#,@), (R,L))
    * δ(q4, (z,z))=(q5, (z,z), (R,L))
    * δ(q5, (z,z))=(q5, (z,z), (R,L))
    * δ(q5, (@,@))=(q6, (@,@), (S,S))

    1. xxx#y#zzzz
    1. xxx#zzz
    1. xxxx#yyyy#zzzz
    1. xxxx#yy#zzzzzz

---
