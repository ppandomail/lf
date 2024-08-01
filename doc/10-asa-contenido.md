# Análisis Sintáctico Ascendente (ASA)

* Consiste en ir construyendo la inversa de la derivación por la derecha, a partir de una cadena de entrada, de manera que se parte de las hojas del árbol de análisis y se llega a la raíz
* Lo mismo que había GIC LL(1), las hay LR(1), pero estas últimas forman un conjunto más amplio
  * L: left to right: lee la entrada de izquierda a derecha
  * R: righmost derivation: produce una derivación más a la derecha
* Hay métodos de análisis para gramáticas lineales por la derecha del tipo LR(1), pero el más utilizado, sobre todo por su sencillez, es el método SLR
* Ventajas que hacen adecuado utilizar métodos ascendentes en vez de descendentes:
  * Reconocen muchos más lenguajes que las GIC LL y en general, reconocen casi todos los lenguajes más comúnmente usados en programación
  * Permiten localizar errores sintácticos muy precisamente
* Un inconveniente es que construir las tablas de análisis necesarias a mano es una tarea larga y compleja, por lo que se hace necesaria la utilización de herramientas de ayuda
* La mayoría de los métodos o algoritmos para aplicar sobre gramáticas LR emplean lo que se llama un algoritmo por desplazamiento y reducción. Se utiliza una pila y una tabla de análisis
* Recorren el árbol de derivación de abajo hacia arriba, por lo que se llaman también compiladores ascendentes. Cadena reconocida con el símbolo distinguido en el tope de la Pila
* Se analiza el tope de la Pila

## Algoritmo de desplazamiento y reducción

* Operaciones:
  * **Shift**: pasar un símbolo de la entrada al tope de la pila y se pide el siguiente símbolo al analizador léxico
  * **Reduce**: reemplazar en el tope de la pila el lado derecho de una regla gramatical por el lado izquierdo de la misma
  * **Accept**: se acepta la palabra
  * **Reject**: se rechaza la palabra

* Hay varios tipos de ASA:
  * Análisis con retroceso: ASA con retroceso
  * Análisis predictivo: ASAP
    * LR(0) o SLR
    * LR(1)
    * LALR

## ASA con retroceso

* Ejemplo 1:

```grammar
S -> c(S,S) | g(S) | 1 | 2
```

![ASA con retroceso](img/asa.png)

| Pila | Entrada | Transición |
| -- | -- | -- |
| λ | c(g(1),2) | δ(q0, λ, λ) = (q1, #) |
| # | c(g(1),2) | shift |
| #c | (g(1),2) | shift |
| #c( | g(1),2) | shift |
| #c(g | (1),2) | shift |
| #c(g( | 1),2) | shift |
| #c(g(1 | ),2) | reduce |
| #c(g(S | ),2) | shift |
| #c(g(S) | ,2) | reduce |
| $c(S | ,2) | shift |
| $c(S, | 2) | shift |
| $c(S,2 | ) | reduce |
| $c(S,S | ) | shift |
| $c(S,S) | λ | reduce |
| #S | λ | δ(q1, λ, S) = (q2, λ) |
| # | λ | δ(q2, λ, #) = (q3, λ) |
| λ | λ | accept |

* Ejemplo 2:

```grammar
S -> aA
A -> Sb | b
```

| Pila | Entrada | Transición |
| -- | -- | -- |
| # | aabb | shift |
| #a | abb | shift |
| #aa | bb | shift |
| #aab | b | reduce |
| #aaA | b | reduce |
| #aS | b | shift |
| #aSb | λ | reduce |
| #aA | λ | reduce |
| #S | λ | δ(q0, λ, S)=(q1, λ) |
| # | λ | accept |

* Ejemplo 3:

```grammar
S -> aSa | bSb | c
```

| Pila | Entrada | Transición |
| -- | -- | -- |
| # | abcba | shift |
| #a | bcba | shift |
| #ab | cba | shift |
| #abc | ba | reduce |
| #abS | ba | shift |
| #abSb | a | reduce |
| #aS | a | shift |
| #aSa | λ | reduce |
| #S | λ | δ(q0, λ, S)=(q1, λ) |
| # | λ | accept |

* Ejemplo 4:

```grammar
S   -> zMNz
M -> aMa | z
N  -> bNb | z
```

| Pila | Entrada | Transición |
| -- | -- | -- |
| # | zazabzbz | shift |
| #z | azabzbz | shift |
| #za | zabzbz | shift |
| #zaz | abzbz | reduce |
| #zaM | abzbz | shift |
| #zaMa | bzbz | reduce |
| #zM | bzbz | shift |
| #zMb | zbz | shift |
| #zMbz | bz | reduce |
| #zMbN | bz | shift |
| #zMbNb | z | reduce |
| #zMN | z | shift |
| #zMNz | λ | reduce |
| #S | λ | δ(q0, λ, S)=(q1, λ) |
| # | λ | accept |
