# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Primer Examen Parcial octubre 2024

* ALUMNO:  
* DNI:

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

1. [2 puntos] Dada GR <{0, 1}, {A, B, C, X, D, E, F}, X, {B -> 1, D -> 0E, A -> 0B, F -> 0, X -> 0A, B -> 1C, C -> 0D, D -> 0, B -> 1B, F -> 0F, C -> 0, A -> 0A, E -> 0F}>, defínase por comprensión simbólica el lenguaje generado. Expresarlo como concatenación de lenguajes

	```plain
	L = {0^n 1^m / n >= 2, m >= 1} . {0^n / n >= 0, n != 3}
	```

1. [2 puntos] Dado L = {0^n 1 / n >= 0} U {1^m 0 / m >= 1}, diséñese el AFDmin (grafo) que reconoce las palabras del lenguaje con Σ = {0, 1}

	| Q | a | b |
	| -- | -- | -- |
	| >q0 | q1 | q2 |
	| q1  | q1 | q4 |
	| *q2 | q4 | q3 |
	| q3  | q4 | q3 |
	| *q4 | -  | -  |

1. [2 puntos] Dado L = {w / #0(w) y #1(w) son ambas pares} con Σ = {0, 1}, diséñese usando operadores básicos la ER que lo representa

	```plain
	(00 | 11 | (10 | 01) (00 | 11)* (01 | 10) )*
	```

1. [2 puntos] Dado L = {palabras con no más de tres ceros}, diseñese la GR que genera las palabras del lenguaje con Σ = {0, 1}. Sólo producciones. (Para facilitar el diseño/corrección usar los nombres de los símbolos no terminales en este orden: S, A, B, C ...)

	```plain
	1* | 1* 0 1* | 1* 0 1* 0 1* | 1* 0 1* 0 1* 0 1*

	S -> λ | 1S | 0 | 0A
	A -> 1A | 1 | 0 | 0B
	B -> 1B | 1 | 0 | 0C
	C -> 1C | 1
	```

1. [2 puntos] Dado L = {0^n 1^m / n+m es par}, diseñese la GR que genera las palabras del lenguaje con Σ = {0, 1}. Sólo producciones. (Para facilitar el diseño/corrección usar los nombres de los símbolos no terminales en este orden: S, A, B, C ...)

	```plain
	n m
	p p p
	i i p

	S -> λ | 0A | 1B | 0D
	A -> 0S
	B -> 1 | 1C
	C -> 1B
	D -> 0E | 1 | 1F
	E -> 0D
	F -> 1G
	G -> 1 | 1F

	S -> 0A | 0B | 1B |  λ 
	A -> 0S | 1 | 0
	B -> 1C | 1
	C -> 1B
	```

---
