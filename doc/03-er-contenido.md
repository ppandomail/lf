# Lenguajes Regulares (LR)

## Definición de LR

* Es un tipo de lenguaje formal
* Son los más simples
* Técnicas de reconocimiento de patrones (manejada por el analizador léxico del compilador)
* Importancia en el diseño de los LENGUAJES DE PROGRAMACIÓN: los identificadores, las palabras reservadas, las constantes numéricas, los operadores y los caracteres de puntuación
* Un LENGUAJE es REGULAR si:
  * Si el lenguaje formal es FINITO
  * Si existe una GRAMÁTICA REGULAR que lo genere
  * Si se puede representar mediante una EXPRESIÓN REGULAR
  * Si puede ser reconocido por un AUTÓMATA FINITO
* Ejemplos:

| Lenguaje | ¿Es regular? |
| -- | -- |
| {a^b^n / 1 ≤ n ≤ 4} | SI |
| {a^n / n ≥ 1} | SI |
| {a^nb^n / n ≥ 1} | NO |
| {a^n / 1 ≤ n ≤ 1000} | SI |
| {a^nb^t / n ≥ 1, t ≥ 1} | SI |
| {(ab)^n (cde)^t a^z / n ≥ 1, t ≥ 1, z ≥ 1} | SI |
| {1^(2n+1) 0 / n ≥ 0} | SI |

## Expresiones Regulares (ER)

* Es la forma más precisa y útil de representar o describir a los LR
* Es un mecanismo alternativo al igual que las GR para definir los LR
* Es una cadena de texto que describe un patrón de búsqueda
* Forman un metalenguaje. Componentes:
  * Símbolos del alfabeto
  * Símbolo λ
  * Operadores:
    * Concatenación: .
    * Unión: |
    * Clausura: *
    * Paréntesis: ()
* Una ER sobre un Σ se define en forma inductiva como sigue:

| ER | Significado |
| -- | -- |
| Ø | Es una ER que denota al lenguaje vacío |
| λ | Es una ER que denota el lenguaje que contiene únicamente a la cadena vacía {λ} |
| V a ∈ Σ, a | Es una ER que denota el lenguaje que contiene únicamente la cadena a, {a} |
| r | Es una ER que denota el lenguaje L(r), entonces r es también una ER para el mismo lenguaje |
| r \| s | Es una ER que denota la unión de los lenguajes denotados por r y s; es decir, L(r) U L(s) |
| r.s | Es una ER que denota la concatenación de los lenguajes denotados por r y s; es decir, L(r).L(s) |
| r* | Es una ER que denota la clausura del lenguaje denotado por r; es decir, L(r)* |

### Precedencia de operadores

1. Operador de clausura (*)
1. Concatenación (.)
1. Unión (|)

### Ejemplos de ER

| ER | Describe el lenguaje ... |
| -- | -- |
| (aa)* | L = {(aa)^n / n ≥ 0} |
| aa* | L = {aa^n / n ≥ 0} |
| a*b | L = {a^n b / n ≥ 0} |
| 01* | L = {01^n / n ≥ 0} |
| (0 \| 1)* | L = {w / w ∈ {0, 1}*} |
| (0 \| 1)* 00 (0 \| 1)* | L = {v00w / v, w ∈ {0, 1}*} |
| (1 \| 10)* | L = {w / w ∈ {1, 10}*} |
| abbb\*c+ \| ab+c(cc)\* | L = {abbb^nc^m / n ≥ 0 ^ m ≥ 1} U {ab^nc(cc)^m / n ≥ 1 ^ m ≥ 0} |

### Lenguaje representado por una ER

* Cada ER ∂ define recursivamente un lenguaje L, utilizando las siguientes reglas de cálculo:
  * Si ∂ = Ø, entonces L(∂) = Ø
  * Si ∂ = λ, entonces L(∂) = {λ}
  * Si ∂ = a, a ∈ Σ, entonces L(∂) = {a}
  * Si ∂ y β son ER, entonces L(∂ | β) = L(∂) U L(β)
  * Si ∂ y β son ER, entonces L(∂.β) = L(∂) . L(β)
  * Si ∂ es ER, entonces L(∂*) = L(∂)*
  * Si ∂ es ER, entonces L((∂)) = L(∂)

* Ejemplo: Dadas las siguientes ER, sus Lenguajes Regulares serían:
  * 01*:  L(01*) = L(0) L(1*) = {0} L(1*) = {0} {λ, 1, 11, 111, …} = {0, 01, 011, 0111, ...}
  * (0 | 1)\*: L((0 | 1)\*) = (L(0 | 1))\* = ({0, 1})\* = {λ, 0, 1, 00, 01, 10, 11, ...}

### Propiedades de equivalencia

* Sean a,b,c ER sobre el alfabeto Σ

| Propiedad | Ejemplo |
| -- | -- |
| Asociatividad de la unión | a \| (b \| c) = (a \| b) \| c |
| Conmutatividad de la unión | a \| b = b \| a |
| Asociatividad de la concatenación | (ab)c = a(bc) |
| Distributividad de la concatenación respecto de la unión | a(b \| c) = ab \| ac|
| Elemento neutro de la concatenación | aλ = λa = a |
| Elemento neutro de la unión | a \| Ø = Ø \| a = a |

### ER equivalentes

* Dos ER son equivalentes si representan el mismo LR
* Ejemplo: a | b = b | a  ==> ambas representan al LR L = {a, b}

* Ejemplos:
  * λ* = λ
  * Ø a = a Ø = Ø
  * Ø* = λ
  * a\*a\* = a\*
  * aa\* = a\*a
  * (a\*)\* = a\*
  * a\* = λ | a | aa | ...| a^n | a^(n+1)a\*
  * a+ = aa\* = a\*a
  * a\* = λ | aa\*
  * a\* = (λ | a)^(n-1) | a^na\*
  * (a\* | b\*)\* = (a\*b\*)\* = (a | b)\*
  * (ab)\*a = a (ba)\*
  * (a\*b)\*a\* = (a | b)\*
  * (a\*b)\* = (a | b)\*b | λ

### ER no equivalentes

* Dos ER son diferentes si representan a diferentes LR
* Ejemplo:  a(a | b) <> (a | b)a

### Expresión Regular Universal (ERU)

* Es la ER que representa al Lenguaje Universal sobre un alfabeto dado
* Representa al LR que contiene la palabra vacía (λ) y todas las palabras que se pueden formar con los símbolos del alfabeto dado
* Ejemplo: Σ = {a, b}, la ERU es (a | b)*

### Operaciones sobre LR

| Operación | |
| -- | -- |
| Unión | Si L1 es representado por la ER a\*b y L2 es representado por la ER ba \| b\*, L1 U L2 es representado por la ER = (a\*b) \| (ba \| b\*) = a\*b \| ba \| b\* |
| Concatenación | Si L1 es representado por la ER a\*b y L2 es representado por la ER a \| b\*, el LR concatenación L1L2 es representado por la ER = a\*b(a \| b\*) |
| Clausura de Klenne | Si L es representado por la ER a\*b, L\* es representado por la ER = (a\*b)\* |
| Clausura positiva | Si L es representado por la ER a\*b, L+ es representado por la ER = (a\*b)+ |
| Complemento | Si L es representado por la ER a(a \| b)\*, L^c es representado por la ER = b(a \| b)\* \| λ |
| Intersección | Si L1 es representado por la ER a(a \| b)\* y L2 es representado por la ER (a \| b)\*b, L1 ∩ L2 es representado por la ER = a(a \| b)\*b |

### ER y Lenguajes de Programación

* Los componentes léxicos de un Lenguaje de Programación – identificadores, palabras reservadas, constantes, operadores – constituyen diferentes LR
* Ejemplos:
  * Identificadores: L(L | D)*
  * Constantes reales: D+.D*
  * Palabras reservadas: if | else | while
