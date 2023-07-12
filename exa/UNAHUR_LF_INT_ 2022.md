# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Examen Integrador diciembre 2022

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

1. [1 punto] - Decídase si dado Σ = {a,b} vale : (responder V o F):
    1. λ ∈ Σ
    1. λ ⊆ Σ
    1. λ ∈ Σ+
    1. Σ^0 = {λ}

    **Solución:**
    * F F F V

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. La ER (aaa)\*b\* representa a L={w / w = a^(3i) b^i para i>=0} con Σ={a,b}.
    1. Si L es un LR, también es regular el lenguaje que se obtiene al escribir en forma inversa las palabras de L.
    1. ¿Es siempre regular la unión de una colección de LR?
    1. Dado el L={w / w = 0^i 1^i 0^j 1^j para 0<=i<=2, j=3} con Σ={0,1}, el AF es el modelo abstracto de menor potencia que puede reconocerlo.

    **Solución:**
    * F V V V

1. [1 punto] - Sea el AF = <{p,q,r,s,t,u},{a,b},δ,p,{q,r}>, donde δ={δ(p,a)=q, δ(r,a)=q, δ(p,b)=p, δ(r,b)=t, δ(q,a)=r, δ(s,a)=t, δ(q,b)=s, δ(s,b)=u, δ(t,a)=s, δ(u,a)=q, δ(t,b)=u, δ(u,b)=u}. Márquese si las siguientes afirmaciones son V o F:
    1. El AF es no determinístico.
    1. La palabra bbabbaaa es reconocida por el AF.
    1. El AF reconoce palabras de longitud infinita.
    1. El AF reconoce la palabra vacía.

    **Solución:**
    * F V F F

1. [1 punto] - Considérese las ER: r = 0\* | 1\* y s = 01\* | 10\* | 1\*0 | (0\*1)\*
    1. La palabra 010101 corresponde al lenguaje definido por r y no por s.
    1. La palabra 11111 corresponde a los lenguajes definidos por r y s.
    1. Las palabras 0000 y 01111 no pertenecen al lenguaje definido por r.
    1. La palabra λ pertenece a los lenguajes definidos por r y s.

    **Solución:**
    * F V F V

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. La intersección de dos LIC da siempre como resultado un LR.
    1. Dado el L={a^i b^j e^k / i, j, k>=0 tal que i=j o i=k}, sus palabras pueden generarse con una GIC de la Clasificación de Chomsky.
    1. Existe algún AP capaz de reconocer el lenguaje {λ}.
    1. El L={w / w ∈ {0,1,2} / w = 0^(2n) 2 o w = 0^(2m+1) 1, para n,m>=0}, puede ser reconocido por un AP y por un AF.

    **Solución:**
    * F V V V

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. La palabra cbbc es reconocida por el AP de análisis sintáctico LR: AP=<{q0,q1,q2,q3},{c,b},{#,S,c,b,A},q0,#,{q3},δ>. Donde δ(q0,λ,λ)=(q1,#), δ(q1,c,λ)=(q1,c), δ(q1,b,λ)=(q1,b), δ(q1,λ,b)=(q1,A), δ(q1,λ,Ab)=(q1,A), δ(q1,λ,cAc)=(q1,S), δ(q1,S,λ)=(q2,λ), δ(q2,λ,#)=(q3,λ)
    1. La palabra λ es reconocida por el AP del punto a.
    1. El lenguaje que reconoce el AP del punto a es L={c^n b^m c^n, con n>=1 y m>=1} con Σ={c,b}
    1. El lenguaje que reconoce el AP del punto a es tipo 3 de la Clasificación de Chomsky.

    **Solución:**
    * V F V F

1. [1 punto] - Márquese si las siguientes afirmaciones son V o F:
    1. Para cualquier lenguaje del Universo de los Lenguajes puedo construir una MT que acepte sus palabras.
    1. Una MT puede desplazar su cabezal varias celdas a la vez después de leer un símbolo en una celda de la cinta.
    1. Una MT con varias cintas es más poderosa computacionalmente que una MT de una cinta.
    1. Las palabras del lenguaje L={x^n y^t z^n com n>=1, t=3n} pueden ser reconocidas por un AP y por una MT.

    **Solución:**
    * F F F F

1. [1 punto] - Dada la MT <{q0,q1,q2,q3,q4,q5,q6,q7},{0,1},{0,1,#},q0,#,{q7}>

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

    **Solución:**
    * 2 3 5

1. [1 punto] - Defínase por comprensión un lenguaje con Σ={0,1} que no sea {λ} ni {0,1}* y satisfaga L ⊆ Σ\*. Diséñese la ER de L y L\*

    **Solución:**
    * Ejemplo: L = {0w1 / w ∈ {0,1}*}
    * ER de L: 0(0|1)*1
    * ER de L*: (0(0|1)\*1)\*

1. [1 punto] - Diséñese una GIC (en BNF) que genere la siguiente sentencia **printf(%f,%f,...,%f, var,var,...,var)**, con el siguiente formato: La palabra reservada printf y entre paréntesis una lista de formatos %f separados por coma seguida de una lista de variables var también separadas por coma. Debe haber la misma cantidad de formatos que de variables y al menos un formato y una variable. Son terminales la palabra printf, paréntesis, comas, %f y var.

    **Solución:**

    ```grammar
    <S> ::= printf(<L>)
    <L> ::= %f,<L>,var | %f,var
    ```

---
