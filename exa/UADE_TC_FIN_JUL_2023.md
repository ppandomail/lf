# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo / Ing. Fernando Basteiro

---

### Examen Final julio 2023

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
* Duración de examen: 1,5 horas.

---

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. Si L es un LR y L1 es un LIC entonces L ∩ L1 es regular.
    1. Si L es cualquier lenguaje con un alfabeto de un solo símbolo, entonces L\* es regular.
    1. {a^(2i) b^n / n, i >= 0 } = {{a} . {a}}\* . {b}\* lenguajes definidos sobre el Σ = {a, b, c}.
    1. {w / w ∈ {a, b, c}\*  y w comienza con a} = {{a} U {b} U {c}}\* lenguajes definidos sobre el Σ = {a, b, c}.

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. La ER (00)\*1\* representa a L = {0^(2i) 1^i para i >= 0} con Σ = {0, 1}.
    1. Si L1 y L2 son LR, también lo es el lenguaje L1 U L2.
    1. Cualquier LR cumple el Pumping Lemma, el cual se puede usar para probar que un lenguaje no es regular.
    1. Dado L = {0^i 1^i 0^j 1^j para 0 <= i <= 2, j = 3} con Σ = {0, 1}, el AF es el modelo abstracto de menor potencia que puede reconocerlo.

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. El complemento de L = {0^(2i) 1^(2j) para i, j >= 0} con Σ = {0, 1} es regular.
    1. Dados los LR L1 y L2, puedo construir un AF del lenguaje L1 U L2.
    1. Si un lenguaje es reconocido por un AF, siempre puedo construir un AP equivalente.  
    1. El AF sólo reconoce lenguajes finitos.

1. [1 punto] - Sea el AF1 = <{q0, q1}, {0, 1}, δ, q0 ,{q0}>, donde δ = {δ(q0,0)=q0, δ(q0,1)=q1, δ(q1,1)=q1, δ(q1,0)=q0} y AF2 = <{q0, q1, q2}, {0, 1}, δ, q0 ,{q0, q1}>, donde δ = {δ(q0,0)=q1, δ(q0,1)=q2, δ(q1,0)=q1, δ(q1,1)=q2, δ(q2,0)=q0, δ(q2,1)=q2}. Márquese si las siguientes afirmaciones son V o F:
    1. El AF1 es AFN.
    1. El AF2 reconoce palabras de longitud infinita.
    1. Los AF son equivalentes.
    1. Los AF reconocen el lenguaje λ | (0|1)\* 0

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F: La G = <{S, A}, {a,b}, S, P>, donde P = {S -> AA, A -> AAA, A -> a, A -> bA, A -> Ab}. Genera las palabras:
    1. bbabaaba
    1. bbaab
    1. ambas (a y b)
    1. ninguna de las anteriores

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F. L = {0^r 1^s 0^t  1^u r, s, t, u >= 0 tal que r + t = s + u}, con Σ = {0, 1}
    1. El lenguaje definido es de tipo 2 de la Clasificación de Chomsky.
    1. El autómata de menor potencia que reconoce las palabras del lenguaje es el AP.
    1. Las palabras del lenguaje pueden generarse con una GIC.
    1. La palabra mínima del lenguaje es λ.

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. La gramática con producciones:  S -> aS | aSbS  | c  es ambigua.
    1. El lenguaje: L = { x /  x ∈ {0, 1, 2} / x = 0^(2n) 2 o x = 0^(2m+1) 1, para n, m >= 0}, puede ser reconocido por un AP y por un AF.
    1. Dado el lenguaje: Palabras con alfabeto {0, 1} donde la cantidad de ceros es igual a la cantidad de unos, en cualquier orden. ¿Puedo diseñar una GIC para generar las palabras de este lenguaje?
    1. Puedo diseñar una GIC para el lenguaje complemento del punto anterior?

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F. El parser LR correspondiente a la GIC:  G = <{S, L, E},  {id, cte , :=}, S, {S -> LE, L -> L id:=, L -> id:=, E -> cte}>
    1. La palabra id:=id:=cte es aceptada por el parser LR.
    1. Si se ejecuta el parser LR para hacer el análisis sintáctico de una cadena, estando en el estado q1, si en el tope de la pila queda el símbolo distinguido, entonces la cadena corresponde al lenguaje.
    1. Puedo construir un parser LR para hacer el análisis sintáctico de una sentencia de un lenguaje de programación.
    1. El parser LR lee la cadena de entrada de izquierda a derecha y produce una derivación por izquierda.

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. Para cualquier lenguaje del Universo de los Lenguajes puedo construir una MT que acepte sus palabras.
    1. Dado el lenguaje L = {a^i b^j c^k con i, j, k >= 0,  i ≠ j + k}, con ∑= {a, b,c}. Sus palabras pueden ser aceptadas por una MT y por un AP.
    1. Una MT con varias cintas es más poderosa computacionalmente que una MT de una cinta.
    1. Las palabras del lenguaje L = {x^n y^t z^n con n >= 1, t = 3n} pueden ser reconocidas por un AP y por una MT.

1. [1 punto] - Dada la MT <{q0, q1, q2, q3, q4, q5, q6, q7}, {0, 1}, {0, 1, #}, q0, #, {q7}>

    | Q | 0 | 1 | # |
    | -- | -- | -- | -- |
    | q0 | (q1,0,S) | (q1, 1, S) | |
    | q1 | (q3,#,R) | (q2,#,R) | (q7,#,S) |
    | q2 | (q2,0,R) | (q2,1,R) | (q5,#,L) |
    | q3 | (q3,0,R) | (q3,1,R) | (q6,#,L) |
    | q4 | (q4,0,L) | (q4,1,L) | (q1,#,R) |
    | q5 | | (q4,#,L) | (q7,#,S) |
    | q6 | (q4,#,L) | | (q7,#,S) |
    | q7 | | | |

    Márquese las cadenas que acepta la MT:
    1. 010101
    1. 0001000
    1. 01011010
    1. 10001000
    1. 110011

```plain
1.1 F
1.2 V
1.3 V
1.4 F
2.1 F
2.2 V
2.3 V
2.4 V
3.1 V
3.2 V
3.3 V
3.4 F
4.1 F
4.2 F
4.3 V
4.4 V
5.1 V
5.2 V
5.3 V
5.4 F
6.1 V
6.2 V
6.3 V
6.4 V
7.1 V
7.2 V
7.3 V
7.4 V
8.1 V
8.2 V
8.3 V
8.4 F
9.1 V
9.2 V
9.3 F
9.4 F
10.1 F
10.2 V
10.3 V
10.4 F
10.5 V
```

---
