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

### Regla recursiva

* Si el mismo símbolo no terminal aparece en los dos lados de la producción.
* Es decir, existe un A ∈ ΣN tal que (A -> xAy) ∈ P, (x, y ∈ Σ*)
* Ejemplos:
  * A -> 0A0
  * B -> B10
  * C -> 111C

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
  * P = {(S -> λ), (S -> aA), (A -> aB), (A -> a), (B -> aA)}
  * P = {(S -> λ), (S -> Ca), (C -> Da), (C -> a), (D -> Ca)}
  * P = {(S -> a), (S -> aB), (B -> bB), (B -> aB), (B -> a), (B -> b)} para el L = {aw / w ∈ {a, b}*}
  * P = {(S -> aS), (S -> bS), (S -> bT'), (T' -> bT''), (T'' -> b), (T'' -> bT'''), (T''' -> aT'''), (T''' -> bT'''), (T''' -> a), (T''' -> b)} para el L = {wbbbw / w ∈ {a, b}*}

## Gramáticas Quasi Regulares (GQR)

* Vinculadas a la sintaxis de los lenguajes de programación.
* Abrevia la escritura de una GR
* Ejemplo: L = {w1 w2 / w1 ∈ {a, b, c} ^ w2 ∈ {a, b, c}* }
* GR:   S -> aS | bS | cS | a | b | c
* GQR:  S -> A | AS    A -> a | b | c

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

## Gramáticas equivalentes

* Dos gramáticas G y G’ son equivalentes si generan el mismo lenguaje, es decir, si L(G) = L(G’)
* Ejemplo

      ```plain
      S  -> c A d
      A -> ab | a
      ```

      ```plain
      S -> cabd | cad
      ```

## Gramáticas ambiguas

* Una gramática es ambigua si tiene al menos una sentencia ambigua.
* Una sentencia es ambigua si tiene más de una derivación o árbol de derivación.
* Un lenguaje es ambiguo si existe una gramática ambigua que lo genera.
* En algunos casos, dada una gramática ambigua, se puede encontrar otra gramática que produzca el mismo lenguaje pero que no sea ambigua.
* Ejemplo 1:

      ```plain
      S -> 1B | 11
      B -> 1
      ```
  * Dos derivaciones para 11:
    * S => 1B => 11
    * S => 11

* Ejemplo 2:

      ```plain
      E -> E+E | E-E | num | id | (E)
      ```
  * Dos derivaciones para id+id-id (una por la izquierda y otra por la derecha)
    * E => E-E => E+E-E => id+E-E => id+id-E => id+id-id
    * E => E-E => E-id => E+E-id => E+id-id => id+id-id

* Si una gramática tiene alguna de estas características, se podrá afirmar que es ambigua:
  * Con ciclos: S -> A | a     A -> S
  * Con alguna regla de la forma: E -> E...E
  * Con reglas que ofrecen caminos alternativos entre dos puntos: S -> B | C   B -> C
  * Producciones recursivas en las que las variables no recursivas de la producción puedan derivar a la palabra vacía. Ejemplo:

        ```plain
        S -> A B S | s
        A -> a | λ
        B -> b | λ
        ```
  * Símbolos no terminales que puedan derivar a la palabra vacía y a la misma palabra de terminales, y que aparezcan juntas en la parte derecha de una regla o en alguna forma sentencial. Ejemplo:

        ```plain
        A -> A B | a | λ
        B -> b | a | λ
        ```

## Factorización a izquierda

* Proceso que elimina el problema de que aparezcan producciones de un mismo símbolo no terminal en cuya parte derecha, la primera parte sea común.
* Ejemplo:

      ```plain
      S -> if C then S else S | if C then S | repeat S until C | repeat S forever
      ```
* Algoritmo:

      ```plain
      Por cada A ∈ ΣN
        Si A -> βα1 | βα2
          cambiar esas reglas por:
          A -> βA’
          A’-> α1 | α2
      ```

* Salida del algoritmo:

      ```plain
      S  -> if C then S A’| repeat S S’
      A’ -> else S | λ 
      S’ -> until C | forever
      ```
