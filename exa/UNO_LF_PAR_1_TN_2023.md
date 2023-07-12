# UNIVERSIDAD NACIONAL DEL OESTE

## ESCUELA DE INFORMÁTICA

## LENGUAJES FORMALES

### Profesor: Mag. Ing. Pablo Pandolfo / Sr. Pablo Rechimon

---

### Primer Parcial

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

1. Dados los lenguajes L1 = {x= 1^i 0^i 0^i 1^i para 1 <= i <= 3} con Σ = {0,1} y L2 ={x son las palabras cuya longitud es exactamente 3} con Σ = {a,b}, diséñese:
    1. ER de L1^-1 . L2
    1. ER de L1  U  L2

1. Dada la ER: (0 | 10 | 11).( 00 | 01 | 10 | 11 )*
    1. Diséñese el AF que reconoce las palabras del lenguaje representado por la ER, cuyo Σ = {0,1}
    1. ¿El AF que definió es AFD? Explique por qué.

1. Sea el lenguaje L = {x / x= e^(2n+1) ff g^(2m), para n, m >= 0}, con ∑ = {e, f, g}
    1. Diséñese la GR del lenguaje dado.
    1. Indíquese la palabra mínima del lenguaje.

1. Dada la siguiente GR =<{a,b}, {S, A, B}, S, {S -> bB, S -> b, A -> bB, A -> b, B -> aA}
    1. Genérese el árbol de derivación de la palabra x = bababaa y verifíquese si la misma pertenece o no al lenguaje.
    1. Escríbase la palabra más corta, y una palabra de al menos 9 símbolos que pertenezca al lenguaje y compruebe ambas por derivación horizontal o árbol de derivación.

1. Márquese si las siguientes afirmaciones son verdaderas o falsas:
    1. (00\* 11\*)\* = λ | 0 (0 | 1)\* 1
    1. (aa\* bb\*)\* = λ
    1. (aa\* bb\*)\* = λ | (aa)\* (bb)\*
    1. (00\* 11\*)\* = (0011)\*

1. Márquese si las siguientes afirmaciones son Verdaderas o Falsas:
    1. El AF= <{q0, q1, q2, q3}, {0,1}, q0, {q3}, {δ(q0,0)=q0 , δ(q2,0)=q3, δ(q0,1)=q1, δ(q2,1)=q3, δ(q1,0)=q1, δ(q3,0)=q3, δ(q1,0)=q2, δ(q3,1)=q3}> es AFN.
    1. Dado el lenguaje L = {x / x ϵ {a, b}* y x = a^n  b^(n+1) para 2 => n >= 1}, el AF es el modelo abstracto que reconoce las palabras de dicho lenguaje.
    1. Dado L = { {{public static integer main()}}, {{{public static integer main()}}}, public static integer main() }, es posible construir un AF para el lenguaje.
    1. El siguiente AF reconoce el lenguaje: L={a^2i para i >= 1}, AF = <{a}, {0, 1}, 0, {0}, {δ(0,a)=1, δ(1,a)=0}>

1. Márquese si las siguientes afirmaciones son verdaderas o falsas:
    1. La ER (aaaa)\*b\* corresponde al lenguaje L = {x / x = a^(3i+1) b^i para i >= 0} con Σ = {a, b}.
    1. La palabra 000 se puede generar con la ER: 0\*1\* y no con la ER: 01\* | 10\* |  (01)\* | 00\*
    1. Si L es un LR, también es LR el lenguaje que se obtiene al escribir en forma inversa las palabras de L.
    1. λ es la palabra mínima que puede generarse con la ER: a\*(ab)+a\*

1. Sea el AF = <{p, q, r, s, t, u}, {a, b}, p, {q, r}, {δ(p,a)=q, δ(r,a)=q, δ(p,b)=p, δ(r,b)=t, δ(q,a)=r, δ(s,a)=t, δ(q,b)=s, δ(s,b)=u, δ(t,a)=s, δ(u,a)=q, δ(t,b)=u, δ(u,b)=u}>. Márquese si las siguientes afirmaciones son Verdaderas o Falsas:
    1. El AF es AFN.
    1. La palabra abbbaba es reconocida por el AF.
    1. El AF reconoce cadenas de longitud infinita.
    1. El AF reconoce la cadena vacía.

---
