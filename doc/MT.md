# Máquina de Turing (MT)

## Alan Mathison Turing

* (Inglés, 23/06/1912-1954)
* Hitos de su carrera científica:
  * Diseño de una **máquina hipotética**, la máquina de Turing, creando los conceptos teóricos que permitieron la construcción de las primeras computadoras.
  * Como **criptógrafo** se destacó por conseguir desvelar los códigos Enigma, con los que los alemanes cifraban sus mensajes durante la Segunda Guerra Mundial.
  * Realizó investigaciones pioneras con las que sentó las bases de la **inteligencia artificial** y la **biología matemática**.

![Turing](img/Turing.png)

* En 1936 escribió un artículo científico, titulado **"On computable numbers, with an application to the Entscheidungsproblem"**, en el que hizo una de las aportaciones científicas más importantes de su vida: la Máquina de Turing.
* Turing bautizó originalmente como máquina-a (máquina automática). En la actualidad se considera la propuesta a nivel teórico de la primera computadora de la historia de la ciencia.
* Sin embargo, pese a la genialidad de las ideas que Turing manejaba en 1937, estas no eran suficientes para que se materializaran realmente en la construcción de una computadora.
* Lamentablemente, hizo falta un conflicto bélico a gran escala, la Segunda Guerra Mundial, para que matemáticos e ingenieros aunaran esfuerzos para conseguir que se diseñara y construyera la computadora.

## Máquina de Turing

* Es un dispositivo (máquina) abstracto, sin existencia real, que representa la configuración más sencilla de una computadora.
* Turing empezó tratando de modelar a una computadora humana, es decir, a un humano tratando de resolver algorítmicamente un problema utilizando papel y lápiz:
  * Examinar un símbolo individual en el papel.
  * Borrar un símbolo o reemplazarlo por otro.
  * Trasladar la atención de una parte del papel a otra.
* Al igual que los AF y AP, es capaz de reconocer palabras que pertenecen a cualquier lenguaje formal.
* Es el autómata más general, capaz de reconocer las palabras de los lenguajes generados por las gramáticas menos restrictivas.
* Ejemplo: L = {w / |w|a = |w|b = |w|c}

    ```grammar
    S -> SABC | λ
    AB -> BA
    BA -> AB
    AC -> CA
    CA -> AC
    BC -> CB
    CB -> BC
    A -> a
    B -> b
    C -> c
    ```

* Ejemplo: L = {a^nb^nc^n / n ≥ 0}

    ```grammar
    S → aBTc | abc | λ
    T → ABTc |ABc
    BA → BX
    BX → YX
    YX → AX
    AX → AB
    aA → aa
    aB → ab
    bB → bb
    ```

### Arquitectura

* El modelo básico de una MT tiene:
  * una **cinta** lineal teóricamente infinita que se divide en celdas y
  * una **cabeza de lectura/escritura** que lee un sólo símbolo de la cinta por vez controlado un **conjunto finito de estados** que representan los distintos “estados mentales”.
  * Cada celda de la cinta puede contener un solo **símbolo del alfabeto** de la cinta.

![Arquitectura MT](img/MT-arquitectura.png)

### Definición formal

* MT = < Г, Σ, b, Q, q0, F, δ>. Donde:
  * Г: es el alfabeto de símbolos de cinta. Г = Σ U {b} U símbolos_aux.
  * Σ ⊂ Г: es el alfabeto de símbolos de entrada. Como la MT puede escribir en la cinta, es diferente el alfabeto de los símbolos que, inicialmente pueden aparecer en la cinta (Σ) del alfabeto de los símbolos que, en algún momento, pueden aparecer en la cinta (Г). Σ ∩ símbolos_aux = Ø
  * b ∈ Г, b ∉ Σ: es un símbolo de la cinta de entrada especial que representa el espacio en blanco.
  * Q: es el conjunto finito de estados.
  * q0 ∈ Q: es el estado inicial.
  * F incluido o igual Q: es el conjunto de los estados finales.
  * δ: Q x Г -> Q x Г x {L, R, S}: es la función de transición, donde L (left) es izquierda, R (right) es derecha y S (stay) es parada (o no hay movimiento).
    * Sin embargo, δ puede estar indefinida para algunos argumentos, por ejemplo, no se permiten movimientos a izquierda de la celda de inicio de la cinta.
    * Ejemplo: δ(q0, X) = (q1, Y, R) se puede representar gráficamente de la siguiente manera:

![Transicion MT](img/MT-transicion.png)

### Características

* La cinta es infinita, por lo que a los dos lados de la información que aparezca en la entrada, habrá espacios en blanco representado por b. (otros autores consideran: que la cinta tiene una celda de inicio a la izquierda, pero es infinita a derecha).
* Inicialmente contiene un número finito de símbolos de Σ (las n posiciones más a la izquierda de la cinta de entrada contiene la palabra de entrada w, donde |w|= n) precedidos y seguidos de infinitos blancos (símbolo especial b, del alfabeto de la cinta).
* Al igual que el resto de los autómatas, se representa por la tabla de transición en la que en las filas están los estados, en las columnas los símbolos de Г, y en la posición (q, a) aparece δ(q, a).

### Ejemplo: MT que duplica cantidad de unos

![MT duplica 1](img/MT-duplica1.png)

* MT = < Г = {0, 1, □}, Σ = {1}, b = □, Q = {p, q, r, s}, q0 = p, F = {s}, δ)>

| δ | 1 | 0 | □ |
| -- | -- | -- | -- |
| >p | q0R | p0L | r□R |
| q | q1R | q0R | p0L |
| r | - | r1R | s□S |
| *s | -  | - | - |

![MT movimientos](img/MT-movimientos.png)

### Descripciones instantáneas

* Son las configuraciones de una MT.
* Viene determinada por:
  * estado actual
  * contenido de la cinta
  * posicion de la cabeza lectura/escritura sobre la cinta
* Notación: w1qσw2
  * w1: palabra de la cinta que precede a la celda sobre la que se encuentra la cabeza de entrada/salida.
  * q: estado actual.
  * σ: es el símbolo de la cinta sobre el que se encuentra la cabeza de entrada/salida.
  * w2: palabra que hay a continuación de la cabeza de entrada/salida.

### Movimiento

* Se denota el paso de una configuración a otra por medio del símbolo: ├
* Ejemplo: p11 ├ 0q1 ...

### Computación

* Es la secuencia de todos los movimientos que conducen a una configuración de parada.
* Ejemplo: p11 ├* 1111s□

### MT que nunca parará

* La MT se moverá por tiempo indefinido con la cabeza de lectura/escritura desplazándose de derecha a izquierda alternativamente. Se dice que la MT se encuentra en un "bucle infinito".
* Computación: aabq0abb ├* ∞

![MT infinita](img/MT-infinita.png)

### Lenguaje reconocido por una Máquina de Turing

* Una MT se puede comportar como un aceptador de un lenguaje, de la misma forma que lo hace un AF o un AP.
* Una palabra es reconocida por una MT, si dispuesta inicialmente en la cinta de entrada, con la cabeza de lectura en el primer símbolo de la palabra y la MT en el estado inicial, la máquina es capaz de transitar a un estado final y pararse.
* Un lenguaje L es Turing-aceptable si existe una MT que da halt para toda entrada w ∈ L, es decir, la palabra w es aceptada por la MT.
* L(M) = {w ∈ ∑\* / w1qσw2 ├* w1pσw2 ^ p ∈ F ^ wi ∈ Γ}

### Aceptación de palabras por MT

* Una palabra x ∈ Σ* es aceptada por una MT T si empezando con la configuración inicial correspondiente a la palabra x, eventualmente se llega al estado de aceptación ha.
* No es necesario procesar toda la palabra para aceptarla.
* El lenguaje aceptado por T es el conjunto de palabras aceptadas por T.

### Rechazo de palabras por MT

* Una palabra x ∈ Σ* es rechazada por una MT T si empezando con la configuración inicial correspondiente a la palabra x, eventualmente se llega al estado de rechazo hr.
* No es necesario procesar toda la palabra para rechazarla.
* Es costumbre omitir el estado de rechazo y rechazar una palabra cuando no existe una transición, es decir, cuando la máquina se queda "colgada".

### Ejemplo: MT que acepta L = {aw / w ∈ {a, b}*}

* MT = <{a, b, □}, {a, b}, □, {q, a, r}, q, {a}, δ>

| δ | a | b | □ |
| -- | -- | -- | -- |
| >q | aaS | rbS | r□S |
| *a | - | - | - |
| r | - | - | - |

### Ejemplo: MT que acepta L = {wa / w ∈ {a, b}*}

* MT = <{a, b, □}, {a, b}, □, {p, q, a, r}, p, {a}, δ>

| δ | a | b | □ |
| -- | -- | -- | -- |
| >p | paR | pbR | q□L |
| q | aaS | rbS | r□S |
| *a | - | - | - |
| r | - | - | - |

### Ejemplo: MT que acepta L = {0^n1 / n ≥ 0}

* MT = <{0, 1, □}, {0, 1}, □, {p, q, r, a}, p, {a}, δ>

| δ | 1 | 0 | □ |
| -- | -- | -- | -- |
| >p | q1R | p0R | r□R |
| q | r1S | r0S | a□S |
| r | - | - | - |
| *a | -  | - | - |

### Ejemplo: MT que acepta L = {0^n1^n / n ≥ 1}

* MT = <{0, 1, x, y, □}, {0, 1}, □, {q0, q1, q2, q4, q5}, q0, {q4, q5}, δ>

| δ | 1 | 0 | x | y | □ |
| -- | -- | -- | -- | -- | -- |
| >q0 | - | (q1,x,R) | - | (q5,y,R) | - |
| q1 | (q2,y,L) | (q1,0,R) | - | (q1,y,R) | - |
| q2 | - | (q2,0,L) | (q0,x,R) | (q2,y,L) | - |
| *q5 | -  | - | - | (q5,y,R) | (q4,□,S) |
| *q4 | -  | - | - | - | - |

## Modificaciones de las MT

* Existen otras definiciones de las MT que son equivalentes a la original.
* Algunos de esos modelos alternativos son mucho más complicados aunque todos tienen la misma potencia computacional (o de cálculo).
* Muchas de ellas dotan de mayor flexibilidad al diseño de una MT que resuelva un problema particular.
* Variaciones:
  * MT multipistas (cada celda de la cinta se divide en subceldas)
  * MT multidimensionales (permite que la cinta tenga muchas dimensiones, δ: Q x Γ -> Q x Γ x {L, R, U (up), D (down), S})
  * MT multicinta
  * MTND

### MT multicinta

* Tiene varias cintas, cada una de las cuales tiene su propia cabeza de lectura/escritura.
* Las cabezas de lectura/escritura se controlan al mismo tiempo independientemente:
  * No tienen que moverse en la misma dirección.
  * Ni realizar el mismo número de movimientos.
  * Ni incluso, hacer nada a la vez.
* La función de transición para una MT con n cintas es de la forma: δ: Q x Γ^n -> Q x Γ^n x {L, R, S}^n Donde una transición de la forma: δ(q, (σ1, σ2, ..., σn)) = (p, (τ1, τ2, ..., τn), (X1, X2, ..., Xn)). Significa que cambia del estado q a p, reemplaza σi por τi en la cinta i y mueve la cabeza de la cinta i en la dirección Xi.
* Las MT multicinta simplifican en gran medida alguna de las actividades que se desearía hacer con la MT original

![MT multicinta](img/MT-multi.png)

### Ejemplo: MT multicinta (bicinta) que acepta L = {a^nb^n / n ≥ 1}

![MT anbn](img/MT-multi-anbn.png)

* MT = <{a, b, □}, {a, b}, □, {q0, q1, q2, q3}, q0, {q3}, δ>

| δ | C1 | C2 | C1:new | C1:mov | C2:new | C2:mov | Qdest |
| -- | -- | -- | -- | -- | -- | -- | -- |
| q0 | a | □ | a | R | a | R | q1 |
| q1 | a | □ | a | R | a | R | q1 |
| q1 | b | □ | b | S | □ | L | q2 |
| q2 | b | a | b | R | a | L | q2 |
| q2 | □ | □ | □ | R | □ | L | q3 |

### Ejemplo: MT multicinta (bicinta) que acepta L = {a^nb^nc^n / n ≥ 1}

![MT anbncn](img/MT-multi-anbncn.png)

* MT = <{a, b, □}, {a, b}, □, {q0, q1, q2, q3}, q0, {q3}, δ>

| δ | C1 | C2 | C1:new | C1:mov | C2:new | C2:mov | Qdest |
| -- | -- | -- | -- | -- | -- | -- | -- |
| q0 | a | □ | a | R | a | R | q0 |
| q0 | b | □ | b | S | □ | L | q1 |
| q1 | b | a | b | R | a | L | q1 |
| q1 | c | □ | c | S | □ | R | q2 |
| q2 | c | a | c | R | a | R | q2 |
| q2 | □ | □ | □ | S | □ | S | q3 |

## MTND

* Se elimina el requerimiento de que la regla de transición sea una función. Para un estado actual y el símbolo actual de la cinta, puede haber un número finito de movimientos a elegir (la MT proporciona alternativas a la ejecución).
* Por tanto, la regla de transición, ∆, de dicha máquina, satisface: ∆(q, σ) ⊆ Q x Г x {L, R, S}
* Por ejemplo, si la MT tiene una transición ∆(q1, a) = {(q1, b, R), (q2, a, L)}, entonces los movimientos posibles son:
  * abbq1ab ├ abbbq1b
  * abbq1ab ├ abq2bab
* Ejemplo:

![MTND](img/MTND.png)

* ∆(q0, a) = {(q1, a, R), (q2, a, R)}
* Puede verse, que dependiendo del camino de análisis escogido, en algunos casos se acepta una palabra de entrada y en otros se rechaza.
* En las MTND se considera que una palabra es aceptada si existe al menos una forma de analizarla en la que la máquina la acepte.
* Inversamente una palabra será rechazada si queda rechazada por todas las formas posibles de analizarla.
* El lenguaje L(N) aceptado por una MTND N es el conjunto de palabras para las que existe al menos un camino que conduce la máquina a pararse en un estado final.
* Para toda MTND, existe una MT D equivalente, y viceversa.
* Las MTD son un caso particular de las MTND.
* Por tanto, no se gana ninguna potencia adicional a causa del no determinismo.

## Ejercicios diseño de MT-aceptable

1. Palabras con cantidad par de 0’s.
1. Palabras que comienzan y terminan con el mismo símbolo.
1. Palabras del LR representado por la ER aba*
1. Palabras de parejas de paréntesis.
1. Palabras que contengan 1’s y/o 0’s pero no contengan 3 ceros seguidos.
1. Palabras con un número par de x. Ejemplo xx, xxxx, ...
1. Palabras de 1’s cuya longitud es una potencia de 2.
1. Palabras con cantidad de aes igual a cantidad de bes.
1. Palabras con cantidad de aes igual a cantidad de bes e igual a cantidad de ces.

1. {wb / w ∈ {a, b}*}
1. {yx^nzy / n ≥ 0}
1. {ww / w ∈ a {a, b}+}
1. {xww^(-1)y / x, y, w ∈ a {a, b}+ y |x| ≥ |y|}
1. {ww donde w ∈ {a, b}*}
1. {a^nb^kd^(2n)e^(n+1) / k, n ≥ 1} sobre Σ = {a, b, c, d, e}
1. {a^(i+2)b^jc^(2i)d^j / i, j ≥ 0} sobre Σ = {a, b, c, d, e}
1. {b^(2r)a^(n+1)b^nd^je^(r+1) / n, r ≥ 0 y j > r} sobre Σ = {a, b, c, d, e}
1. {a^(n+1)b^nd^ne^k/ n ≥ 0 y k > n} sobre Σ = {a, b, c, d, e}
1. {a^(2n)d^(s+1)b^ke^n/ s ≥ 0 y n, k > 0 y k ≠n} sobre Σ = {a, b, c, d, e}
1. {a^(p+1)d^(2n)b^ne^(2k+1) / p, k ≥ 0 y n > p} sobre Σ = {a, b, c, d, e}
1. {a^nb^(2k+1)d^(p+1)c^k / p, k ≥ 0 y n > p} U {a^nb^(2k+1)e^(2n) / n, k > 0} sobre Σ = {a, b, c, d, e}

## Ejercicios diseño de MT-aceptable multicinta

1. {a^nb^2n/ n ≥ 1}

    ![MT anb2n](img/MT-multi-anb2n.png)

1. {a^nb^nc^(n+1) / n ≥ 1}
1. {ww^(-1) / w ∈ {a, b}+}
