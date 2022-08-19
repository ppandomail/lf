# Lenguajes Regulares (LR)

## Gramática Formal (GF)

* Son descripciones estructurales de las sentencias de los lenguajes, tanto formales (lenguajes de programación) como naturales (humanos).
* Generan las palabras que forman un lenguaje formal definido sobre un alfabeto Σ.
* Describen "cómo" se pueden generar las palabras de un lenguaje.
* Es un conjunto de producciones (reglas de reescritura) que se aplican para obtener cada una de las palabras del lenguaje formal que la gramática formal en cuestión genera.
* Ejemplo:
  * Sea el lenguaje L = {a}, formado por una sola palabra. Este lenguaje es generado por una gramática con una única producción: S -> a
  * Se lee “S produce a” o “S deriva a”.

### Producción

* α -> β
* Es una regla de reescritura formada por 3 partes:
  * el lado izquierdo,
  * el lado derecho, y
  * la flecha, que indica que el lado izquierdo de la producción “produce” (o “es reemplazado por” o “equivale a”) el lado derecho.  

### Definición formal

* Toda gramática formal G,  se define como una cuádrupla G = (ΣT, ΣN, S, P) donde:
  * ΣT : alfabeto de símbolos terminales.
  * ΣN : alfabeto de símbolos no terminales.
  * S : símbolo inicial (start) o axioma o símbolo distinguido.
  * P : conjunto finito no vacío de producciones.

#### ΣT

* Alfabeto de símbolos terminales.
* Es el conjunto finito de símbolos terminales del alfabeto sobre el cual se construye el lenguaje formal que es generado por la gramática descripta.
* Ejemplo: ΣT = {0, 1}

#### ΣN

* Alfabeto de símbolos no terminales.
* Conjunto finito de símbolos especiales denominados no terminales que permiten representar subconjuntos del lenguaje o estados intermedios de la generación de las palabras del lenguaje, cumpliéndose:
  * Σ = ΣT U ΣN
  * ΣT ∩ ΣN = {}

#### S

* Símbolo inicial (start) o axioma o símbolo distinguido.  
* Es un símbolo no terminal especial.
* S ∈ ΣN
* Desde el cual siempre debe comenzar a aplicarse las producciones que generan todas las palabras de un determinado lenguaje formal.
* Algunos autores consideran que el símbolo S no puede aparecer en la derecha de una producción.

#### P

* Conjunto finito de producciones (reglas de reescritura).
* Permiten generar palabras a partir de S.
* Cada producción tiene como única restricción que en la parte izquierda debe haber al menos un símbolo no terminal. Es decir,  P = {(xAy -> v) / v, x, y ∈ Σ*  , A ∈ ΣN}
* Ejemplo:
  A -> 1B1 | 0B0
  B -> A | 1 | 0 | λ

### Ejemplo

* VN = {S, T}
* VT = {a, b}
* S = S
* P = {(S -> aT), (T -> a), (T -> b)}

* L = {aa, ab}

### Regla compresora

* Aquella cuya parte derecha está formada por menos símbolos que la parte izquierda:
  * α -> β
  * |β| < |α|

* Transforma una palabra en otra de menor longitud.
* Ejemplos:
  * 0C0 -> 1
  * A -> λ

### Tipos de gramáticas

* G3: Gramática tipo 3 o Regular -> Lenguaje Regular
* G2: Gramática tipo 2 o Independiente (libre) de Contexto (incontextuales) -> Lenguaje Independiente de Contexto
* G1: Gramática tipo 1 o Dependiente (sensible) de Contexto (contextuales) -> Lenguaje Dependiente de Contexto
* G0: Gramática tipo 0 o sin restricciones (Irrestricta) -> Lenguaje Recursivamente Enumerable o No Restringido

![Tipos de Gramáticas](img/tipos-gramaticas.png)

## Gramáticas Regulares (GR)

* Generan las palabras de los LR.
* Son las gramáticas más restrictivas.
* Si sus producciones tienen las siguientes restricciones:
  * el lado izquierdo debe tener un solo no terminal,
  * el lado derecho debe estar formado por un solo terminal, o un no terminal seguido de un terminal.  
  * el símbolo distinguido puede o no derivar a λ
* Pueden ser:
  * Lineales por la izquierda: P = {(S -> λ) | (A -> Bv) | (A -> v) / (A, B) ∈ ΣN, v ∈ ΣT}
  * Lineales por la derecha:   P = {(S -> λ) | (A -> vB) | (A -> v) / (A, B) ∈ ΣN, v ∈ ΣT}
* Ejemplos:
  * P = {(S -> C0), (S -> D1), (C -> 1), (D -> C1)}
  * P = {(A -> 1B), (B -> 1), (B -> 0C), (B -> 1C), (C -> 1)}
  * P = {(S -> λ}, (S -> aA), (A -> aB), (A -> a), (B -> aA)}
  * P = {(S -> λ), (S -> Ca), (C -> Da), (C -> a), (D -> Ca)}

## Derivación

* Es el proceso que permite obtener cada una de las palabras de un LF a partir del axioma de una GF que lo genera y aplicando sucesivamente las producciones convenientes de esa GF.
* Existen diferentes formas de representar una derivación:
  * Derivación Horizontal
  * Derivación Vertical

### Derivación Horizontal

* Utilizando el símbolo => en cada paso de una derivación.
* Ejemplo: L = {a^nb / n > 0}  P = {(S -> aA), (A -> aA), (A -> b)}
  * S => aA => ab                     ab ∈ L
  * S => aA => aaA => aab             aab ∈ L
  * S => aA => aaA => aaaA => aaab    aaab ∈ L

### Derivación Vertical

* Árbol de derivación: permite mostrar gráficamente cómo se puede derivar cualquier palabra de un lenguaje a partir del axioma de una gramática que genera ese lenguaje.
* Reemplazado un no terminal por su lado derecho para producir un nuevo subárbol.
* Son utilizados en la construcción de compiladores para representar el análisis sintáctico de los programas fuente y sirviendo de base para la generación de código.
* Ejemplo: L = {a^nb / n > 0}  P = {(S -> aA), (A -> aA), (A -> b)}

             S
            / \
            a  A
               |
               b

## Lenguaje generado por una gramática L(G)

* Es el conjunto de todas las sentencias de la gramática; es decir, todas las palabras que se pueden obtener a partir del axioma de la gramática por la aplicación de derivaciones:
* L(G) = {w ∈ ΣT* : S -> w}
* Ejemplo: L(G) = {ab, aab, aaab, aaaab, ...}

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
* Es una cadena de texto que describe un patròn de búsqueda.
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
| (0 \| 1)* 00 (0 \| 1)* | L = {w00w / w ∈ {0, 1}*} |
| (1 \| 10)* | L = {w / w ∈ {1, 10}*} |

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

## Ejercicios

1. Escriba las producciones de una GR que genere el LR L = {a^nb / 1 ≤ n ≤ 3}. Escriba la definición formal de la GR desarrollada.
1. Escriba las producciones de una GR que genere el LR L = {a^nb^n / 0 ≤ n ≤ 2}. Escriba la definición formal de la GR desarrollada.
1. Indique cuál es la mínima palabra del LR generado por la GR: {S -> aS|aT, T -> b}. Muestre cómo la genera.
1. Escriba la sucesión de producciones que aplicaría para generar la palabra aaab del LR definido en el punto anterior.
1. Escriba una GR que genere cualquier secuencia de uno o más dígitos decimales. Escriba una GQR que genere cualquier secuencia de uno o más dígitos decimales. Compare la cantidad de producciones de ambas gramáticas.
1. Escriba las producciones de una GQR que genere un LR infinito cuyas palabras son secuencias de tres o más dígitos octales (en base 8).
1. Transforme las producciones de la GQR obtenida en el punto anterior en producciones de una GR equivalente.
1. Escriba una GR equivalente a la GQR <{S -> L | SL | SD, L -> a|b|c|d, D -> 2|3|4|5|6}>. ¿Cuál es más sencilla de ser leída? Justifique su respuesta.
1. Dada la GQR <{S -> L | SL | SD, L -> a|b|c|d, D -> 2|3|4|5|6}>. Determine si las siguientes palabras son válidas: ab23, 2a3b. Verifiquelo aplicando derivación a izquierda y derivación a derecha.
1. Obtener las derivaciones de las palabras 002 y 0001 a partir de la siguiente gramática: G = <{0, 1, 2}, {A, B}, A, {(A::=0B), (A::=2), (B::=0A), (B::=1)} >. Describir el árbol de derivación y obtener el lenguaje que genera.
1. Con el alfabeto Σ = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9} encontrar una GR que genere números múltiplos de 3 de cualquier número de cifras.
1. Obtener el lenguaje que genera la siguiente GR G = <ΣT, ΣN, E, P>, donde ΣT = {0, 1}, ΣN = {S}, S es el axioma y P es: S -> 0S | 1S | λ
1. Definir una GR que dado el alfabeto ΣT = {a, b, c, d}, genere cadenas que no contengan la secuencia “bc”.
1. Para cada una de las siguientes gramáticas determine el lenguaje que genera:
    1. S  -> 1B   S  -> 1    A -> 1B    A -> 1    B -> 0A
    1. S -> aA    A -> bB    B -> aA    B -> aC   C -> aD    C -> a    D -> aD    D -> a
    1. S -> aA    A -> bB    B -> bB    B -> c    B -> cC    C -> cC   C -> c
    1. S -> aA    A -> aB    B -> aA    B -> b    B -> bC    C -> bC   C -> b
1. Diseñe la Gramática Formal del Lenguaje Formal L = {a^nb^n / 1 ≤ n ≤ 3}. Escriba la definición formal de la gramática.
1. Diseñe la Gramática Formal del Lenguaje Formal “Todas las palabras formadas por una o más aes”. Escriba la definición formal de la gramática.
1. Diseñe la Gramática Formal del Lenguaje Formal L = {a^nb^t / 1 ≤ n, 1 ≤ t}. Escriba la definición formal de la gramática.
1. Diseñe la Gramática Formal del Lenguaje Formal L = {(ab)^n(cde)^ta^z/ 1 ≤ n, 1 ≤ t, 0 ≤ z}. Escriba la definición formal de la gramática.
1. Diseñe la Gramática Formal del Lenguaje Formal "Todos los números binarios que comienzan con una cantidad impar de 1s que es seguida por un 0 como último símbolo". Escriba la definición formal de la gramática.
1. Describa dos casos en los que la concatenación de dos ER si puede ser conmutativa.
1. Escriba una ER que represente al LR L = {a^nb^n / 1 ≤ n ≤ 3}.
1. Describa, mediante una frase sin ambigüedades, el LR representado por la ER a(b|a)b.
1. Sea la ER abbaacc | abbbac | abbacccacc. Reescriba esta ER, factorizando con la mayor cantidad de símbolos comunes a los tres términos tanto a la izquierda como a la derecha.
1. Verifique que la siguiente afirmación es correcta: "Todas las palabras con dos símbolos sobre el alfabeto {a, b} puede ser representado por las siguientes ERs equivalentes: aa|ab|ba|bb = a(a|b)|b(a|b) = (a|b)(a|b)
1. Determine si las siguientes ERs son equivalentes: aa|ab|ba , a(a|b)|ba  y  ab|ba|aa. Justifique su respuesta.
1. Escriba una ER que represente al LR: "Todas las palabras sobre el alfabeto {a, b} que tienen longitud 100 y terminan con 28 bes".
1. Sea el LR: "Todas las palabras sobre el alfabeto {a,b,c} que: a) comienzan con 16 aes, terminan con 16 aes y tienen una longitud total de 1200 caracteres, b) comienzan con 342 bes y terminan con 100 repeticiones de cualquiera de los caracteres del alfabeto (pero siempre uno solo de ellos).
1. Escriba una ER que represente al LR: "La palabra vacía y todas las palabras sobre {a, b, c} de longitud 45, que comienzan con aa o con bb, y que terminan con aa o con bb".
1. Compare las ER a^1000 y a*. Informe sus conclusiones.
1. Escriba las tres palabras de menor longitud del LR representado por la ER (aba)\*. Utilizando el operador "potencia", escriba la palabra de longitud 300 del LR representado por la ER (aba)*. ¿La cadena ababa pertenece a este LR? Justifique su respuesta.
1. ¿La cadena a^24b^24a^24 es una palabra de LR representado por la ER (aba)*? Justifique su respuesta.
1. Dados los LR infinitos representados por las ERs a\* y aa\* respectivamente. ¿Cuál tiene mayor cantidad de palabras? Justifique su respuesta.
1. Describa, mediante una frase, el LR representado por la ER (a | b)+.
1. Justifique la siguiente afirmación: "Si la ER a “clausurar positivamente” fuera λ | a, entonces: (λ | a)+ = (λ | a)\* = a\*, porque la palabra vacía pertenece al lenguaje original”.
1. Justifique las afirmaciones:
    1. a\*a\* = a\*  
    1. a+ = aa\* = a\*a = aa\*a\* = a+a\* = a\*a+ = a\*a\*aa\*
1. Sea la ER a+ba+. Describa, por comprensión, el LR representado por esta ER.
1. Escriba las únicas palabras comunes a los LRs representados por las ERs (ab)\* y a\*b\*
1. Sea el LR representado por la ER a\* | b^3. Escriba las cinco palabras de menor longitud. Describa este LR mediante una frase en castellano.
1. Justifique la afirmación: la ER b\*ab\*ab\* representa al lenguaje "Todas las palabras sobre el alfabeto {a, b} con exactamente dos aes". Algunas palabras de este lenguaje son: aa, babba, bbaabbb, aba.
1. Defina, mediante una frase, el LR representado por la ER (b\*ab\*ab\*)\*
1. Construya la ER que representa al LR: "Todos los números binarios que comienzan con un 1 o con un 0, el cual puede estar seguido por una secuencia de 1s". Los cuatro números binarios de menor longitud de este lenguaje son: 1, 0, 11 y 01. Construya la ER que representa al LR: "Todas las palabras que comienzan con una secuencia de dos o más 1s seguida de un 0 como último carácter o que comienzan con una secuencia de dos o más 0s seguida de un 1 como último carácter".
1. Si el alfabeto fuera "todos los dígitos decimales", ¿cuál sería la ERU sobre ese alfabeto?
1. Sea el LR: "Todas las palabras sobre el alfabeto {a, b} que comienzan con a y tienen longitud mayor o igual que 2". Escriba una ER que lo represente.
1. Sea el alfabeto {a, b, c} y sea el LR: "Todas las palabras que comienzan con una a y terminan con una b, o que comienzan con una b y terminan con una a". Escriba una ER que represente a este LR.
1. Dado el alfabeto {a, b, c}, obtenga una ER que represente al LR "Todas las palabras que terminan con aa o con bb y cuya longitud es mayor que 2".
1. Dado el alfabeto {a, b, c}, sea el LR "Todas las palabras de longitud mayor o igual que seis, que terminan con aa o con bb". Escriba una ER que lo represente.
1. Dado el alfabeto {a, b, c}, y el LR "Todas las palabras que contienen como mínimo dos aes", obtenga una ER que lo represente.
1. Sea la ER (0 | 1 | 2)\*11(0 | 1 | 2)\*. Describa, mediante una frase, el LR representado por esta ER.
1. Sea la ER (a | b)^3 | b*. Escriba dos ERs que sean equivalentes a la dada.
1. Sea la ER (ab)^3 | (ab)*. Escriba dos ERs que sean equivalentes a la dada.
1. Dados dos LRs representados, respectivamente, por las ERs (a | b)\*a\* y a^24b, escriba dos ERs que representen a la unión de los dos LRs. Escriba cinco palabras del LR "unión".
1. Sean los LRs representados por las ERs a\*bc y b(a | b)\*. Escriba la ER que representa a la concatenación de estos dos LRs. Escriba las cinco palabras de menor longitud del LR concatenación.
1. Si L es representado por la ER a\*b, L\* es representado por la ER (a\*b)\*. Escriba cuatro palabras del L*.
1. Sea el LR L representado por la ER ab+. Escriba la ER de L*. Escriba las cinco palabras de menor longitud de L*.
1. Sea L = {a^nbc^t / n,t >= 1}. Escriba la ER que representa a L+. Escriba las cinco palabras de menor longitud de L+
1. Sea el LR representado por la ER b(a | b |c)*. Escriba las cinco palabras de menor longitud de su lenguaje complemento.
1. Sea el alfabeto {a, b}. Sea L1 representado por la ER aa(a | b)\*b y sea L2 representado por la ER (a | b)*ab. Escriba la ER que representa al lenguaje L1 ∩ L2. Justifique su solución.
1. Sea un Lenguaje de Programación en el que IDENTIFICADOR es una posible secuencia de letras minúsculas y dígitos que comienzan con una letra mayúsculas. Escriba una Definición Regular que represente a este LR.
1. Determinar si las siguientes ER son equivalentes:
    1. (b | (c | a) a\* (b | c))\* (c | a) a\*
    1. b\* (c | a) ((b | c) b\* (c | a))\* a\*
    1. b\* (c | a) (a\* (b | c) b\* (c | a))\*
    1. b\* (c | a) (a\* (b | c) b\* (c | a))\* a\*
1. Dadas las siguientes ER, obtener la GR que las genera:
    1. baa\* | c\* (a | b)
    1. ba\* | c\* (a | b)
1. Dé ER que representen los siguientes lenguajes sobre Σ = {0, 1}:
    1. {w / w comienza con 1 y termina en 0}
    1. {w / w contiene por lo menos tres 1s}
    1. {w / w contiene la palabra 0101}
    1. {w / w tiene longitud por lo menos 3 y su tercer símbolo es 0}
    1. {w / w comienza con 0 y tiene longitud impar o comienza con 1 y tiene longitud par}
    1. {w / la longitud de w es a lo sumo 5}
    1. {w / cada posición impar de w es un 1}
1. Dé ER que representen los siguientes lenguajes sobre Σ = {0, 1}:
    1. {λ, 0}
    1. {w / w contiene un número par de 0s y exactamente dos 1s}
    1. Ø
    1. Σ*
1. Dé la ER que represente el lenguaje {w / w tiene un número par de 0s, un número impar de 1s y no contiene la palabra 01}
1. Para cada uno de los siguientes lenguajes sobre Σ = {0, 1}, dé dos palabras que pertenezcan al lenguaje y dos que no pertenezcan:
    1. 0\*1\*
    1. 0(10)*1
    1. 0\* | 1\*
1. Algunos lenguajes de programación, los comentarios se insertan entre delimitadores como /\* y \*/ y no puede haber ninguna ocurrencia de \*/ dentro del comentario. Si C es el lenguaje de todos los comentarios válidos sobre Σ = {*, a, b}; dé una expresión regular que represente C.
1. Dada la siguiente gramática: S -> 1A | 0  A -> 0S | 1
    1. Describir por extensión el lenguaje generado.
    1. Tipo de gramática de Chomsky más restrictivo.
    1. ER.
1. Escriba una ER que defina el siguiente lenguaje: "identificadores de cualquier longitud que comience con a y contenga a, b o c. No pueden terminar con c y además no pueden contener dos c seguidas".
1. Escriba una ER para el lenguaje L sobre el alfabeto {0, 1} que consiste en las palabras en las que no hay dos símbolos iguales contiguos, es decir, los 0’s y los 1’s se alternan. La palabra vacía no pertenece al lenguaje.
1. Escriba el conjunto de producciones de una gramática de tipo 3 para el alfabeto {1, 2, 3}, la ER (1 | 2)*3 indica el conjunto de todas las cadenas formadas con los símbolos 1 y 2, sucediéndose cualquier número de veces (y en cualquier orden), y siempre terminando la cadena en el símbolo 3.
1. Para el lenguaje dado sobre el alfabeto {0, 1} construir una ER de el y la gramática que genere el mismo lenguaje. L = {cada 1 debe ser seguido inmediatamente por dos o más 0. La palabra puede empezar con 0 o con 1. Se admite la palabra nula}.
1. Dado Ʃ = {a, b}, para los siguientes lenguajes, obtener una ER:
    1. L = {λ}
    1. L = {a, b}
    1. L = {aa, ab, ba, bb}
    1. L = {λ, aa, ab, ba, bb}
    1. L = {(ab)^n / n ≥ 0}
1. Describir con palabras qué lenguajes representan las siguientes ER:
    1. 0*
    1. (0 | 1)*
    1. (10)*
    1. (0 | 1)*1(1 | 0)*
    1. (1 | 10)*
    1. 1(0 | 1)*1
    1. 1\*01\*01\*
    1. (0 | 1)\*00(1 | 0)\*
1. Dada la descripción del lenguaje, encontrar una ER equivalente Ʃ = {0, 1}
    1. Cadenas binarias que terminen en 0.
    1. Cadenas con sólo un 0.
    1. Cadenas binarias que no contienen 000.
    1. Cadenas que sí tienen un 1 va precedido y seguido de un 0.
1. Obtener una ER para el siguiente lenguaje sobre Ʃ = {a, b, c}, "Todas las cadenas que contengan una única a"
1. Obtener una ER para los siguientes lenguajes:
    1. L = {a^(2n)b^(2m+1) / n ≥ 0, m ≥ 0}
    1. L = {w ∈ {0, 1}* / w tiene al menos dos ceros consecutivos}
    1. L = {w ∈ {a, b}* / |w| mod 3 = 0}
    1. L = {w ∈ {a, b}* / |w| mod 2 = 0}
1. Simplificar las siguientes ERs
    1. (a | λ) a* b
    1. (λ | aa) (λ | aa)* a | a
    1. (λ | aa) (λ | aa)* (ab | b) | (ab | b)
    1. (a | b) (λ | aa)* (λ | aa) | (a | b)
