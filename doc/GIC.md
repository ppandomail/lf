# Gramática Independiente de Contexto (GIC)

* También llamadas Gramáticas Libres de Contexto o Incontextuales.
* Generan las palabras de los LIC (tipo de LF)
* Son de gran utilidad en la representación de la sintaxis de los Lenguajes de Programación (expresiones aritméticas, sentencias de un lenguaje de programación, etc.)

  ```plain
  <sent_asig> ::= <var> := <expresion>
  <expresion> ::= <expresion> + <termino> | <expresion> - <termino> | <termino>
  <termino> ::= <termino> * <factor> | <termino> / <factor> | <factor>
  <factor> ::= (<expresion>) | <var> | <num>
  <var> ::= A | ... | Z
  <num> ::= 0 | ... | 9
  ```

  * Palabras del LIC = {A:=A+B, C:=D-E*F, ...}

* Son GIC si sus producciones tienen las siguientes restricciones:
  * P = {(S -> λ) | (A -> v) / A ∈ ΣN, v ∈ Σ+}
    * el lado izquierdo debe tener un solo no terminal,
    * el símbolo distinguido puede o no derivar a λ
* Ejemplos:
  * P = {(S -> λ), (S -> 01S1), (S -> 0S10), (S -> A1), (A -> 0S10)}
  * P = {(A -> 1B1), (A -> 11), (B -> 1), (B -> 0)}
  * P = {(S -> A), (A -> aAa), (A -> bAb), (A -> c)}
  * P = {(S -> ABC), (S -> AC), (S -> BC), (S -> C), (A -> 0A1), (A -> 01), (B -> 1B2), (B -> 12), (C -> 3C), (C -> 3)}

## Ejemplo GIC

![GIC colchita](img/gic.jpg)

## Eficiencia en el diseño de gramáticas

* **Gramática limpia**: si no tiene reglas innecesarias y símbolos inaccesibles.
  * **Reglas innecesarias**:
    * Son las que tienen la forma A -> A (A ∈ ΣN)
    * Se deben eliminar de las gramáticas, ya que no generan derivaciones útiles.

    ```plain
    S  -> aA
    A -> aA | A | a
    ```

  * **Símbolos inaccesibles**:
    * Aquellos símbolos no terminales A ∈ ΣN  que no pueden ser alcanzados por derivaciones desde el axioma de la gramática.

    ```plain
    S  -> D0 | E10 | λ
    B  -> 1C3
    C -> C
    D -> 1S
    E  -> 1E
    ```

* **Gramática bien formada**: si está limpia, no tiene reglas generativas y no tiene reglas de redenominación.
  * **Reglas no generativas**:
    * Una regla es no generativa cuando A -> λ,  A ≠ S.

    ```plain
    S  -> C0B | λ
    B  -> BC | λ
    C -> 0B | λ
    ```

    * Para eliminarlas, se puede seguir el algoritmo:

    ```plain
    P’ = P
    Repetir
      Por cada P = (A -> λ) ∈ P’ ^ (A ≠ S)
        P’ = P’ – {P}
        Por cada P’ = (B -> xAy) ∈ P’ (x, y ∈ Σ*)
          P’ = P’ U {(B -> xy)} – {P’}
    Hasta que todas las reglas sean generativas
    ```

  * **Reglas de redenominación**:
    * Una regla es de redenominación cuando A -> B con  A, B ∈ ΣN
    * Para eliminarlas, se borra esa regla y se genera una nueva producción A -> x por cada B -> x, con x ∈ Σ*.

    ```plain
    S  -> C0B | 0B|C0 | 0 | λ
    B  -> BC | C
    C -> 0B | 0
    ```

## Formas Normales

* Son simplificaciones a las reglas de  producción de una gramática de tipo 2 (independientes de contexto).
* Proveen una forma canónica en la cual representar una GIC.
* Su utilización se traduce en compiladores más eficientes para diversos lenguajes de programación.
* Tipos:
  * Forma Normal de Chomsky (FNC o CNF)
  * Forma Normal de Greibach (FNG o GNF)
  * Forma Normal de Backus-Naur (FNB o BNF)

### Forma Normal de Chomsky (FNC o CNF)

* En esta forma de representar las gramáticas, las producciones pueden tener las siguientes formas: P = {(S -> λ) | (A -> BC) | (A -> a) / A, B, C ∈ ΣN,  a ∈ ΣT }
* Ejemplo G en FNC:

```plain
A  -> CD | EB | λ
B  -> BC |1
C -> 2
D -> BC
E  -> 1
```

* Algoritmo GIC -> FNC:
  * Entrada: G = (ΣN, ΣT, S, P)
  * Salida: G’ = (ΣN’, ΣT, S, P’) en FNC

  ```plain
  Mientras existen producciones cuyo lado derecho no respeta la FNC hacer:
  1) Reemplazar cada producción A -> B / B -> v1| v2|…| vn por la producción A -> v1 | v2 | ... | vn 

  A -> B 
  B -> a | b | c

  A -> a | b | c

  2) Para cada producción, si su lado derecho tiene dos o más símbolos y contiene algún terminal v, reemplace las apariciones de v por un nuevo no terminal V. Agregue la regla V -> v. Es decir, para un no terminal V / V ∉ ΣN, ΣN’ = ΣN ∪ {V},  P’ = P ∪ {V -> v}

  A -> pBq

  A  -> PBQ   
  P  -> p
  Q -> q

  3) Para cada producción B -> C1C2...Cn, donde n > 2, reemplazar la producción por B -> C1D, y D -> C2...Cn, que introducen un nuevo no terminal D.

  A -> BCDE

  A  -> BC1   
  C1 -> CDE
  ```

* Ejemplo:

```plain
S -> aSa | T
T -> b 

Paso 1:
S -> aSa
S -> b

Paso 2:
S -> ASA
S -> b
A -> a

Paso 3:
S -> AB
S -> b
A -> a
B -> SA
```

* Ventajas:
  * Todo árbol de derivación es de tipo binario.
  * Toda palabra de longitud n es derivable en 2n-1 pasos.
  * Estos elementos son de importancia teórica y práctica (por ejemplo, programación de compiladores).

### Forma Normal de Greibach (FNG o GNF)

* Es otra forma de representar las GIC, las producciones pueden tener las siguientes formas: P = {(S -> λ) | (A -> aX)  / A ∈ ΣN,  X ∈ ΣN*, a ∈ ΣT}
* Ejemplo:

```plain
A  -> 2BC | 1B | λ
B  -> 1B’ | 1
B’ -> 2B’ | 2
C  -> 2
```

* Algoritmo GIC -> FNG
  * Entrada: G = (ΣN, ΣT, S, P)
  * Salida: G’ = (ΣN’, ΣT, S, P’) en FNG
  
  ```plain
  1) Eliminar la recursión a izquierda (por ejemplo: A -> Aa) sustituyendo cada sublenguaje generado recursivamente por un conjunto de reglas equivalente,  pero sin recursión.
  2) Agregar nuevas reglas de reescritura y no terminales para llevar las reglas existentes a la forma de Greibach:
    a) Reemplazar A ∈ ΣN en cada α -> β, de a una por vez, para introducir terminales a izquierda.
    b) Reemplazar cada a ∈ ΣT que no está en la parte izquierda de β por nuevos A’ ∈ ΣN (esto deja solo no terminales a derecha).
  ```

* Ejemplo:

```plain
S  -> AB
S  -> B
A -> Aa
A -> b
B -> Ab
B -> c

Paso 1:
S -> AB
S -> B
A -> b
A -> bD 
D -> aD
D -> a 
B -> Ab
B -> c

Paso 2a:
S -> bB
S -> bDB
S -> bb
S -> bDb
S -> c
D -> aD
D -> a
B -> bb
B -> bDb
B -> c

Paso 2b:
S -> bB
S -> bDB
S -> bE
S -> bDE
S -> c 
D -> aD
D -> a
B -> bE
B -> bDE
B -> c 
E -> b
```

* Ventaja: se conoce que cada palabra de longitud n es derivable en n pasos.

### Forma Normal de Backus-Naur (FNB o BNF)

* En 1959, John Backus (Fortran) y Peter Naur (Algol) desarrollaron la notación BNF.
* BNF fue desarrollada en paralelo con las GIC de Chomsky.
* La notación BNF es equivalente a usar Diagramas de Conway (tradicionales en Pascal).
* Conjunto de reglas que definen, con precisión, la sintaxis de los componentes y de las estructuras de un Lenguaje de Programación.
* Cada regla BNF se forma con elementos provenientes de 3 conjuntos disjuntos (convenciones):
  * **Metavariables o noterminales**, palabras encerradas entre corchetes angulares (ejemplo: \<identificador\>, \<letra\>, \<digito\>).
  * **Terminales**, símbolos del alfabeto. Se los llama terminales porque no existen reglas de producción para ellos.
  * **Metasímbolos, caracteres o grupos de caracteres** que ayudan a representar estas reglas (ejemplo: <>, ::=, |).
  * El lado izquierdo debe tener únicamente un no terminal (para cumplir con la definición de GIC)

* Ejemplo 1: BNF para validar la correcta apertura y cierre de una palabra de paréntesis.

```plain
<palabra_par>  ::=  <palabra_par> <parentesis> | <parentesis> 
<parentesis>  ::=  (<palabra_par>) | ()
```

* Ejemplo 2: BNF de un identificador en ALGOL

```plain
<identificador> ::= <letra> | <identificador> <letra> | <identificador> <dígito>
<letra> ::= a | b | c | ... | z | A | B | C | … | Z
<dígito> ::= 0 | 1 | 2 | ... | 9
```

* Ejemplo 3: BNF de números enteros en ALGOL

```plain
<número entero> ::= <entero sin signo> | + <entero sin signo> | - <entero sin signo>
<entero sin signo> ::= <dígito> | <entero sin signo> <dígito>
<dígito> ::= 0 | 1 | 2 | ... | 9
```

* Ejemplo 4: BNF para un pequeño lenguaje

```plain
<program> ::= begin <stmt_list> end
<stmt_list> ::= <stmt> | <stmt> ; <stmt_list>
<stmt> ::= <var> = <expression>
<var> ::= A | B | C
<expression> ::= <var> + <var> | <var> - <var> | <var>
```

## Ejercicios conceptuales

1. ¿Qué Lenguaje Formal genera la gramática G = <{S, T}, {a, b}, {S -> aT, T -> a, T -> λ}, S>? Justifique.
1. Sea la Gramática Formal con producciones: {S -> aT | bQ,  T -> a | b,  Q -> a | λ} ¿La gramática con estas seis producciones genera la palabra bab? Justifique. ¿Cuál es el Lenguaje Formal generado por esta gramática? Justifique.
1. ¿Una GR es siempre una GIC? Justifique. ¿Una GIC es siempre una GR? Justifique.

## Ejercicios derivaciones

1. ¿Cuál es la mínima palabra generada por la GIC {S -> aSb | a}? Justifique. ¿Cuál es la palabra que le sigue en longitud?

1. Dada la GIC: {S -> λ; S -> AaB; S -> BbA; A -> a; A -> aAa, A -> bAa; B -> b; B -> bBb; B -> aBb}. Cadena más corta y varias cadenas del lenguaje.

1. Dada la GIC: {S -> [A]; A -> a; A -> aaA}. Cadena más corta y varias cadenas del lenguaje.

1. Dada la GIC P = {S -> aSb | ab}, determine, aplicando una derivación horizontal, si la cadena aaabbbb es una palabra del LIC generado por esta GIC. Dibuje la misma derivación, pero en forma de árbol.

1. Supongamos un Lenguaje de Programación en el que sus expresiones aritméticas están formadas por los números enteros 2 y 6, el operador de suma y siempre termina con un “punto y coma”. Algunas expresiones aritméticas de este Lenguaje de Programación son: {6; 2+2+6;} Vamos a construir una GIC que genere la totalidad de estas expresiones aritméticas. Para ello, debemos definir el vocabulario de no terminales, el vocabulario de terminales, el axioma y el conjunto de producciones. Supongamos que el vocabulario de no terminales esta formado por: S (el axioma), E (de expresión) y T (de término). Los terminales son 2, 6, + y ; (punto y coma). Las producciones de la GIC que genera el lenguaje de estas expresiones aritméticas son: {S -> E;  E -> T | E + T   T -> 2 | 6}. Determine, aplicando derivación a:
      1. izquierda, si 6; es una expresión correcta.
      1. izquierda, si 6+6+6+; es una expresión correcta.
      1. derecha, si 6+6+6+; es una expresión correcta.
      1. izquierda, si 6+6+6+2; es una expresión correcta.

1. Dada la siguiente gramática ambigua,  G=({S,B}, {0,1}, S, P), donde P son las producciones, P = {(S -> 0BB), (B -> 1S), (B -> 0S), (B -> 0)}. Mostrar los diferentes árboles de derivación para la cadena 010000000.

1. Dada la siguiente gramática ambigua, G=({E}, {+, \*, cte}, E, P), donde P son las producciones, P = {(E -> E + E), (E -> E \* E), (E -> cte)}. Derivar la cadena: cte + cte \* cte, mostrando los diferentes árboles de derivación.

1. Dada la siguiente Gramática Formal:

      ```plain
      Identificador -> Letra | Identificador Letra | Identificador GuiónBajo Letra
      GuiónBajo -> _
      Letra -> A | B | C | … | Z
      ```

      1. Construya el árbol de derivación para generar el identificador R_X_A.
      1. Verifique, mediante derivación, que A__B (hay dos guiones bajos consecutivos) no es un identificador válido para el lenguaje de programación.

1. Dada la siguiente Gramática Formal:

      ```plain
      Expresión -> Término| Expresión + Término
      Término -> Factor | Término * Factor
      Factor -> Número | (Expresión)
      Número -> 1 | 2 | 3 | 4 | 5
      ```

      1. Construya el árbol de derivación para generar la expresión 1 + 2 * (3 + 4) + 5.
      1. ¿Cuál es la menor expresión que se puede derivar desde la GIC? Escríbala y justifique su respuesta.
      1. ¿Es ((2)) una expresión válida? Demuestre que sí o que no por derivación. 
      1. Intente derivar 1 + 2 + + 3.

1. Dada la siguiente Gramática Formal:

      ```plain
      E  -> E + E | E * E | (E) | N
      N -> 1 | 2 | 3 | 4 | 5
      ```

      1. Describa formalmente la GIC.
      1. Construya el árbol de derivación para generar la expresión 1 + 2 * (3 + 4) + 5.

1. Dada la siguiente Gramática en BNF:

      ```plain
      <número entero> ::= <entero sin signo> | + <entero sin signo>  | - <entero sin signo>
      <entero sin signo> ::= <dígito> | <entero sin signo> <dígito>
      <dígito> ::= 0 |1|2|3|4|5|6|7|8|9
      ```

      1. Derive el número entero -123456.

## Ejercicios lenguaje generado

1. Describa, por comprensión, el LIC generado por la GIC <{S -> aSb | a}>
1. Determine el lenguaje generado por cada una de las siguientes gramáticas:

    ```plain
    S -> λ | AB | A | B
    A -> aAb | ab
    B -> bB | b
    ```

    ```plain
    S -> xAyC | xByyC | xyC | xyyC
    A -> xAy | xy
    B -> xByy | xyy
    C -> zC | z
    ```

## Ejercicios diseño GIC que genera el LIC definido simbólicamente

1. {a^nb^(n+1) / n ≥ 0}
1. {a^nbc^nb / n ≥ 1}
1. {a^(2n)b^(n+1)a^r / n ≥ 1, r ≥ 0}
1. {x^ny^m / m, n ≥ 0 y m = n ó m = 2n}
1. {0^m1^n / m > n ≥ 0}
1. {u^mv^n / n = múltiplo de 2 y m <> múltiplo de 2 ó viceversa}
1. {w^rx^sy^tz^u / r + t = s + u}
1. {x^ny^mz^k / k = m + n}
1. {x^my^n / n y m son enteros no negativos y 2m ≥ n ≥ m}
1. {a^(2k)b^(2n)c^kd^j / k, n, j ≥ 0}
1. {x^ry^sz^t / t = r + s y r, s ≥ 1}
1. {a^(2n)b^id^ke^(s+k) / n, i, k ≥ 0 y s > n} U {a^(2k)h^jd^(k+1) / k, j ≥ 0}
1. {w / w ∈ {0, 1}* y w contiene al menos tres ceros} (lineal a la derecha)
1. {a^(2n)b^(ij)(cc)^ka^(n+1) / i, n, k ≥ 0; j > k}
1. {w / w ∈ {a, b, c}*, la cantidad de a es impar en w, y no se puede dar la subcadena bc}
1. {w / w ∈ {a, b, c, d}* y w no contiene addc, d debe ser par, b impar}
1. {(ab)^nc(ba)^(2m+1) / n ≥ 1; m ≥ 0}
1. {x / x ∈ {a, b, c}* y x contiene al menos dos b y x contiene la subcadena bc}
1. {x / x ∈ {a, b, c}* y x empieza y termina  con distinta letra}
1. {x / x ∈ {a, e, i, f, t, h, n, l, s, w, d}* y x es alguna de las siguientes palabras reservadas de Pascal: {if, then, else, while, end}}

1. {a^(2i)b^(i+j)(cc)^ka^(n+1) / i, n, k ≥ 0; j > k}
1. {a^(2i)d^nd^(i+j)b^(n+1) / i, n, j ≥ 0} U {a^(j+1)d^nd^(j+k)b^(n+1) / k, n, j ≥ 0}
1. {d^nc^j(ab)^(2s)e^(t+2n) / s, t, n ≥ 0 y j > t} U {d^(2k)(ab)^(2h+1)e^(k+i) / h, k ≥ 0; i > k}
1. {w / w ∈ {a, b}*}
1. {a^(2n)b^(ij)(cc)^ka^(n+1) / i, n, k ≥ 0; j > k}
1. {a^(2i)d^nd^(i+j)b^(n+1) / i, n, j ≥ 0} U {a^(j+1)d^nd^(j+k)b^(n+1) / k, n, j ≥ 0}
1. L está dado por la ER: (a|bc)\*(dd|c)\*
1. {a^nb^j(hf)^he^ke^(t+2h) / t, n ≥ 0; h ≥ 1; k > n; j > t}
1. {e^(2n)d^t(bd)^sf^(2k+n) / t, n ≥ 0, s > 0 y k > t } U {(ee)^(k+1)h^)i+1)d^(2t) / k, i ≥ 0 ; t > k}
1. {e^(2n)d^t(bd)^sf^(2k+n) / t, n ≥ 0, s > n y k > t}
1. {w / w ∈ {a, b, c}* donde el símbolo "a" aparece de a pares (aa), el símbolo c puede venir luego de una b u otra c}
1. {w / w ∈ {a, b}*}
1. {w / w ∈ {a, b, c}* , la cantidad de a es impar en w, y no se puede dar la subpalabra bc}

1. {ww^(-1) / w,w^(-1) ∈ Σ*}  Σ = {a,b}
1. {a^(2k)b^(2n)c^kd^j / k, n, j ≥ 0 } Ʃ = {a, b, c, d}


## Ejercicios diseño GIC que genera el LIC definido coloquialmente

1. Sea el lenguaje de todas las palabras sobre el Σ = {0, 1} que cumplan N(0) =  N(1) + 1 donde N(0) es el número de apariciones de 0 y N(1) es el número de apariciones de 1.
1. Sea el lenguaje de todas las palabras sobre el Σ = {a, b}, las cuales la relación entre el número de aes y el número de bes sea de 2 a 1.
1. Números romanos válidos dado el alfabeto Σ = {I, V, X, L, D, M}
1. Expresiones aritméticas en notación polaca inversa construidas con el alfabeto Σ = {n, +, -, \*, :}. Una expresión en notación polaca inversa lleva los operadores siempre detrás de los operandos a los que se aplica. Por ejemplo: (a + b) \* (b – c \* (a - b)) se escribiría de la siguiente forma ab + bcab - \* - \*
1. Números, de cualquier número de cifras, que sean múltiplos de 4. Σ = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}

## Ejercicios encontrar GR y ER del LR generado por la GIC

1. GIC = <ΣT = {a, b}, ΣN = {S, A, B}, S, P>

    ```grammar
    S -> AabB | abB
    A -> aA | bA | a | b
    B -> Bab | Bb | ab | b
    ```

## Ejercicios GIC bien formada

1. G = <ΣT, ΣN, S, P>, donde ΣT = {0, 1}, ΣN = {S, A, B, C, D, E, F}, S es el axioma y P es:

    ```grammar
    S -> AB | A | CS1 | 0E
    A -> 0AS | λ | A0 | C
    B -> B1 | 1
    D -> B1 | λ | 1F
    E -> E1
    F -> 0D
    ```

1. Dada la siguiente gramática, realizar factorización a izquierda y eliminación de recursividad por la izquierda. G = <{or, and, not, =, (, ), id}, {C}, C, P>, donde P:
C -> C and C | C or C | not C | (C = C) | id

1. Dada la siguiente gramática, que utiliza la notación polaca inversa (todos los operandos de las operaciones se colocan antes de los operadores), factorizar a izquierdas y eliminar la recursividad por la izquierda. G = <{id, num, func, +, *, /, -, (, ), ., ;, <, >, =}, {S, N, M, O, R}, S, P>, donde P:

      ```plain
      S  -> S;S | S. |(NNR) | (idN=)
      N -> MNON | MNO | id | num
      M -> N | func(N) | func(M)
      O -> + | * | - | /
      R  -> < | > | == 
      ```

1. Dada la gramática G = <ΣT, ΣN, E, P>, donde ΣT = {a, +, *, ), (}, ΣN = {E, T, F}, E es el axioma y P es:

      ```plain
      E -> E + T | (E) | a
      T ->  T * F | (E)  | a
      F -> (E) | a
      ```

      1. Eliminar la recursividad por la izquierda
      1. Construir el árbol de derivación para las sentencias: a+a+a+a+a y a+(a+a).

## Ejercicios BNF

1. Diseñar BNF para Asignaciones de operaciones aritméticas o booleanas:
    * Las asignaciones se representan con el símbolo :=
    * Las variables pueden ser alfanuméricas, no pudiendo comenzar con un número. Ejemplo: VALOR1 -> válido 1VALOR ->inválido
    * Las operaciones aritméticas son: suma (+), resta (-), división (/), multiplicación (*) y potencia (^).
    * Las operaciones lógicas son AND, OR, NOT
    * Se podrán tener operaciones entre ()
    * Ejemplos de asignaciones: VAR12 := (VAR1 + VAR2) * VAR3 ^ VAR4 / VAR5  Otro Ejemplo: VARBOL2 := VAR1 AND VAR3 NOT VAR5 AND (VAR6 OR VAR7)

1. Dado el siguiente BNF para expresiones lógicas:

    ```plain
    <exp_lógica> ::= <exp_lógica> or <exp_lógica> | <exp_lógica> and <exp_lógica> | (<exp_lógica>) | not <exp_lógica> | true | false | <var_lógica>
    <var_lógica> ::= A | B | C | ... | Zç
    ```

      1. Determine usando árboles de derivación, si las siguientes son expresiones lógicas.
          1. A or ((B and not (B or A)) and true
          1. ((A and B) or C) and not A or B
          1. A and (C or B) or not (true and false)
      1. Determine si el BNF dado es o no ambiguo. Justifique. En caso de ser ambiguo, defina si es posible un BNF no ambiguo que genere el mismo lenguaje.

1. Diseñar una gramática en formato BNF para:
      1. Códigos postales en formato antiguo (Por ej. 1234, 8366, pero no 422 o 0027)
      1. Comentarios acotados por /\* y \*/  Ʃ = {letras, *, /}
      1. Patentes de autos formato anterior al actual.
      1. Fecha con formato dd/mm/yyyy.
      1. Describir los números naturales (considerar  N u {0})
      1. Idem anterior sin ceros a la izquierda.
      1. Probar si las gramáticas generan las cadenas 408 y 0015.

1. Diseñar una GIC en notación BNF para las expresiones aritméticas, y luego utilizarla para definir la GIC de la asignación en lenguaje C. Considerar cte, id y los símbolos de suma, resta, multiplicación y división como elementos terminales.

1. Diseñar una GIC en notación BNF en la que se puedan  generar cadenas de este tipo:  if <condición> then <acción> else <acción>  (opcional) endif, donde acción, es de la forma: id = cte  u otra sentencia if. Condición,  es de la forma:  id  operador   cte, y operador, es un operador lógico: >, <,  <>. Elementos terminales:  if, then, else, endif, id, cte, =, >, <,  <>. Ejemplo de cadena válida:  if id > cte then id = cte else id = cte endif. Probar si acepta una cadena con if anidado.

1. Definir una GIC que genere declaraciones simples de métodos en el lenguaje de programación Java: tipo_de_retorno nombre_del_metodo ( lista de parámetros ) Donde:
    * lista de parámetros será una enumeración de cero o más parámetros, separados por comas. Los parámetros tendrán la forma: tipo nombre
    * nombre y nombre_del_metodo: será una sucesión de letras y dígitos que comienza con una letra.
    * tipo_de_retorno y tipo: Considerarlos como terminales.
