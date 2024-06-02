# Introducción a los Lenguajes Formales

## Reflexión acerca del Universo conocido

1. Se estima que existen 2 millones de millones de galaxias
1. Nuestra galaxia, la Via Láctea: Entre 150.000.000.000 y 250.000.000.000 de estrellas
1. El Sol: nuestra estrella

* El Universo ha llamado la atención a la humanidad desde hace miles de años
* **Los seres humanos fuimos desarrollando diferentes teorías para explicar cómo funcionaba el Universo y qué abarcaba exactamente**
* Muchas teorías fueron consolidándose en los últimos siglos (ejemplo: los planetas giran alrededor del Sol o más genéricamente, en torno a una estrella)
• En todos los casos, quienes estudiaban el Universo buscaban **REGULARIDADES (patrones)** que ayudaran a entender qué sucedía
* Las regularidades permiten construir **MODELOS y TEORÍAS** sobre el mundo
* Ejemplo: Comportamiento del Cometa Halley
* Ejemplo: Predicción de los eclipses

## Las teorías pueden refinarse

| Años | | Teoría |
| -- | -- | -- |
| 100 - 170 | Ptolomeo | Modelo de universo geocéntrico (la Tierra era el centro) |
| 1430 - 1543 | Nicolás Copérnico | Tierra y los demás planetas giraban alrededor del Sol en sistema heliocéntrico |
| 1571 - 1630 | Johanes Kepler | Cada planeta se mueve a lo largo de una elipse, con el Sol situado en un foco de esta |
| 1642 - 1727 | Isaac Newton | Principio de acción-reacción: la fuerza neta aplicada sobre un objeto es directamente proporcional a la aceleración que este adquiere en su trayectoria |
| 1879 - 1955 | Albert Einstein | Teoría de la relatividad: tanto el espacio como el tiempo en el que transcurren los eventos es relativo a la velocidad del observador |

## Qué ha sucedido recientemente

* Los últimos 100 años vieron el surgimiento y consolidación de diferentes teorías formales (entre ellas la lógica y la teoría de los lenguajes formales)
* Estas teorías cobraron especial importancia en los últimos años por el impacto social de INTELIGENCIA ARTIFICIAL y la incidencia de la computación en todos los niveles humanos
* Para poder entender cómo desarrollar adecuadamente algoritmos complejos y saber cuáles son las limitaciones de las computadoras es necesario entender ciertos conceptos fundacionales

## Lenguaje Formal (L)

* Los LENGUAJES FORMALES están formados por PALABRAS, las palabras son CADENAS y las cadenas están constituidas por SÍMBOLOS de un ALFABETO.
* Son lenguajes definidos sobre un alfabeto Σ

## Símbolo (ó)

* Los seres humanos han representado el conocimiento usando símbolos desde hace varios milenios
* El lenguaje escrito es un ejemplo de dicho uso
* Recientemente en la historia surgió la pregunta ¿Qué cosas pueden representarse con símbolos? ¿Cuál es el límite?
* Esta pregunta cobró especial protagonismo con el surgimiento de las computadoras electrónicas, que afectaron el comportamiento de toda la civilización humana en las últimas décadas (1980 – actualidad)
* Esto se intensificó con el advenimiento de Internet ...
* Para entender los límites y capacidades de usar símbolos, necesitamos teorías formales que nos ayuden a entenderlos

* Es el elemento constructivo básico; es la entidad fundamental, indivisible (atómica), a partir de la cual se forman los alfabetos.
* Ejemplos:
  * La letra a es un símbolo que forma parte del alfabeto español, inglés, etc.
  * Los símbolos >, = y + son elementos del alfabeto de los operadores de los lenguajes Pascal y ANSI C .  
  * Los símbolos IF, ELSE, THEN para construir una sentencia condicional simple en un lenguaje de programación.

## Alfabeto (Σ)

* Es un conjunto no vacío y finito de símbolos indivisibles (letras, números, combinaciones de letras y números, etc.)
* Se lo identifica con la letra griega Σ (sigma).
* Con sus símbolos se construyen las palabras de un lenguaje. Ej:
  * Σ1 = {0, 1} : proporciona los símbolos utilizados en la construcción de los números binarios.  
  * Σ2  = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, -, +} : proporciona los números enteros con signo en base 10.
  * Σ3 = {na, pa, la, bra} : alfabeto formado por cuatro símbolos.
  * Σ4 = {a, b, ab} : no son símbolos indivisibles ab se forma con a y b. Es un alfabeto AMBIGUO

## Palabra (w)

* Es una secuencia finita de símbolos tomados de cierto alfabeto y colocados uno a continuación de otro.
* Una secuencia es una colección enumerada de objetos en la cual las repeticiones están permitidas y el orden importa.
* Se construye CONCATENANDO (yuxtaponiendo) símbolos de un alfabeto dado.
* w = s1s2 ...sn        donde si ∈ Σ, para 1 ≤ i ≤ n
* Ejemplos:
  * abac (se lee "a-b-a-c") es una palabra formada con símbolos del alfabeto {a, b, c}.
  * 101110 ("uno-cero-uno-uno-uno-cero") es una palabra construida con símbolos del alfabeto {0, 1}.
  * abc, abb, aaaaaa son palabras construidas con símbolos del alfabeto {a, b, c}

### Longitud de una palabra

* Es la cantidad o número de símbolos del alfabeto que la componen
* Se representa |w| = k o long(w) = k
* Formalmente long: Σ* -> Nat U {0}
* Ejemplos:
  * |palabra| = 7; en el caso de que los símbolos sean los del alfabeto español.
  * |palabra| = 3; en el caso que Σ = {na, pa, la, bra}
  * |abac| = 4; en el caso que Σ = {a, b, c}
  * |b| = 1

### Palabra vacía

* Se representa λ (lambda).
* Otros autores la denotan con el símbolo 𝜺 (epsilon).
* Es la palabra que no tiene símbolos.
* Es la palabra de longitud 0 (|λ| = 0).
* El símbolo λ (lambda) no forma parte de ningún alfabeto.

### Potenciación de un símbolo

* c^n representa la repetición del símbolo c, n veces.
* Simplifica la escritura de palabras.
* Ejemplo: aaaaabbbbbbb = a^5b^7

### Concatenación de dos palabras

* La operación de CONCATENACIÓN aplicada a palabras (w1w2) produce una nueva palabra formada por los símbolos de la primera palabra seguidos inmediatamente por los símbolos de la segunda palabra.
* Formalmente .: Σ\* x Σ\* -> Σ\*
* NO ES CONMUTATIVA, es decir,  w1 w2 ≠ w2 w1
* La palabra vacía (λ) es la IDENTIDAD para la concatenación.
* Esto es: para cualquier palabra w, w λ = λ w = w
* Ejemplos:
  * Sean w1 = aab y w2 = ba; entonces, w1w2 = aabba.
  * abc . aaaaa = abcaaaaa  

### Potenciación de una palabra

* Si w es una palabra, entonces w^n (con n ≥ 1 y entero) representa la palabra que resulta de concatenar la palabra w, consigo misma, n-1 veces.
  * w^n = w.w.w…w (n-veces)
* w^0 = λ (la palabra vacía), para cualquier palabra w.
* Ejemplos:
  * Sea w = ab; entonces: w^3 = www = (ab)^3 = ababab
  * ac^0b = ab
  * (ab)^2 = abab
  * abc^2 = abcc

### Igualdad de palabras

* Si w1 es una palabra (w1 = a1a2…an) y w2 es otra palabra (w2 = b1b2…bm), (w1, w2 ∈ Σ*), entonces w1 = w2 si se cumple que:
  * |w1| = |w2|  y
  * (∀i: 1 ≤ i ≤ n: ai = bi)
* Ejemplos:
  * abc = abc
  * abc ≠ ac

### Reflexión o reversa de una palabra

* Si w es una palabra (w = a1a2…an), entonces w^-1 o w^R representa la palabra que resulta de invertir el orden de los símbolos en la palabra.
* w^-1 = an ... a2 a1
* Ejemplos:
  * Sea w = ab; entonces, w^-1 = ba
  * (abc)^R = cba
  * (aaaab)^R = baaaa

### Prefijo de una palabra

* Es una secuencia de cero o más símbolos iniciales de esa palabra.
* Ejemplo: Sea la palabra abcd. Entonces, sus prefijos son: λ, a, ab, abc y abcd (la palabra completa).

### Sufijo de una palabra

* Es una secuencia de cero o más símbolos finales de esa palabra.
* Ejemplo: Sea la palabra abcd. Entonces, sus sufijos son: λ, d, cd, bcd y abcd.

### Subpalabra de una palabra

* Es una secuencia de símbolos que se obtiene eliminando cero o más símbolos iniciales y cero o más símbolos  finales de esa cadena.
* Ejemplo: Sea la palabra abcd. Entonces, sus subpalabras son: abcd, bcd, cd, d, abc, ab, a, bc, b, c y λ.

## Lenguaje Natural

* Es el lenguaje hablado y/o escrito que es utilizado por los seres humanos para comunicarse.
* Características:
  * EVOLUCIONAN con el paso del tiempo, incorporando nuevos términos y reglas gramaticales para mejorar y actualizar la comunicación.
  * Sus REGLAS GRAMATICALES surgen después del lenguaje, para poder explicar su estructura, es decir, su sintaxis.
  * El SIGNIFICADO (o sea, la semántica) de cada palabra y de cada oración de un lenguaje natural es, en general, más importante que su composición sintáctica.
* Admite frases ambiguas (puede tener más de una interpretación). Ejemplo: En el cerro hay una llama.

## Lenguaje Formal

* Es un conjunto de palabras formadas con los símbolos de un alfabeto dado, y tiene una característica fundamental: es un lenguaje abstracto, en el que el término FORMAL pone de manifiesto que, en esta disciplina, solo estamos interesados en la forma de una cadena (sintaxis) y no en su significado (semántica).
* Están definidos por reglas gramaticales PREESTABLECIDAS y se deben ajustar rigurosamente a ellas. En consecuencia, un lenguaje formal nunca puede evolucionar.
* Pueden ser descripto por enumeración (extensión), por comprensión, mediante una frase en un lenguaje natural (castellano) o mediante otras formas especiales.
* Ejemplo: Sea Σ = {a}, un alfabeto con un solo símbolo. Los que siguen son algunos lenguajes que se pueden construir sobre este alfabeto: L1 = {a}; L2 = {aa, aaa}; L3 = {λ, a, a^18}.

### Cardinalidad de un lenguaje formal

* Es la cantidad de palabras que lo componen.
* Ejemplos:
  * L = {a, ab, aab} es un lenguaje de cardinalidad 3 sobre el alfabeto {a, b}.
  * El lenguaje L = {λ}  es un lenguaje de cardinalidad 1, ya que contiene una sola palabra.

### Sublenguaje

* Dado que un lenguaje formal es un conjunto, un SUBLENGUAJE es un subconjunto de un lenguaje dado.
* Ejemplo: Sea L1 = {a, ab, aab}. Entonces,  L2 = {ab, aab} es un sublenguaje de L1, mientras que L3 = { } es el sublenguaje vacío de L1.

### Tipos de Lenguajes formales según cardinalidad

#### Lenguajes formales finitos

* Lenguajes con un número finito de palabras.
* Ejemplo:
  * L = {} = Ø        Lenguaje finito vacío.
  * L = {λ}           Lenguaje finito que contiene sólo la palabra vacía.
  * L = {a, ab, aab}  Lenguaje finito que contiene sólo tres palabras.

#### Lenguajes formales infinitos

* Lenguajes con una cantidad infinita de palabras, pero cada una de longitud finita (no existen las palabras de longitud infinita).
* Ejemplo: L = {a^n / n ≥ 1} es un LF infinito ya que no existe un límite superior para el supra índice n. Cada palabra de este lenguaje está formada por una secuencia de una o más aes. Por ello, la concatenación de dos palabras cualesquiera de este lenguaje producirá siempre otra palabra del lenguaje L. Por esta propiedad, se dice que este lenguaje L es cerrado bajo la concatenación.

### Lenguaje Universal (clausura sobre un alfabeto)

* Es un lenguaje infinito que contiene todas las palabras que se pueden formar con símbolos del alfabeto Σ, más la palabra vacía, ya que pertenece a todos los universos.
* Se lo representa con la notación Σ*, que se lee “sigma clausura” o “sigma estrella” o W(Σ).
* Es cerrado bajo concatenación.

* Σ* = U Σ^i    para i ≥ 0
* Σ^i es el conjunto de todas las palabras de longitud i sobre Σ

* Ejemplos: Si Σ = {a, b, c}, entonces
  * Σ^0 = {λ}
  * Σ^1 = {a, b, c}
  * Σ^2 = {a, b, c}{a, b, c} = {aa, ab, ac, ba, bb, bc, ca, cb, cc}  
  * Σ* = {λ, a, b, aa, ab, ba, bb, aaa, aab, aba, abb, ..., aabaabbbab, ...}

### Lenguaje sobre un alfabeto

* Es todo subconjunto de Σ*, entonces L ⊆ Σ*
* Se lo representa con la notación L(Σ).
* Un lenguaje puede ser finito o infinito.
* Como el universo asociado a un alfabeto es infinito, hay infinitos lenguajes asociados a un alfabeto.
* Un lenguaje se puede definir por comprensión o extensión.
* Ejemplos:
  * Si Σ = {na, pa, la, bra}, dos posibles lenguajes de Σ serían:
    * L1(Σ) = {nana, napa, lana}, y
    * L2(Σ) = {λ, nana, pana, palabra, papa, pala}
  * Si  Σ = {a, b, c}, Σ* = {λ, a, b, c, aa, ab, ac, ba, bb, bc, ca, cb, cc, aaa, aab, aac, ...}
    * L1(Σ) = {}
    * L2(Σ) = {λ}
    * L3(Σ) = {a, b, aa, bb, ab, ba}
    * L4(Σ) = {a, aa, aaa, aaaa, ...} = {a^n / n ≥ 1}
    * L5(Σ) = {a^n b^n / n ≥ 1} = {ab, aabb, aaabbb, ...}

### Operaciones con lenguajes

* Sea L1 = {nana, napa, lana}, L2 = {λ, nana, pana, palabra, papa, pala}, L = {0, 1}

* Unión:
  * L1 U L2  = {w ∈ Σ* : w ∈ L1 v  w ∈ L2} = {λ, nana, napa, lana, pana, palabra, papa, pala}

* Intersección:
  * L1 ∩ L2  = {w ∈ Σ* : w ∈ L1 ^ w ∈ L2} = {nana}

* Complemento:
  * ~L1  =  {w ∈ Σ* : w ∉ L1} = {λ, nanana, palana, ...}

* Diferencia:
  * L1 - L2 = L1 ∩ ~L2 =  {napa, lana}

* Producto:
  * L1 L2 = {w1w2 ∈ Σ* : w1 ∈ L1 ^ w2 ∈ L2} =  {nana, napa, lana, nananana, napanana, ...}

* Potencia:
  * L^n = { {λ} si n=0 v LL^(n-1) si n>0}
  * L^2 = {00, 01, 10, 11}

* Reflexión:
  * L^(-1) = {w^(-1) : w ∈ L}
  * Si L = {0, 10}, entonces L^(-1) = {0, 01}

* Cierre estrella (Kleene):
  * L* = U L^i  i ≥ 0
  * L* = {λ, 0, 1, 00, 01, 10, 11, 000, 001, ...}

* Cierre positivo:
  * L+ = U L^i i > 0
  * L+ = {0, 1, 00, 01, 10, 11, 000, 001, ...}

### Propiedades de los lenguajes

* LØ = Ø = ØL
* La concatenación es asociativa: (L1 L2) L3 = L1 (L2 L3)
* La concatenación no es conmutativa: L1 L2 ≠ L2 L1
* Distributiva con respecto a la unión: L1 (L2 U L3) = L1L2  U  L1L3
* No distributiva con respecto a la intersección: L1 (L2 ∩ L3) ≠ L1L2  ∩  L1L3
* Potencia del lenguaje: L^0 = {λ}     L^1 = L     L^2 = LL    ...     L^k = LL^(k-1)
* Clausura del Lenguaje: L* = L^0 U L^1 U L^2 U L^3 U ...
* Reversa del Lenguaje: L^R = L^(-1) = {w^R ∈ Σ* / w ∈ L}

### Equivalencias

* L\* = {λ} U L+
* L+ = L\*  <=> λ ∈ L <=> λ ∈ L+
* L\*L = LL\* = L+L\* = L\*L+  = L+
* L\*L\* = L\* pero L+L+ = L^2L\*
* (L\*)\* = (L+)\* = (L\*)+ = L\*
* (L+)+ = L+
* Ø\* = {λ}
* Ø+ = Ø

## Jerarquía de Chomsky

* En 1956 y 1959, el lingüista norteamericano Noam Chomsky publicó dos trabajos sobre los Lenguajes Naturales que, aplicados al área de los Lenguajes Formales, produjeron lo que se conoce como Jerarquía de Chomsky
* Su idea: modelar los lenguajes naturales, con miras a la traducción automática
* Establece una clasificación (según las restricciones que se imponen a sus producciones) de cuatro tipos de gramáticas formales que, a su vez, generan cuatro tipos diferentes de lenguajes formales

![Jerarquía de Chomsky](img/jerarquia.png)

![Jerarquía de Chomsky](img/chomsky.jpg)

## En resumen

![Resumen LF](img/lf.jpg)

## Ejercicios Σ

1. Escriba el Σ que se requiere para construir el conjunto de los números enteros con signo en base 10.
1. Escriba el Σ mínimo a partir del cual se construye el LF L = {Argentina, Holanda, Brasil}.
1. Sea el LF L = {λ, a, ba, abc}. ¿Cuál es el mínimo alfabeto Σ sobre el que se puede construir este lenguaje?

## Ejercicios w según operación

1. Dado el Σ = {0, 1, 2}, construya dos palabras en la que cada uno de estos símbolos aparezca una sola vez.
1. Dado el Σ = {ab, cde}, construya una palabra que tenga cuatro símbolos.
1. Simplificando con el uso de la “potenciación”, escriba la palabra que tiene 1300 aes seguidas de 846 bes seguidas de 257 aes.
1. Sean las palabras S1 = aab y S2 = ba. Obtenga la palabra S1S2S1S2.
1. ¿Por qué el superíndice 0 no es aplicable a símbolos pero sí a palabras?
1. Demuestre que (abc)^0 = (1234)^0.
1. Demuestre que las palabras (ab^3)^3 y ((ab)^3)^3 son diferentes.
1. Sean la palabras x = cd y z = ab definidas sobre el Σ = {a, b, c, d}. Calcular:
    1. x^1
    1. x^2
    1. x^0
    1. x^R
    1. x^Rz
    1. z^Rz^R
    1. x^Rz^2
    1. x^2z^3
1. Sea el LF L = {0, 00, 01, 010}. Escriba una concatenación de dos palabras que produce otra palabra de este lenguaje.
1. Sea el lenguaje anterior. Escriba una concatenación de dos palabras que produce una cadena que no es palabra del lenguaje.

## Ejercicios |w|

1. Sea el LF L = {ab^na / n ≥ 1}. Escriba las tres palabras de menor longitud y describa este lenguaje mediante una frase en castellano.
1. Para cada uno de los siguientes LF, dé la palabra de menor longitud y otras dos palabras de distinta longitud:
    1. L1 = {w / w ∈ {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}* y w es un número par}
    1. L2 = {a^nb^md^(n+m) / n, m ≥ 0}
    1. L3 = {w / w ∈ {a, b, c, d}* y w contiene la subpalabra ab y w no la subpalabra bc}
    1. L4 = {w0^(2k+1) / w ∈ {a, b, c}* y |w| es múltiplo de 4 y w termina en bb y k ≥ 0}
    1. L5 = {w / w ∈ {a, b, c}* y w contiene al menos dos b y w contiene la subpalabra bc}
1. Sea Σ = {a, b} y sea el lenguaje Σ*. ¿Cuántas palabras de longitud 3 tiene este lenguaje? ¿Y cuántas de longitud 4?
1. Sea el lenguaje infinito L = {ab^n / n ≥ 1}. Escriba las tres palabras de menor longitud.
1. Sea el lenguaje infinito L = {(ab)^n / n ≥ 1}. Escriba las tres palabras de menor longitud.

## Ejercicios LF por Extensión

1. Escriba un LF con cuatro palabras de longitud cinco sobre el Σ = {c, p}.
1. Describa por extensión el LF sobre el Σ = {a, b, c} formado por todas las palabras de longitud 30 que comienzan con a, terminan con b y, en medio, tienen exactamente tres ces. Una palabra de este lenguaje es: a^20cbbcacb^4.
1. Dado el alfabeto Σ = {a, b, c}, escriba las palabras del LF L = {w / w ∈ Σ}.
1. Escriba todas las palabras del LF L = {a^(2n+1) / 1 ≤ n ≤ 4}.

## Ejercicios LF por Comprensión Simbólica

1. Describa por comprensión el siguiente LF L = {λ, b, bb, bbb, bbbb, bbbbb, bbbbbb, bbbbbbb, bbbbbbbb}
1. Describa por comprensión el LF sobre el Σ = {a, b, c} formado por todas las palabras de longitud 30 que comienzan con a, terminan con b y, en medio, tienen exactamente tres ces. Una palabra de este lenguaje es: a^20cbbcacb^4.
1. Sea el LF L = {a^(2n) / 200 ≥ n ≥ 0}. Escriba, por comprensión, el LF que se obtiene realizando todas las concatenaciones de dos palabras cualesquiera del lenguaje dado.
1. Sea el Σ = {0, 1}. Describa, por comprensión, un lenguaje infinito L sobre Σ (que no sea Σ*).

## Ejercicios LF por Comprensión Coloquial

1. Describa mediante una frase el LF L = {λ, b, bb, bbb, bbbb, bbbbb, bbbbbb, bbbbbbb, bbbbbbbb}
1. Describa mediante una frase al LF L = {a^(2n+1) / 200 ≥ n ≥ 0}.
1. ¿Cuál es la cardinalidad del lenguaje L = {λ, a, aa, aaa}? Describa el lenguaje mediante una frase en castellano.
1. Describa, mediante una frase en castellano, el lenguaje L = {a^nb^n / 1 ≤ n ≤ 3000}.

## Ejercicios LF según operación

1. Dados los alfabetos: Σ1 = {1, 2, 3, 4, 5, 6, 7, 8} y Σ2 = {a, b, c, d, e, f, g, h} y los LF: L1(Σ1) = {x / x ∈ Σ1} y L2(Σ2) = {x / x ∈ Σ2}. Definir los LF:
    1. L1 U L2
    1. L1L2
    1. (L1L2)^2
1. Sean A y B alfabetos, tales que A = {a, b} y B = {a, b, c}, y L1, L2 y L3 los siguientes LF: L1 = {a^ib^j / i ≥ 1, j ≥ 1},   L2 = {b^ic^j / i ≥ j ≥ 1},  L3 = {a^ib^jc^i / i ≥ 1, j ≥ 1}. Determine si cada una de las siguientes afirmaciones es verdadera o falsa:
    1. L1 es un lenguaje sobre A
    1. L2 es un lenguaje sobre A ∪ B
    1. L2 es un lenguaje sobre A ∩ B
    1. L3 es un lenguaje sobre A ∪ B
    1. L3 es un lenguaje sobre A ∩ B
    1. L1 es un lenguaje sobre A - B
    1. L1 ∪ L2 es un lenguaje sobre A
    1. L1 ∪ L2 es un lenguaje sobre A ∩ B
1. Sea L1 = {λ}, L2 = {b, aa, ab, bb}, L3 = {λ, a, b, aa, bb} y L4 = {}, definido sobre Σ = {a, b}. Obtener:
    1. L1 ∪ L2
    1. L1 ∪ L3
    1. L1 ∪ L4
    1. L1 ∩ L2
    1. L2 ∩ L3
    1. L3 ∩ L4
    1. L1 ∩ L4
1. Dados los siguientes LF, definidos sobre el Σ = {a, b, c}. L1 = {a^(2n)b^jc^n / n, j ≥ 0}, L2 = {a^(2k)c^i / i > 0 y k ≥ 0}, L3 = {λ, aa, c}. Calcule el LF resultante de las siguientes operaciones:
    1. L3^2 – L2
    1. L2^R ∩ L3
    1. L2 ∪ L3
    1. L3^R L3
1. Dados los siguientes LF, definidos sobre el Σ = {a, b, c, d, e, g}. L1 = {λ, ab, a}, L2 = {λ, d, c}, L3 = {w / w ∈ {a, b, c}* y w termina en ab}, L4 = {a^(j+1)b^pc^(2n)e^kg^s/ p, k, s ≥ 0 y n > s y j > p}. Calcule el LF resultante de las siguientes operaciones:
    1. L1^2 – L3
    1. L1 L2*
    1. L4^R
    1. L1^2 ∩ L3
    1. L1 ∪ L2^2
1. Sean L1 y L2 los siguientes LF: L1 = {a}, L2 = {b}. Determine los conjuntos de palabras que pertenecen a los siguiente LF:
    1. L1*
    1. (L1L2)*
    1. (L1 ∩ L2)*
    1. L1\*L2\*
    1. (L1 ∪ L2)*
1. Sean L1 y L2 lenguajes arbitrarios sobre un Σ, ¿Cuáles de las siguientes afirmaciones son verdaderas y por qué? Para las falsas, dé un contraejemplo adecuado.
    1. L1 L2 = L2 L1
    1. {}* L1 = {λ} L1 = L1
    1. (L1 L2)\* = L1\*L2\*
    1. {} L1 = L1 {} = L1
    1. L1 {} = {λ}
    1. L1 {λ} = {}

## Ejercicios w pertenece o no a un LF

1. Sean L1 = {a^nb^(2k) / n ≥ 0 y k ≥ n} y L2 = {0^m1^n / m impar y n par, o m par y n par}. Determine para cada una de las siguientes palabras si pertenecen o no pertenecen al lenguaje indicado.
    1. ab^4 ... L1
    1. ab ... L1
    1. λ ... L1
    1. a^5 ... L1
    1. 0^3 1^3 ... L2
    1. 0^4 1^8 ... L2^R
    1. 0^3 1^2 0^2 1^4 0^1 1^2 ... L2*
    1. 0^9 ... L2
    1. 1^4 ... L2
    1. 0^3 1^6 a^3 b^8 ... L1L2
    1. a^6 b^8 0^4 ... L1L2
    1. 1ab^4 ... L2L1
