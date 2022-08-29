# Gramática Regular (GR)

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

* G3: Gramática tipo 3 o Regular -> Lenguaje Regular (LR)
* G2: Gramática tipo 2 o Independiente (libre) de Contexto (incontextuales) -> Lenguaje Independiente de Contexto (LIC)
* G1: Gramática tipo 1 o Dependiente (sensible) de Contexto (contextuales) -> Lenguaje Dependiente de Contexto (LDC)
* G0: Gramática tipo 0 o sin restricciones (Irrestricta) -> Lenguaje Recursivamente Enumerable o No Restringido (LRE)

![Tipos de Gramáticas](img/tipos-gramaticas.png)

## Gramáticas Regulares (GR)

* Generan las palabras de los LR.
* Son las gramáticas más restrictivas.
* Si sus producciones tienen las siguientes restricciones:
  * el lado izquierdo debe tener un solo no terminal,
  * el lado derecho debe estar formado por un solo terminal, o un no terminal seguido de un terminal.  
  * el símbolo distinguido puede o no derivar a λ
* Pueden ser:
  * Lineales por la izquierda (GRLI): P = {(S -> λ) | (A -> Bv) | (A -> v) / (A, B) ∈ ΣN, v ∈ ΣT}
  * Lineales por la derecha (GRLD):   P = {(S -> λ) | (A -> vB) | (A -> v) / (A, B) ∈ ΣN, v ∈ ΣT}
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
* L(G) = {w ∈ ΣT* : S => w}
* Ejemplo: L(G) = {ab, aab, aaab, aaaab, ...}

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
1. Dada una gramática lineal derecha obtener una gramática lineal izquierda equivalente:

        ```plain
        A -> 1B | λ
        B -> 0A | 0
        ```

1. Dada la siguiente gramática lineal izquierda, obtener una gramática lineal derecha equivalente:

        ```plain
        S -> A1 | 1
        A -> S0
        ```
