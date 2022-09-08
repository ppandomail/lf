# Lenguajes Regulares (LR)

## Definición de LR

* Es un tipo de lenguaje formal.
* Son los más simples.
* Técnicas de reconocimiento de patrones (manejada por el analizador léxico del compilador).
* Importancia en el diseño de los LENGUAJES DE PROGRAMACIÓN: los identificadores, las palabras reservadas, las constantes numéricas, los operadores y los caracteres de puntuación.
* Un LENGUAJE es REGULAR si:
  * Si el lenguaje formal es FINITO.
  * Si existe una GRAMÁTICA REGULAR que lo genere.
  * Si se puede representar mediante una EXPRESIÓN REGULAR.
  * Si puede ser reconocido por un AUTÓMATA FINITO.  
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

* Es la forma más precisa y útil de representar o describir a los LR.
* Es un mecanismo alternativo al igual que las GR para definir los LR.
* Es una cadena de texto que describe un patrón de búsqueda.
* Forman un metalenguaje. Componentes:
  * Símbolos del alfabeto.
  * Símbolo λ.
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

* Dos ER son equivalentes si representan el mismo LR.
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

* Dos ER son diferentes si representan a diferentes LR.
* Ejemplo:  a(a | b) <> (a | b)a

### Expresión Regular Universal (ERU)

* Es la ER que representa al Lenguaje Universal sobre un alfabeto dado.
* Representa al LR que contiene la palabra vacía (λ) y todas las palabras que se pueden formar con los símbolos del alfabeto dado.
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

* Los componentes léxicos de un Lenguaje de Programación – identificadores, palabras reservadas, constantes, operadores – constituyen diferentes LR.
* Ejemplos:
  * Identificadores: L(L | D)*
  * Constantes reales: D+.D*
  * Palabras reservadas: if | else | while

## Ejercicios conceptuales

1. Describa dos casos en los que la concatenación de dos ER si puede ser conmutativa.
1. Describa, mediante una frase sin ambigüedades, el LR representado por la ER a(b|a)b.
1. ¿La cadena a^24b^24a^24 es una palabra de LR representado por la ER (aba)*? Justifique su respuesta.
1. Dados los LR infinitos representados por las ERs a\* y aa\* respectivamente. ¿Cuál tiene mayor cantidad de palabras? Justifique su respuesta.
1. Justifique la afirmación: la ER b\*ab\*ab\* representa al lenguaje "Todas las palabras sobre el alfabeto {a, b} con exactamente dos aes". Algunas palabras de este lenguaje son: aa, babba, bbaabbb, aba.
1. Si el Σ fuera "todos los dígitos decimales", ¿cuál sería la ERU sobre ese alfabeto?

## Ejercicios w del L(ER)

1. a\* | b^3. Escriba las cinco palabras de menor longitud.
1. Para cada uno de los siguientes lenguajes sobre Σ = {0, 1}, dé dos palabras que pertenezcan al lenguaje y dos que no pertenezcan:
    1. 0\*1\*
    1. 0(10)*1
    1. 0\* | 1\*

## Ejercicios Diseño ER

1. {λ} sobre Ʃ = {a, b}
1. {a, b} sobre Ʃ = {a, b}
1. {aa, ab, ba, bb} sobre Ʃ = {a, b}
1. {λ, aa, ab, ba, bb} sobre Ʃ = {a, b}
1. {(ab)^n / n ≥ 0} sobre Ʃ = {a, b}
1. {a^nb^n / 1 ≤ n ≤ 3} sobre Ʃ = {a, b}
1. {w / w comienza con 1 y termina en 0} sobre Σ = {0, 1}
1. {w / w contiene por lo menos tres 1s} sobre Σ = {0, 1}
1. {w / w contiene la palabra 0101} sobre Σ = {0, 1}
1. {w / w tiene longitud por lo menos 3 y su tercer símbolo es 0} sobre Σ = {0, 1}
1. {w / w comienza con 0 y tiene longitud impar o comienza con 1 y tiene longitud par} sobre Σ = {0, 1}
1. {w / la longitud de w es a lo sumo 5} sobre Σ = {0, 1}
1. {w / cada posición impar de w es un 1} sobre Σ = {0, 1}
1. {λ, 0} sobre Σ = {0, 1}
1. {w / w contiene un número par de 0s y exactamente dos 1s} sobre Σ = {0, 1}
1. Ø sobre Σ = {0, 1}
1. Σ* sobre Σ = {0, 1}
1. {w / w tiene un número par de 0s, un número impar de 1s y no contiene la palabra 01} sobre Σ = {0, 1}
1. {a^(2n)b^(2m+1) / n ≥ 0, m ≥ 0}
1. {w ∈ {0, 1}* / w tiene al menos dos ceros consecutivos}
1. {w ∈ {a, b}* / |w| mod 3 = 0}
1. {w ∈ {a, b}* / |w| mod 2 = 0}
1. "Todas las palabras sobre el Σ = {a, b} que tienen longitud 100 y terminan con 28 bes".
1. "Todas las palabras sobre el Σ = {a, b, c} que comienzan con 16 aes, terminan con 16 aes y tienen una longitud total de 1200 caracteres".
1. "Todas las palabras sobre el Σ = {a, b, c} que comienzan con 342 bes y terminan con 100 repeticiones de cualquiera de los caracteres del Σ (pero siempre uno solo de ellos)".
1. "La palabra vacía y todas las palabras sobre el Σ = {a, b, c} de longitud 45, que comienzan con aa o con bb, y que terminan con aa o con bb".
1. "Todos los números binarios que comienzan con un 1 o con un 0, el cual puede estar seguido por una secuencia de 1s". Los cuatro números binarios de menor longitud de este lenguaje son: 1, 0, 11 y 01.
1. "Todas las palabras que comienzan con una secuencia de dos o más 1s seguida de un 0 como último carácter o que comienzan con una secuencia de dos o más 0s seguida de un 1 como último carácter".
1. "Todas las palabras sobre el Σ = {a, b} que comienzan con a y tienen longitud mayor o igual que 2".
1. "Todas las palabras sobre el Σ = {a, b, c} que comienzan con una a y terminan con una b, o que comienzan con una b y terminan con una a".
1. "Todas las palabras sobre el Σ = {a, b, c} que terminan con aa o con bb y cuya longitud es mayor que 2".
1. "Todas las palabras sobre el Σ = {a, b, c} de longitud mayor o igual que seis, que terminan con aa o con bb".
1. "Todas las palabras sobre el Σ = {a, b, c} que contienen como mínimo dos aes".
1. "Identificadores de cualquier longitud que comience con a y contenga a, b o c. No pueden terminar con c y además no pueden contener dos c seguidas"
1. "Cadenas binarias que terminen en 0 sobre Ʃ = {0, 1}".
1. "Cadenas con sólo un 0 sobre Ʃ = {0, 1}".
1. "Cadenas binarias que no contienen 000 sobre Ʃ = {0, 1}".
1. "Cadenas que sí tienen un 1 va precedido y seguido de un 0 sobre Ʃ = {0, 1}".
1. "Todas las cadenas que contengan una única a sobre Ʃ = {a, b, c}".
1. "Palabras sobre el Σ = {0, 1} en las que no hay dos símbolos iguales contiguos, es decir, los 0’s y los 1’s se alternan. La palabra vacía no pertenece al lenguaje".
1. "Palabras sobre el Σ = {0, 1} donde cada 1 debe ser seguido inmediatamente por dos o más 0. La palabra puede empezar con 0 o con 1. Se admite la palabra nula".

## Ejercicios Determinar si ERs son equivalentes

1. aa|ab|ba|bb , a(a|b)|b(a|b) y (a|b)(a|b)
1. aa|ab|ba , a(a|b)|ba  y  ab|ba|aa
1. a^1000 y a*
1. (b | (c | a) a\* (b | c))\* (c | a) a\* , b\* (c | a) ((b | c) b\* (c | a))\* a\* , b\* (c | a) (a\* (b | c) b\* (c | a))\*  y  b\* (c | a) (a\* (b | c) b\* (c | a))\* a\*

## Ejercicios ER equivalentes

1. (a | b)^3 | b*
1. (ab)^3 | (ab)*

## Ejercicios ER -> L(ER)

1. (a | b)+
1. a+ba+
1. L((ab)\*) ∩ L(a\*b\*)
1. (b\*ab\*ab\*)\*
1. (0|1|2)\*11(0|1|2)\*
1. 0*
1. (0 | 1)*
1. (10)*
1. (0 | 1)\*1(1 | 0)\*
1. (1 | 10)*
1. 1(0 | 1)*1
1. 1\*01\*01\*
1. (0 | 1)\*00(1 | 0)\*

## Ejercicios ER -> GR

1. baa\* | c\* (a | b)
1. ba\* | c\* (a | b)
1. (1 | 2)*3

## Ejercicios GR -> ER

1. S -> 1A | 0  A -> 0S | 1

## Ejercicios Simplificar ERs

1. (a | λ) a* b
1. (λ | aa) (λ | aa)* a | a
1. (λ | aa) (λ | aa)* (ab | b) | (ab | b)
1. (a | b) (λ | aa)* (λ | aa) | (a | b)
1. abbaacc | abbbac | abbacccacc

## Ejercicios ERs según operaciones

1. Dados dos LRs representados, respectivamente, por las ERs (a | b)\*a\* y a^24b, escriba dos ERs que representen a la unión de los dos LRs. Escriba cinco palabras del LR "unión".
1. Sean los LRs representados por las ERs a\*bc y b(a | b)\*. Escriba la ER que representa a la concatenación de estos dos LRs. Escriba las cinco palabras de menor longitud del LR concatenación.
1. Si L es representado por la ER a\*b, L\* es representado por la ER (a\*b)\*. Escriba cuatro palabras del L*.
1. Sea el LR L representado por la ER ab+. Escriba la ER de L*. Escriba las cinco palabras de menor longitud de L*.
1. Sea L = {a^nbc^t / n,t >= 1}. Escriba la ER que representa a L+. Escriba las cinco palabras de menor longitud de L+
1. Sea el LR representado por la ER b(a | b |c)*. Escriba las cinco palabras de menor longitud de su lenguaje complemento.
1. Sea el Σ = {a, b}. Sea L1 representado por la ER aa(a | b)\*b y sea L2 representado por la ER (a | b)*ab. Escriba la ER que representa al lenguaje L1 ∩ L2. Justifique su solución.
