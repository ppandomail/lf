# Autómata Finito (AF)

## Definición

* Es una herramienta abstracta que se utiliza para reconocer un determinado LR.
* Es un modelo formal matemático de un sistema que recibe una cadena constituida por símbolos de cierto alfabeto Σ y tiene capacidad de determinar si esa cadena pertenece al LR que el AF reconoce.
* Es una máquina de estados finitos. Una máquina es una abstracción matemática que capturan solamente el aspecto referente a las secuencias de eventos (transiciones) que ocurren.

## Reconocimiento

* RECONOCER un LR: aceptar cada cadena que es una palabra del LR y rechazar cada cadena que no pertenece al lenguaje.
* Una palabra es aceptada si:
  * Cadena ha sido consumida (se ha analizado todos los símbolos de la cadena)
  * El AF se encuentra en un estado especial llamado ESTADO FINAL o ESTADO DE ACEPTACIÓN.

## Definición formal

* Formalmente un autómata finito se define como una 5-upla:  M = <Q, Σ, q0, F, δ>
  * Q: conjunto finito de estados.
  * Σ: alfabeto (conjunto finito de símbolos) de entrada reconocido por el autómata.
  * q0: estado inicial q0 ∈ Q, único en un conjunto.
  * F: conjunto de estados finales o estados de aceptación, F ⊆ Q.
  * δ: función de transición de estados, δ: Q x Σ -> Q.

## Representación gráfica

* Un autómata generalmente se representa por un grafo dirigido y etiquetado (etiquetas posibles: ó o λ), llamado diagrama de transición de estados.
* Cada nodo o vértice representa un estado.
* Cada flecha o arista representa una transición.
* El estado inicial se representa con un nodo con una flecha que no tiene origen.
* Los estado finales se representan por doble círculo.

![AF a*b](img/af1.png)

## Casos

* ACEPTACIÓN: cadena ab
  * ACTIVIDAD:  q0 -> a -> q0 -> b -> q1   ACEPTA
  * Se dice que la cadena w es aceptada por el AF M cuando δ(q0, w) ∈ F
  * Se define el Lenguaje aceptado por el AF M como: L(M) = {w ∈ Σ* / δ(q0, w) ∈ F}
* RECHAZO: cadena a
  * ACTIVIDAD:  q0 -> a -> q0    RECHAZA
* RECHAZO: cadena abab
  * ACTIVIDAD:  q0 -> a -> q0 -> b -> q1 -> a -> ?  RECHAZA

## Malos diseños

* **Incorrecto**: "Sobran palabras". El autómata acepta algunas palabras que no debería aceptar.
* **Incompleto**: "Faltan palabras". Palabras en el lenguaje que no son aceptadas por el autómata cuando debería serlo.

## Tipos de AF

* **Autómatas Finitos Deterministas (AFD)**:
  * Deterministic Finite Automaton.
  * Para cualquier estado en que se encuentre el autómata en un momento dado, la lectura de un símbolo determina, SIN AMBIGÜEDADES, cuál será el estado de llegada en la próxima transición. (unívocamente determinado)
  * Es un AFN (ya que es un caso especial).
  * Se puede encontrar un AFD por cada AFN que acepte el mismo lenguaje.
* **Autómatas Finitos No Deterministas (AFN)**:
  * Non-deterministic Finite Automaton.
  * Permite cero, una o más transiciones a partir de un estado con un determinado símbolo de entrada.
  * Una cadena de entrada se dice que es aceptada por un AFN si existe una secuencia de transiciones, correspondiente a la cadena de entrada, que lleva del estado inicial a algún estado final.
  * Acepta transiciones vacías: el autómata puede cambiar de estado sin tener que leer ningún símbolo de la entrada (arcos sin etiquetas entre pares de estados).

## Ejemplos AFD

* L = {ab^n / n ≥ 0} = {a, ab, abb, abbb, ...}
  * Q = {q0, q1}
  * Σ = {a, b}
  * q0 = q0
  * F = {q1}
  * δ = {δ(q0, a) = q1, δ(q1, b) = q1}

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | - |
    | *q1 | - | q1 |

* L = {a^ncb^m / n > 0 ^ m ≥ 0} = {ac, acb, aaaac, acbbbb, aaaacbbbbb, ...}
  * Q = {q0, q1, q2}
  * Σ = {a, b, c}
  * q0 = q0
  * F = {q2}
  * δ = {δ(q0, a) = q1, δ(q1, a) = q1, δ(q1, c) = q2, δ(q2, b) = q2}

    | Q | a | b | c |
    | -- | -- | -- | -- |
    | >q0 | q1 | - | - |
    | q1 | q1 | - | q2 |
    | *q2 | - | q2 | - |

* L = {00w1 / w ∈ {0, 1}*} = {001, 00001101, 00110011, ...}
  * Q = {q0, q1, q2, q3}
  * Σ = {0, 1}
  * q0 = q0
  * F = {q3}
  * δ = {δ(q0, 0) = q1, δ(q1, 0) = q2, δ(q2, 0) = q2, δ(q2,1) = q3,  δ(q3, 0) = q2, δ(q3, 1) = q3}

    | Q | 0 | 1 |
    | -- | -- | -- |
    | >q0 | q1 | - |
    | q1 | q2 | - |
    | q2 | q2 | q3 |
    | *q3 | q2 | q3 |

* L = {wc^3m / w ∈ {a, b}* y la cantidad de b´s es par ^ m ≥ 0} = {λ, a, bb, ccc, accc, abbcccccc, babaccc, ...}
  * Q = {q0, q1, q2, q3, q4}
  * Σ = {a, b, c}
  * q0 = q0
  * F = {q0 ,q4}
  * δ = {δ(q0, a) = q0, δ(q0, b) = q1, δ(q1, a) = q1, δ(q1, b) = q0,  δ(q0, c) = q2, δ(q2, c) = q3, δ(q3, c) = q4,  δ(q4, c) = q2}

    | Q | a | b | c |
    | -- | -- | -- | -- |
    | >*q0 | q0 | q1 | q2 |
    | q1 | q1 | q0 | - |
    | q2 | - | - | q3 |
    | q3 | - | - | q4 |
    | *q4 | - | - | q2 |

* ER = a (a | ba*)  L = {aa, ab, aba, abaa, abaaa, ...}
  * Q = {q0, q1, q2, q3}
  * Σ = {a, b}
  * q0 = q0
  * F = {q2, q3}
  * δ = {δ(q0, a) = q1, δ(q1, a) = q2, δ(q1, b) = q3, δ(q3, a) = q3}

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | - |
    | q1 | q2 | q3 |
    | *q2 | - | - |
    | *q3 | q3 | - |

## AF completo

* Un AF es completo si cada estado tiene exactamente una transición por cada símbolo del alfabeto.
* Un AF es completo cuando su tabla de transiciones no tiene "huecos";  si los tiene, el AF es incompleto.
* Completar un AF significa eliminar los "huecos" de su tabla de transiciones, agregando un nuevo estado, que se denomina ESTADO DE RECHAZO o ESTADO DE NO ACEPTACIÓN o ESTADO DE ERROR (qe)
* Ejemplo:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | qe |
  | q1 | q2 | q3 |
  | *q2 | qe | qe |
  | *q3 | q3 | qe |
  | qe | qe | qe |

## AF equivalentes

* Dos AF son EQUIVALENTES si reconocen al mismo LR.
* Ejemplos:

  | Q | a | b |
  | -- | -- | -- |
  | >*q0 | q0 | q1 |
  | q1 | q0 | q1 |

  | Q | a | b |
  | -- | -- | -- |
  | >*q0 | q1 | q2 |
  | *q1 | q1 | q2 |
  | q2 | q0 | q2 |

## Ejemplos AFN

* L = {a^nb^m / n ≥ 1 ^ m ≥ 0} = {a, aa, ab, abb, ...}

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | {q0, q1} | - |
  | *q1 | - | q1 |

* L = {w / w ∈ {0, 1}* y w contiene la subpalabra 00 o w contiene la subpalabra 11} = {00, 11, 000101010, 101011010, 10100, ...}

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | {q0, q3} | {q0, q1} |
  | q1 | - | q2 |
  | *q2 | q2 | q2 |
  | q3 | q4 | - |
  | *q4 | q4 | q4 |

* ER = (a | b)* abb

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | {q0, q1} | q0 |
  | q1 | - | q2 |
  | q2 | - | q3 |
  | *q3 | - | - |

## Algoritmo AFN -> AFD

1. Completar la Tabla de Transiciones con todos los Q del AFN.
1. Nuevos estados pasan a ser filas de la Tabla de Transiciones.
1. [q0q1] para cada símbolo del Alfabeto.
    * [q0] U [q1]
    * Ejemplo a: [q0q1] U [-] = [q0q1]
    * Ejemplo b: [q0] U [q2] = [q0q2]
1. Si los estados se repiten en la unión se deja uno.
1. Si en el nuevo estado luego de la unión se encuentra el estado final, entonces también es final.
1. Se eliminan estados no accesibles desde q0.

* Ejemplo:

  | Q | a | b |
  | -- | -- | -- |
  | >[q0] | [q0q1] | [q0] |
  | [q1] | - | [q2] |
  | [q2] | - | [q3] |
  | *[q3] | - | - |
  | [q0q1] | [q0q1] | [q0q2] |
  | [q0q2] | [q0q1] | [q0q3] |
  | *[q0q3]| [q0q1] | [q0] |

## Operaciones con AF

* Complemento: Se define el autómata complementario Mc como aquel que se obtiene a partir de M dando a los estados no aceptadores el carácter de aceptadores y viceversa  L(M^c) = ~L(M)
  * M^c = (Q, Σ, q0, F = Q - F, δ)

* Intersección: M1 ∩ M2
  * M = (Q = Q1 x Q2, Σ, q0 = q1,q2,  F = F1 x F2
  * ∀p ∈ Q1, ∀q ∈ Q2, ∀w ∈ Σ*
  * δ((p, q), w) = (δ1(p, w), δ2(q, w))
  * (p, q)w = (pw, qw)

* Unión: M1 U M2
  * M = (Q = Q1 U Q2, Σ, q0 = q1 U q2, F = F1 U F2, δ = δ1 U δ2)
  * δ(q, w) = δ1(q, w) si q ∈ Q1
  * δ(q, w) = δ2(q, w) si q ∈ Q2

* Concatenación: M1.M2
  * M = (Q = Q1 U Q2, Σ, q0 = q1, F = F2
  * δ(q, a) = δ1(q, a) si q ∈ Q1 y a ∈ Σ
  * δ(q, a) = δ2(q, a) si q ∈ Q2 y a ∈ Σ
  * δ(q, λ) = q2  ∀q ∈ F1

## Algoritmos con AF

* Algoritmo de Thompson: ER -> AFNλ
* Algoritmo de Clausura-λ: {AFN, AFNλ} -> AFD
* Algoritmo AF -> ER
* Algoritmo de Clases: AFD -> AFDmin

### Algoritmo de Thompson: ER -> AFNλ

* Ejemplo: a(a|b)*

1. Desmembrar la ER de partida en sus componentes básicos, es decir; símbolos, operadores (precedencia: *, ., |) y λ, si este símbolo forma parte de la ER.
1. Generar un AF básico por cada símbolo o λ de la ER.

  | Q | a |
  | -- | -- |
  | >q0 | q1 |
  | *q1 | - |

  | Q | a |
  | -- | -- |
  | >q2 | q3 |
  | *q3 | - |

  | Q | b |
  | -- | -- |
  | >q4 | q5 |
  | *q5 | - |

1. Componer estos AF básicos según los operadores existentes en la ER, hasta lograr el AF que reconoce a la ER dada. El AF que se obtiene es un AFNλ.

    * **Autómata para la unión**:
      1. Los estados iniciales de los AF básicos dejan de ser iniciales y los estados finales dejan de ser finales.
      1. Se agrega un nuevo estado inicial.
      1. Se agregan dos transiciones-λ que relacionan al nuevo estado inicial con los dos ex estados iniciales.
      1. Se agrega un nuevo estado final.
      1. Se agregan dos transiciones-λ para unir a los dos ex estados finales con este nuevo estado final, y el AF está construido.

          | Q | a | b | λ |
          | -- | -- | -- | -- |
          | >q6 | - | - | {q2, q4} |
          | q2 | q3 | - | - |
          | q4 | - | q5 | - |
          | q3 | - | - | q7 |
          | q5 | - | - | q7 |
          | *q7 | _ | _ | _ |

    * **Autómata para la clausura de Kleene**:
      1. El estado inicial deja de ser inicial y el estado final deja de ser final.
      1. Se agrega un nuevo estado inicial y un nuevo estado final.
      1. Se agrega una transición-λ desde el nuevo estado inicial hasta el ex estado inicial.
      1. Se agrega una transición-λ desde el ex estado final al nuevo estado final.
      1. Se agrega una transición-λ desde el nuevo estado inicial al nuevo estado final (para que reconozca la palabra vacía)
      1. Se agrega una transición-λ desde el ex estado final al ex estado inicial (para reconocer la repetición del símbolo).

          | Q | a | b | λ |
          | -- | -- | -- | -- |
          | >q8 | - | - | {q6, q9} |
          | q6 | - | - | {q2, q4} |
          | q2 | q3 | - | - |
          | q4 | - | q5 | - |
          | q3 | - | - | q7 |
          | q5 | - | - | q7 |
          | q7 | _ | _ | {q9, q6} |
          | *q9 | - | - | - |

    * **Autómata para la concatenación**:
      1. Se construyen los AF básicos (izquierdo y derecho).
      1. El estado final del izquierdo deja de ser final y el estado inicial del derecho deja de ser inicial (los otros estados no se alteran).
      1. Se agrega una transición-λ que vincule al ex estado final del izquierdo con el ex estado inicial del derecho.
      1. El AFN ya está terminado, siendo su estado inicial el estado inicial del izquierdo, y siendo su estado final el estado final del derecho.

          | Q | a | b | λ |
          | -- | -- | -- | -- |
          | >q0 | q1 | - | - |
          | q1 | - | - | q8 |
          | q8 | - | - | {q6, q9} |
          | q6 | - | - | {q2, q4} |
          | q2 | q3 | - | - |
          | q4 | - | q5 | - |
          | q3 | - | - | q7 |
          | q5 | - | - | q7 |
          | q7 | _ | _ | {q9, q6} |
          | *q9 | - | - | - |

### Algoritmo de Clausura-λ: {AFN, AFNλ} -> AFD

* Ejemplo: a*b

  | Q | a | b | λ |
  | -- | -- | -- | -- |
  | >q0 | - | - | {q1, q3} |
  | q1 | q2 | - | - |
  | q2 | - | - | {q1, q3} |
  | q3 | - | - | q4 |
  | q4 | - | q5 | - |
  | *q5 | - | - | - |

* Clausura-λ de un estado: c-λ(q) = {q} U {estados a los cuales se llega desde q usando λ}
  * c-λ(q0) = {q0, q1, q3, q4}
  * c-λ(q2) = {q2, q1, q3, q4}
* Clausura-λ de un conjunto de estados: c-λ({q1, q2}) = c-λ(q1) U c-λ(q2)
* Conjunto "HACIA": h(c-λ(q), ó) = {estados de llegada}
  * h(c-λ(q0), a) = {q2}
  * h(c-λ(q0), b) = {q5}

1. Se obtiene el estado inicial del AFD, que es la clausura-λ del estado inicial del AFN.
1. Se agrega este estado a la primera columna de la Tabla.
1. Para cada símbolo del alfabeto, se calcula el conjunto hacia del estado que se acaba de agregar a la primera columna de la tabla.
1. Se determinan nuevos estados del AFD por medio de la clausura- λ de cada conjunto hacia recién obtenido. Estos estados (conjuntos) se incorporan a la tabla, en las columnas que les corresponden.
1. Si un nuevo estado obtenido en el punto anterior no existe todavía en la primera columna de la Tabla de Transiciones se lo agrega.
1. Se repiten los pasos (3) al (5) hasta que no surjan nuevos estados.

* Los estados finales del AFD son todos aquellos conjuntos de estados del AFN que contienen por lo menos, un estado final.

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | h(c-λ(q0), a) = {q2} | h(c-λ(q0), b) = {q5} |
  | q2 | h(c-λ(q2), a) = {q2} | h(c-λ(q2), b) = {q5} |
  | *q5 | h(c-λ(q5), a) = {} | h(c-λ(q5), b) = {} |

### Algoritmo AF -> ER

1. Depurar el AF: detectar y eliminar todos los estados erróneos y todas las referencias que haya a estos estados.
    * Estados a los que no se puede llegar desde el estado inicial (estados inalcanzables).
    * Estados que no conducen a un estado final (estados de rechazo).

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q2 |
    | q1 | q1 | q4 |
    | q2 | q4 | q5 |
    | q3 | q4 | q4 |
    | *q4 | q5 | q4 |
    | q5| q5 | q5 |

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q2 |
    | q1 | q1 | q4 |
    | q2 | q4 |  |
    | *q4 | - | q4 |

1. Establecer un Sistema de Ecuaciones:
    * Tendrá tantas ecuaciones como estados tenga el AF.
    * Cada ecuación tiene:
      * En su lado izquierdo, el estado cuyo comportamiento es descrito por una ecuación.
      * En su lado derecho, la unión de términos que representan las transiciones que parten del estado mencionado en el lado izquierdo. Cada uno de estos términos se forma mediante el símbolo que etiqueta a la transición concatenado con el estado de llegada. La única excepción se produce cuando se desarrolla la ecuación de un estado final, en este caso, se agrega un término λ para indicar que este estado, por ser final, acepta una palabra que finalice cuando el AF llega a este estado.

1. Reducir:
    * Se debe realizar en una ecuación que tiene uno o más ciclos. En estas ecuaciones se puede apreciar que el estado que figura en el lado izquierdo de la ecuación también se encuentra en el lado derecho. Por ello, una ecuación con estas características se las denomina ecuación recursiva, cuyo formato es: q = αq + β
      * q: estado.
      * α: ER.
      * β: ER que puede estar formada por símbolos, λ y estados.
    * Cuando existe una ecuación recursiva, ésta se debe reducir aplicando el Lema de Arden, de esta forma: q = αq + β = α*β
      * Ejemplo 1: q0 = aq0 + bq1 + λ = aq0 + (bq1 + λ) = a*(bq1 + λ)
      * Ejemplo 2: q2 = (a + b)q2 + aq1 = (a + b)*aq1

1. Resolver el Sistema de Ecuaciones (sustituir):
    * Puede realizarse en cualquier orden, con una sola excepción: la ecuación que corresponde al estado inicial debe ser la última en resolverse porque en su lado derecho quedará la ER buscada.

* Ejemplo 1:
  1. OK
  1. q0 = aq1   q1 = λ
  1. OK
  1. q0 = aq1 = aλ = a

* Ejemplo 2:
  1. OK
  1. q0 = aq1 + λq2    q1 = λ      q2 = λ
  1. OK
  1. q0 = aq1 + λq2 = aλ + λλ = a + λ

* Ejemplo 3:
  1. OK
  1. q0 = aq0 + bq1 + λ   q1 = λ
  1. q0 = a*(bq1 + λ)
  1. q0 = a*(bq1 + λ) = a*(bλ + λ) = a*(b + λ)

* Ejemplo 4:
  1. OK
  1. q0 = aq2 + bq5     q2 = aq2 + bq5    q5 = λ
  1. q2 = aq2 + bq5 = a*bq5
  1. Sustituir:
      * q2 = a\*bq5 = a\*b
      * q0 = aq2 + bq5 = aa\*b + bλ = aa\*b + b

* Ejemplo 5:
  1. OK
  1. q0 = aq0 + bq0 + aq1 = (a + b)q0 + aq1     q1 = λ
  1. q0 = (a + b)q0 + aq1 = (a + b)*aq1
  1. q0 = (a + b)\*aq1 = (a + b)\*aλ = (a + b)\*a

* Ejemplo 6:
  1. OK
  1. q0 = aq0 + bq0 + λ = (a + b)q0 + λ
  1. q0 = (a + b)*
  
* Ejemplo 7:
  1. OK
  1. q0 = aq1    q1 = bq2 + λ    q2 = aq2 + bq2 + aq1 = (a + b)q2 + aq1
  1. q2 = (a + b)*aq1
  1. Sustituir:
      * q1 = bq2 + λ = b(a + b)\*aq1 + λ = (b(a + b)\*a)\*
      * q0 = aq1 = a(b(a + b)\*a)\*

* Ejemplo 8:
  1. OK
  1. q0 = 0q0 + 1q1            q1 = 0q1 + 1q2 + λ                    q2 = 0q2 + 1q1
  1. q0 = 0q0 + 1q1 = 0\*1q1   q1 = 0q1 + 1q2 + λ = 0\*(1q2 + λ)     q2 = 0q2 + 1q1 = 0\*1q1
  1. Sustituir:
      * q1 = 0\* (10\*1q1 + λ) = 0\* 10\*1q1 + 0\* = (0\* 10\*1)\*0\*
      * q0 = 0\*1(0\* 10\*1)\*0\*

* Ejemplo 9:
  1. OK
  1. s = Ss + Ut                t = Tt +Vs + λ
  1. s = S\*Ut                  t = T\*(Vs + λ) = T\*Vs + T\*
  1. s = S\*U(T\*Vs + T\*) = S\*UT\*Vs + S\*UT\* = (S\*UT\*V)\*S\*UT\*

* Ejemplo 10:
  1. OK
  1. p = 0q + 1r    q = 0s + 1r       r = 0q + 1s     s = 0s + 1s + λ
  1. s = (0 + 1)s + λ = (0 + 1)\* λ = (0 + 1)\*
  1. Sustituir:
      * r = 0q + 1s = 0q + (0 + 1)\*
      * q = 0(0 + 1)\* + 1r = 0(0 + 1)\* + 1(0q + (0 + 1)\*) = 0(0 + 1)\* + 10q + 1(0 + 1)\* = (10)\*(0(0 + 1)\* + 1(0 + 1)\*) = (10)\*(0 + 1)(0 + 1)\*
      * r = 0(10)\*(0 + 1)(0 + 1)\* + (0 + 1)\*
      * p = 0(10)\*(0 + 1)(0 + 1)\*  + 1(0(10)\*(0 + 1)(0 + 1)\* + (0 + 1)\*)

* Ejemplo 11:
  1. OK
  1. p = ap + bq + cr    q = aq + bp     r = cs     s = ct     t = cr + λ
  1. p = ap + bq + cr = a*(bq + cr)      q = aq + bp = a*bp
  1. Sustituir:
      * s = ct = c(cr + λ) = ccr + cλ = ccr + c
      * r = cs = c(ccr + c) = cccr + cc = (ccc)*cc
      * q = a\*bp = a\*ba\*(bq + cr) = a\*ba\*bq + a\*ba\*c(ccc)\*cc = (a\*ba\*b)\*a\*ba\*c(ccc)\*cc
      * p = a\*(bq + cr) = a\*bq + a\*cr = a\*b(a\*ba\*b)\*a\*ba\*c(ccc)\*cc + a\*c(ccc)\*cc(λ | (a | ba\*b)\*) ccc (ccc)\*

### Algoritmo de Clases: AFD -> AFDmin

* Es el AFD con la mínima cantidad de estados que reconoce a un LR. Por ello, se lo considera como el único autómata óptimo asociado a la aceptación de determinado LR.
* Tiene la TT más reducida, con menor cantidad de filas, hecho que beneficia la implementación del AFD mediante un programa de computadora.
* Ejemplo:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q2 |
  | q1 | q3 | q4 |
  | q2 | q7 | q8 |
  | q3 | q3 | q2 |
  
  | q8 | q8 | q8 |

1. Particionar el conjunto de estados del AFD completo en dos clases: la clase de los estados no finales (C0) y la clase de los estados finales (C1)

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q2 |
  | q1 | q3 | q4 |
  | q2 | q7 | q8 |
  | q3 | q3 | q2 |
  | q8 | q8 | q8 |
  | -- | -- | -- |
  | *q4 | q5 | q8 |
  | *q5 | q6 | q8 |
  | *q6 | q6 | q8 |
  | *q7 | q8 | q8 |

1. Detectar estados equivalentes y reducir el AFD:
    * Dos estados son equivalentes si:
      * Pertenecen a la misma clase y
      * Tienen el mismo comportamiento (n-upla formada por los estados de su fila en la TT). Por ejemplo el comportamiento de q0 es (q1, q2) y de q4 es (q5, q8).
    * En el ejemplo, en C0 no hay estados equivalentes, mientras que en C1, q5 tiene el mismo comportamiento que q6: (q6, q8).
    * Si dos o más estados son equivalentes, significa que sólo uno de ellos es necesario porque tienen el mismo comportamiento.
    * Reducir el AFD, el cual quedará con uno solo de los estados equivalentes como representante del conjunto de estados equivalentes. Reemplazar referencias por el nombre del estado que permanecerá.

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q2 |
  | q1 | q3 | q4 |
  | q2 | q7 | q8 |
  | q3 | q3 | q2 |
  | q8 | q8 | q8 |
  | -- | -- | -- |
  | *q4 | q5 | q8 |
  | *q5 | q5 | q8 |
  | *q7 | q8 | q8 |

    * Continuar reduciendo, ya que ahora q4 y q5 son estados equivalentes.

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q2 |
  | q1 | q3 | q4 |
  | q2 | q7 | q8 |
  | q3 | q3 | q2 |
  | q8 | q8 | q8 |
  | -- | -- | -- |
  | *q4 | q4 | q8 |
  | *q7 | q8 | q8 |

1. Construir la "Tabla de Transiciones por Clases (TTC)".

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | C0 | C0 |
  | q1 | C0 | C1 |
  | q2 | C1 | C0 |
  | q3 | C0 | C0 |
  | q8 | C0 | C0 |
  | -- | -- | -- |
  | *q4 | C1 | C0 |
  | *q7 | C0 | C0 |

1. Buscar estados equivalentes por clase y realizar la partición de la clase en subclases.
    * Buscar estados equivalentes por clase, que son aquellos estados que están en la misma clase y tienen el mismo comportamiento por clases.
    * Realizar la partición de la clase en subclases que se caracterizan por contener estados que son equivalentes por clase. Y este proceso continúa hasta que se llega a la situación en que cada clase está formada por un solo estado, con lo que se deduce que el AFD no se puede minimizar más. En este último caso, se elige un representante de la clase como se ha hecho anteriormente.

  | Q | a | b | C |
  | -- | -- | -- | -- |
  | >q0 | C0 | C0 | C0 |
  | q3 | C0 | C0 | |
  | q8 | C0 | C0 | |
  | -- | -- | -- | -- |
  | q1 | C0 | C1 | C2 |
  | -- | -- | -- | -- |
  | q2 | C1 | C0 | C3 |
  | -- | -- | -- | -- |
  | *q4 | C1 | C0 | C1 |
  | -- | -- | -- | --  |
  | *q7 | C0 | C0 | C4 |

1. Mientras surjan nuevas clases, actualizar la TTC a partir de la TT original.
    * Actualizar la TTC porque al haber particionado las clases originales, la TTC ha cambiado. Por ejemplo, leyendo la TT original, vemos que el estado q0 tiene comportamiento (q1, q2); y se observa que, con esta última partición, el estado q1 pertenece a la clase C2, mientras que el estado q2 pertenece a la clase C3, y así...
    * Las clases C2, C3, C1 y C4 ya son mínimas porque cada una está constituida por un solo estado. En cuanto a la clase C0, se distingue que está formada por 3 estados que ahora tienen diferentes comportamientos por clases, por lo que se debe separar, colocando a cada uno en una nueva subclase. Finalmente, todas las clases quedan con un único estado y el AFD no se puede minimizar más.
    * En definitiva, y volviendo a la TT original, el AFD mínimo sin completar (es decir, sin estado de rechazo q8) está representado por la siguiente tabla:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q2 |
  | q1 | q3 | q4 |
  | q2 | q7 | - |
  | q3 | q3 | q2 |
  | *q4 | q4 | - |
  | *q7 | - | - |

![AFmin](img/afmin.png)

### Complemento

* El complemento de un AFD ya es un AFD que se obtiene invirtiendo los estados finales y no finales, es decir:
  * Todo estado no final del AFD dato será un estado final del AFD complemento, y
  * Todo estado final del AFD dato será un estado no final del AFD complemento. Por esta situación, es muy importante que el AFD dato esté completo, ya que su estado de rechazo se convierte en un estado final.
* Formalmente, sea un AFD M = \<Q, Σ, q0, F, δ\>. Entonces, el autómata complemento se define Mc = \<Q, Σ, q0, Q – F, δ\>.
* La única diferencia entre el AFD dato y el AFD resultado radica en el conjunto de estados finales: en el AFD resultado, el conjunto Q – F es el complemento, con respecto al conjunto total de estados, del conjunto de estados finales del AFD original.
* Ejemplo: Sea el lenguaje L: "Todas las palabras sobre el alfabeto {a, b} que comienzan con b y tienen longitud mayor o igual que tres".

  | Q | a | b |
  | -- | -- | -- |
  | >q5 | q9 | q6 |
  | q6 | q7 | q7 |
  | q7 | q8 | q8 |
  | *q8 | q8 | q8 |
  | q9 | q9 | q9 |

  | Q | a | b |
  | -- | -- | -- |
  | >*q5 | q9 | q6 |
  | *q6 | q7 | q7 |
  | *q7 | q8 | q8 |
  | q8 | q8 | q8 |
  | *q9 | q9 | q9 |

### AFD -> GR

* AFD = \<Q, Σ, q0, F, δ\>
* Se construye la gramática equivalente lineal por la derecha GR = \<ΣT, ΣN, S, P\> en la que P:
  * Si δ(q, a) = p entonces q -> ap, (a ∈ Σ, q ∈ Q, p ∈ Q)
  * Si δ(q, a) = p y p ∈ F, entonces q -> a, (a ∈ Σ, q ∈ Q, p ∈ Q)
  * Si q0 ∈ F, entonces q -> λ.

* Ejemplo 1:

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | q1 | q2 |
  | q1 | q1 | q3 |
  | *q2 | q0 | q4 |
  | q3 | q3 | q3 |
  | *q4 | q0 | q4 |

      ```plain
      q0 -> 0q1 | 1q2 | 1
      q1 -> 0q1 | 1q3
      q2 -> 0q0 | 1q4 | 1
      q3 -> 0q3 | 1q3 
      q4 -> 0q0 | 1q4 | 1
      ```

* Ejemplo 2:

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >S | A | B |
  | A | C | B |
  | B | A | C |
  | *C | C | C |

      ```plain
      S -> 0A | 1B 
      A -> 0C | 1B | 0
      B -> 0A | 1C | 1
      C -> 0C | 1C | 0 | 1
      ```

* Ejemplo 3:

  | Q | a | b | c |
  | -- | -- | -- | -- |
  | >*A | A | B | C |
  | B | B | A | - |
  | C | - | - | D |
  | D | - | - | E |
  | *E | - | - | C |

      ```plain
      A -> aA | bB | cC | λ | a
      B -> aB | bA | b
      C -> cD 
      D -> cE | c
      E -> cC 
      ```

### GR -> AF

* GR = \<ΣT, ΣN, S, P\>
* Se construye el autómata equivalente AF = \<Q, Σ, q0, F, δ\>. Donde:
  * Q = ΣN U {F},  Σ = ΣT , q0 = S
  * F = {F}, donde F ∉ ΣN  es un nuevo símbolo no terminal.
  * δ:
    * Si A -> vB entonces δ(A, v) = B
    * Si A -> v entonces δ(A, v) = F
    * Si S -> λ entonces δ(S, λ) = F

          ```plain
          A -> 0B | λ
          B -> 1C | 1
          C -> 0B
          ```

          | Q | a | b | λ |
          | -- | -- | -- | -- |
          | >A | B | - | F |
          | B | - | {C, F} | - |
          | C | B | - | - |
          | *F | - | - | - |

    * AF <{A, B, C, F}, {0, 1}, A, {F}, {δ(A, 0) = B, δ(A, λ) = F, δ(B, 1) = C, δ(B, 1) = F, δ(C, 0) = B}>

## Lema del bombeo para LR

* Se utiliza para demostrar que determinados lenguajes infinitos no son regulares.
* Dado un lenguaje L, ¿L es LR?
  * Si L es finito, es LR y se podrá construir un AF o una ER.
  * Si L es especificado por medio de un AF o una ER.
  * Si L es infinito se deben obtener algunas propiedades que comparten todos los LR infinitos y que no estén presentes en los lenguajes no regulares.
* Cómo conseguir un LR infinito si se tiene un número finito de estados en un AF.
* Sea L un LR infinito.
* Existe una constante n tal que para toda palabra w perteneciente a L con |w| ≥ n, se puede descomponer w en tres palabras, w = xyz, de modo que:
  * |y| ≥  1 ; es decir, y ≠ λ
  * |xy| ≤ n
  * Para todo k ≥ 0, la palabra xy^kz también pertenece a L.
* Con otras palabras…
  * Si un AFD es capaz de aceptar un número infinito de palabras, entonces debe aceptar una palabra que consista en la concatenación de tres segmentos (xyz) tales que cualquier repetición del segmento central (y, que no es vacío) dé como resultado otra palabra aceptable.
  * Es decir, pueden generarse otras palabras aceptables "bombeando" o "ampliando" una palabra aceptable.
* El lema de bombeo sólo resulta útil cuando el lenguaje al que se aplica es infinito, pues todos los lenguajes finitos son LR (todos ellos pueden expresarse mediante una expresión regular que se limita a enumerar sus elementos, separándolos con el meta símbolo |).
* El lema de bombeo afirma que, si un LR contiene una palabra suficientemente larga, esta palabra tiene una subpalabra (y) que se puede bombear, es decir, repetirse tantas veces como se quiera, sin que el resultado deje de ser una palabra del LR.
* Este lema define una condición necesaria, pero no suficiente para que un lenguaje sea regular.
* Existen versiones del lema de bombeo que proporcionan condiciones necesarias y suficientes para que un lenguaje sea regular. Uno de ellos es el primer teorema de Myhill-Nerode.

* L = {ab^na / n > 0}

![Lema del Bombeo](img/lb1.png)

* L = {a^nb^n / n > 0}

![Lema del Bombeo](img/lb2.png)

## Aplicaciones

* Los AF se usan frecuentemente en los problemas que implican el análisis de cadenas de caracteres. Ejemplos:
  * Búsqueda de la existencia de una cadena en un archivo.
  * Reconocimiento de cadenas de entrada que satisfaga ciertos criterios (por ejemplo, si se espera un entero sin signo como dato de entrada y el usuario confunde uno de los dígitos con un carácter no numérico, se puede dar todo tipo de resultados impropios, desde una terminación anormal hasta el cálculo de resultados incorrectos).
  * Solución: especificar la información correcta por medio de ER: Ejemplo: L(L|D|_)*(L|D)

## Ejercicios

1. ¿Existirá un AF que reconozca {ab, abc}?. Justifique su respuesta. Si existe, ¿ese AF reconoce la palabra abb?. Justifique su respuesta.
1. Investigue e informe si un AP puede reconocer a un LR. Investigue e informe si una MT puede reconocer a un LR.
1. Sea el alfabeto {a, b} y sea el LR {a, aba}. Dibuje el diagrama de transiciones de un AF que reconoce este LR. Describa los diferentes casos posibles y sus actividades.
1. ¿Qué LR reconoce este AF? Escriba una ER que lo represente.

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | q1 | q3 |
  | q1 | - | q2 |
  | *q2 | - | - |
  | q3 | q2 | - |

1. Diseñe un AF que reconozca la ER a\*bb\*a. Dibuje el DT, y muestre las actividades para diferentes casos.
1. Describa las diferentes actividades de este AF:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | - |
  | q1 | q2 | - |
  | q2 | q3 | - |
  | q3 | - | q4 |
  | *q4 | - | q4 |

1. Sea el LR representado por la ER (a|b|c|d)*. Dibuje el DT de un AF que reconozca este LR.
1. Dado el AF, describa su actividad para la palabra abababa.

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | - |
  | q1 | - | q2 |
  | *q2 | q1 | - |

1. Describa la actividad de este AF para las palabras: λ, ab, abab, aba, abb.

  | Q | a | b |
  | -- | -- | -- |
  | >*q0 | q1 | - |
  | q1 | - | q0 |

1. Dibuje el DT de un AF que reconoce el lenguaje a(ab)+
1. Dibuje el DT de un AF que reconoce el LR representado por la ER a*|ab
1. Escriba la definición formal del AFD que reconozca el LR "Todas las palabras sobre el alfabeto {a, b, c} que tienen por lo menos tres letras". Representa la función de transiciones mediante una TT.
1. Sea el AFD definido formalmente de la siguiente manera: M = (Q, Σ, q0, F, δ), donde: Q = {0, 1, 2, 3}; Σ = {a, b, c}; q0 = 0; F = {2, 3}; δ ={δ(0, a) = 1, δ(1, c) = 2, δ(1, b) = 3, δ(3, a) = 3}. a) Describa formalmente, el AFD equivalente con la TT completa. b) Escriba una ER que represente al LR reconocido por este AFD.
1. Dibuje el AF del LR: "Todos los números enteros en base 10 que pueden estar precedidos por un signo". Algunas palabras de este lenguaje son: 6, 1234, -47822, +9876543210, 000. Algunas palabras que no pertenecen a este lenguaje son: 123A, *66, 14.25. Considerar que el alfabeto original son todos los símbolos ASCII. Para simplificar, suponer que el alfabeto del AFD está formado por tres símbolos: S, que representa a cualquiera de los dos signos; D, que representa a cualquiera de los diez dígitos decimales; y O, que representa a cualquier otro símbolo.
1. Defina formalmente un AFN que reconozca al LR representado por la ER (a|b)\*a(a|b)\*b
1. Defina formalmente un AFN con transiciones λ que reconozca al LR representado por la siguiente ER ab\*|a\*b|aa\*
1. Defina formalmente un AFN con transiciones λ que reconozca al LR representado por la siguiente ER 0\*11|001\*|01\*00
1. Sea el lenguaje "Todos los números binarios que contienen una secuencia de exactamente dos ceros por lo menos una vez". Dibuje el DT de un AFN o de un AFD que lo reconozca. Escriba su definición formal.
1. Dibuje el DT del AF que se obtiene aplicando Thompson para reconocer la ER:  b | λ
1. Dibuje el DT del AF que se obtiene aplicando Thompson para reconocer la ER:  b | c | a
1. Dibuje el DT del AF por Thompson que reconoce la ER:  bb
1. Dibuje el DT del AF por Thompson que reconoce la ER:  baa
1. Dibuje el DT del AF por Thompson que reconoce la ER:  b*
1. Dibuje el DT del AF por Thompson que reconoce la ER:  (ba)*|a
1. Dibuje el DT del AF por Thompson que reconoce la ER:  (a | b)*
1. Dibuje el DT del AF por Thompson que reconoce la ER: ab\* | a\*bb |a+b
1. Dibuje el DT del AF por Thompson que reconoce la ER:  (a | ba)*
1. Dibuje el DT del AF por Thompson que reconoce la ER:  (a | ba)+
1. Sea la siguiente TT de un AFN. Determine la Clausura-λ de cada estado:

  | Q | a | λ |
  | -- | -- | -- |
  | >0 | 1 | {2,3,6} |
  | 1 | - | 2 |
  | *2 | - | 3 |
  | 3 | - | 6 |
  | 4 | 5 | 5 |
  | *5 | - | - |
  | *6 | 6 | 1 |

1. Sea la siguiente TT de un AF y sea el conjunto de estados M = {0, 1}. Obtenga la clausura-λ(M).

  | Q | a | λ |
  | -- | -- | -- |
  | >0 | 1 | {3,6} |
  | 1 | - | 2 |
  | *2 | - | 4 |
  | 3 | - | 4 |
  | 4 | 5 | - |
  | *5 | - | - |
  | *6 | 6 | - |

1. Sea el conjunto M formado por los estados 1, 2 y 3. Suponer que estos estados tienen las siguientes transiciones: δ(1, a) = 1; δ(2, a) = 1; δ(3, b) = 2; δ(2, b) = 4. Obtenga: hacia(M, a), hacia(M, b), hacia(M, c)
1. Diseñe un AFN que tenga 4 transiciones-λ, 2 ciclos y 3 estados finales. Luego aplique el Algoritmo de Clausuras-λ para hallar un AFD equivalente.
1. Sea el AFN con la siguiente TT. Construya un AFD equivalente.

  | Q | a | b |
  | -- | -- | -- |
  | >0 | {1,3} | 1 |
  | 1 | - | {1,2} |
  | 2 | - | {2,3} |
  | *3 | 3 | {1,2,3} |

1. Sea el AFD. Obtenga la TT depurada y una ER.

  | Q | a | b |
  | -- | -- | -- |
  | >0 | 1 | 6 |
  | 1 | 1 | 4 |
  | 2 | - | - |
  | *4 | - | 4 |
  | 5 | 2 | 2 |
  | *6 | - | 5 |

1. Sea el AFN. Obtenga la TT depurada y una ER.

  | Q | a | b |
  | -- | -- | -- |
  | >0 | {1,2 | {0,6} |
  | 1 | 1 | 4 |
  | 2 | - | - |
  | *4 | - | {4,5} |
  | 5 | 2 | 2 |
  | *6 | - | 5 |

1. Sea el AFD, obtenga el AFDmin.

  | Q | a | b |
  | -- | -- | -- |
  | >0 | 1 | 5 |
  | 1 | 5 | 2 |
  | *2 | 2 | 3 |
  | *3 | 4 | 2 |
  | *4 | 3 | 4 |
  | 5 | 5 | 5 |

1. Sea el AFD, obtenga el AFDmin.

  | Q | a | b |
  | -- | -- | -- |
  | >*0 | 1 | 2 |
  | *1 | 1 | 4 |
  | 2 | 3 | 2 |
  | *3 | 4 | 4 |
  | 4 | 4 | 4 |

1. Obtenga la TT del AFDmin que reconoce al LR representado por la ER a\*ba\* | a\*b\*aa
1. Sea el AFN, obtenga el AFDmin.

  | Q | a | b | c | λ |
  | -- | -- | -- | -- | -- |
  | >0 | 1 | 1 | - | - |
  | 1 | {2,3} | - | 3 | {4,5} |
  | 2 | 2 | - | 4 | 5 |
  | *3 | - | - | {1,2} | 5 |
  | 4 | {4,5} | {0,2} | - | - |
  | *5 | - | {3,4} | - | - |

1. Sea el AFD, obtenga el AFD complemento.

  | Q | a | b |
  | -- | -- | -- |
  | >*0 | 1 | 2 |
  | *1 | 1 | 0 |
  | *2 | 0 | 1 |

1. Sea el lenguaje: "Todas las palabras sobre {a, b} que no contienen la secuencia bab". Hallar el AFD complemento.
1. Sea el lenguaje: "Todas las palabras sobre {a, b, c} que no comienzan con la secuencia caab". Hallar el AFD complemento.
1. Sea el lenguaje: "Todas las palabras sobre {a, b, c} que no terminan con la secuencia abc". Hallar el AFD complemento.
1. Dadas las ERs:  (a | b)\* aa   y   b(a | b)\*, obtener la TT del AFD intersección.
1. Dadas las ERs: (ab\*)\*  y  b(a | b)\*, obtener la TT del AFD intersección. ¿Es un AFD? Justifique su respuesta.
1. Comprobar si los siguientes AFD son equivalentes:
    * AFD1 = <{a, b, c}, {p, q, r, s, t, u, v}, f1, p, {s, t, u, v}>
    * AFD2 = <{a, b, c}, {p, q, r, s, t}, f2, p, {r, s, t}>

  | f1 | a | b | c |
  | -- | -- | -- | -- |
  | >p | r | t | q |
  | q | q | v | p |
  | r | p | u | r |
  | *s | q | t | u |
  | *t | t | v | u |
  | *u | t | t | v |
  | *v | u | u | t |

  | f2 | a | b | c |
  | -- | -- | -- | -- |
  | >p | s | q | p |
  | q | t | p | q |
  | *r | q | t | s |
  | *s | s | t | s |
  | *t | t | s | s |

1. Escribir el AFD equivalente a la GR = <ΣT, ΣN, S, P>, donde ΣT = {a, b}, ΣN = {S, A, B}, S es el axioma y P es:

        ```plain
        S -> bS | aA | λ
        A -> aA | bB | b
        B -> bS
        ```

1. Obtener el AF asociado a la siguiente GR:

        ```plain
        R0 -> bR1 | cR2 | a | b
        R1 -> aR1 | a
        R2 -> cR2 | a 
        ```

1. Sea el AFN = <{a, b}, {p, q, r, s}, f, p, {s}>. Construir su AFD equivalente.

  | Q | a | b | c |
  | -- | -- | -- | -- |
  | >p | {q,s} | p | {q,r} |
  | q | - | {q,r} | r |
  | r | - | {p,s} | q |
  | *s | s | {q,r,s} | - |

1. Obtener la ER del lenguaje reconocido por el AFD:  

  | Q | a | b |
  | -- | -- | -- |
  | >p | s | s |
  | *s | s | s |

1. Dado el AFN = <{a, b, c}, {p, q, r, s, t, u, v}, f, p, {v}>. Hallar el AFDmin equivalente. Determinar el lenguaje aceptado por el autómata. f = {f(q, b) = {r, s}, f(u, c) = {v}, f(r, λ) = q, f(s, a) = {t, p}, f(p, λ) = q, f(r, λ) = u, f(s, c) = {u}, f(p, λ) = t, f(t, λ) = q, f(t, b) = {v}, f(q, λ) = r, f(u, λ) = s, f(u, a) = {s, q}, f(q, λ) = s, f(v, λ) = r}

1. Obtener los lenguajes aceptados por cada uno de los siguientes AF:  
    * AF1 = <{a, b}, {p, q, r, s, t, u}, f1, p, {q, r}>
    * AF2 = <{a, b}, {p, q, r, s, t, u}, f2, p, {u}>
    * AF3 = <{a, b}, {p, q, r, s, t, u}, f3, p, {s, t, u}>

  | f1 | a | b |
  | -- | -- | -- |
  | >p | q | p |
  | *q | r | s |
  | *r | q | t |
  | s | t | u |
  | t | s | u |
  | u | q | u |

  | f2 | a | b |
  | -- | -- | -- |
  | >p | q | u |
  | q | r | t |
  | r | s | t |
  | s | r | t |
  | t | u | s |
  | *u | u | q |

  | f3 | a | b |
  | -- | -- | -- |
  | >p | u | q |
  | q | t | r |
  | r | s | r |
  | *s | t | r |
  | *t | u | q |
  | *u | s | p |

1. Describir el lenguaje reconocido por el AF = <Σ, Q, f, q0, F> donde Σ = {a, ba}, Q = {q0, q1, q2, q3} y f está representada por la tabla:

  | f | a | b |
  | -- | -- | -- |
  | >*q0 | q1 | q0 |
  | q1 | q1 | q2 |
  | q2 | q3 | q0 |
  | q3 | q3 | q3 |

1. Diseñar un AFD para cada una de las siguientes ER, de forma que el lenguaje de la ER sea reconocido por su correspondiente AF:
    1. ab*c
    1. a(bc)*bc
    1. a\*b(c\*a)\*
    1. cb\*|aa\*
    1. b(a | b)\*|cb\*
    1. a | ac(a | b)\* | c(a | b | c)\*

1. Dado el siguiente AFD = <{a, b}, {p, q, r}, f, p, {q}>. Determinar formalmente el lenguaje aceptado por dicho AFD.

  | f | a | b |
  | -- | -- | -- |
  | >p | q | r |
  | *q | p | r |
  | r | p | r |

1. Dado los siguientes AFD. Determinar el lenguaje aceptado por cada uno de ellos.
    * AFD1 = <{a, b, c}, {A, B}, f1, A, {B}>
    * AFD2 = <{a, b, c}, {A, B}, f2, A, {B}>

  | f1 | a | b | c |
  | -- | -- | -- | -- |
  | >A | A | B | A |
  | *B | B | B | B |

  | f2 | a | b | c |
  | -- | -- | -- | -- |
  | >A | B | A | A |
  | *B | B | B | B |

1. Sea el siguiente AFD = <{a, b}, {p, q, r, s, t, u, v}, f, p, {r, t}>. Determinar el lenguaje aceptado por dicho AF.

  | f | a | b |
  | -- | -- | -- |
  | >p | q | r |
  | q | s | v |
  | *r | v | s |
  | s | t | q |
  | *t | q | u |
  | u | r | v |
  | v | u | q |

1. Indicar cuales son los lenguajes aceptados por cada uno de los siguientes AF:
    * AFD1 = <{a, b}, {A, B, C}, f1, A, {C}>
    * AFD2 = <{a, b}, {A, B, C, D}, f2, A, {D}>
    * AFD3 = <{a, b}, {A, B}, f3, A, {B}>

  | f1 | a | b |
  | -- | -- | -- |
  | >A | C | A |
  | B | B | A |
  | *C | C | B |

  | f2 | a | b |
  | -- | -- | -- |
  | >A | B | D |
  | B | B | C |
  | C | D | B |
  | *D | D | B |

  | f3 | a | b |
  | -- | -- | -- |
  | >A | B | A |
  | *B | B | A |

1. Dado el siguiente AFN = <{a, b, c}, {q0, q1, q2, q3, q4, q5}, f, p, {q2, q5}>. Hallar formalmente el AFDmin equivalente. f = {f(q0, a) = {q0, q3}, f(q0, b) = {q2}, f(q0, c) = {q5}, f(q1, a) = {q3}, f(q1, b) = {q2, q5}, f(q1, c) = {q2}, f(q2, a) = {q2}, f(q2, b) = {q1, q4}, f(q2, c) = {q4}, f(q3, a) = {q0}, f(q3, b) = {q5}, f(q3, c) = {q2, q5}, f(q4, c) = {q5}, f(q5, a) = {q2}, f(q5, b) = {q4}, f(q5, c) = {q1, q4}}
1. Obtener formalmente el lenguaje reconocido por el siguiente  AFN = <{a, b}, {p, q, r, s, t, u, v}, f, p, {v}>
  | f | a | b |
  | -- | -- | -- |
  | >p | {q,r} | p |
  | q | {r,q} | {s,t,u} |
  | r | - | {p,v} |
  | s | {u,r} | - |
  | t | - | - |
  | u | {t,s} | v |
  | *v | {u,s,t} | v |

1. Sean los AFD A1, A2 y A3 que reconocen los LR L1, L2 y L3 respectivamente. Construir los AFD que reconocen los siguientes LR:
    1. L1 U L2
    1. L1 ∩ L2
    1. L1 – L2
    1. L1 U L3
    1. L3 – L2

  | A1 | 0 | 1 |
  | -- | -- | -- |
  | >A | B | A |
  | B | B | C |
  | *C | B | A |

  | A2 | 0 | 1 |
  | -- | -- | -- |
  | >X | X | Y |
  | Y | X | Z |
  | *Z | Z | - |

  | A3 | 0 | 1 |
  | -- | -- | -- |
  | >V | W | W |
  | *W | V | V |

1. Sean los AF A1 y A2 que reconocen los LR L1 y L2 respectivamente. Construir un AF que reconozcan los siguientes LR:
    1. L1L2
    1. L1*
    1. L2* U L1

  | A1 | 0 | 1 |
  | -- | -- | -- |
  | >P | P | Q |
  | Q | R | Q |
  | *R | P | Q |

  | A2 | 0 | 1 |
  | -- | -- | -- |
  | >*X | Y | U |
  | Y | X | - |
  | U | - | W |
  | *W | - | U |

1. Dé AFDs que reconozcan los siguientes lenguajes sobre Σ = {0, 1}.
    1. {w / w comienza con 1 y termina con 0}
    1. {w / w contiene por lo menos tres 1s}
    1. {w / w contiene la palabra 0101}
    1. {w / w tiene longitud por lo menos 3 y su tercer símbolo es 0}
    1. {w / w comienza con 0 y tiene longitud impar o comienza con 1 y tiene longitud par}
    1. {w / w no contiene la palabra 1101}
    1. {w / la longitud de w es a lo sumo 5}
    1. {w / w es cualquier palabra excepto 11 y 1111}
    1. {w / cada posición impar de w es un 1}
    1. {w / w contiene por lo menos dos 0s y a lo sumo un 1}
    1. (λ, 0}
    1. {w / w contiene un número par de 0s y exactamente dos 1s}
    1. {}
1. Encuentre un AFD que reconozca cada uno de los siguientes LR sobre Σ = {0, 1}. Ayuda: observe que en todos los casos se trata de la intersección de lenguajes simples.
    1. {w / w tiene por los menos dos 0s y por lo menos tres 1s}
    1. {w / w tiene exactamente dos 0s y por lo menos dos 1s}
    1. {w / w tiene un número par de 0s y uno o dos 1s}
    1. {w / w tiene un número par de 0s y cada 0 está seguido por lo menos un 1}
    1. {w / w tiene un número impar de 0s termina con 1}
    1. {w / w tiene longitud par y un número impar de 1s}
1. Dé AFDs que reconozcan los siguientes lenguajes sobre Σ = {0, 1}. Ayuda: observe que en todos los casos se trata del complemento de otro lenguaje.
    1. {w / w no contiene la palabra 01}
    1. {w / w no contiene la palabra 1010}
    1. {w / w no contiene las palabras 10 ni 01}
    1. {w / w es cualquier palabra que no está en 0\*1\*}
    1. {w / w es cualquier palabra que no está en (01+)\*}
    1. {w / w es cualquier palabra que no está en 0\*|1\*
    1. {w / w es cualquier palabra que no contiene exactamente dos 1s}
    1. {w / w es cualquier palabra excepto 0 o 1}
1. Dé AFNs que reconozcan la unión de los siguientes lenguajes:
    1. {w / w comienza con 1 y termina con 0} y {w / w contiene por lo menos tres 1s}
    1. {w / w contiene la palabra 0101} y {w / w no contiene la palabra 1101}
1. Dé AFNs que reconozcan la concatenación de los siguientes lenguajes:
    1. {w / la longitud de w es a lo sumo 5} y {w / cada posición impar de w es un 1}
    1. {w / w contiene por lo menos tres 1s} y {}
1. Dé una AFD con a lo sumo 5 estados que reconozca el siguiente lenguaje {w / w tiene un número par de 0s, un número impar de 1s y no contiene la palabra 01}
1. Convierta el AFN en un AFD equivalente: Q = {q0, q1}; Σ = {a, b}; δ(qo, a) = {q0, q1}; δ(qo, b) = {q1}; δ(q1, b) = {q0}; F = {q0}
1. Convierta el AFN en un AFD equivalente: Q = {q0, q1, q2}; Σ = {a, b}; δ(qo, a) = {q2}; δ(qo, λ) = {q1}; δ(q1, a) = {q0} δ(q2, a) = {q1}; δ(q2, b) = {q1, q2}; F = {q1}
1. Convierta las siguientes ER sobre Σ = {0, 1} en AFN:
    1. (0|1)\*000(0|1)\*
    1. (((00)\*11)|01)\*
    1. {}\*
    1. (000)\*
    1. (0|1)\*0 (0|1)\*1(0|1)\*0(0|1)\*
    1. 010|101
    1. (λ|0)1
    1. (0|10)(0|1)\*
1. Para cada uno de los siguientes lenguajes sobre Σ = {0, 1}, dé dos palabras que pertenezcan al lenguaje y dos que no pertenezcan.
    1. 0\*1\*
    1. 0(10)\*1
    1. 0\*|1\*
1. Convierta el AFD en una ER: Q = {q0, q1}; Σ = {0, 1}; δ(qo, 0) = q0; δ(qo, 1) = q1; δ(q1, 0) = q1; δ(q1, 1) = q0; F = {q1}
1. Convierta el AFD en una ER: Q = {q0, q1, q2}; Σ = {0, 1}; δ(qo, 0) = q1; δ(qo, 1) = q1; δ(q1, 0) = q1; δ(q1, 1) = q2; δ(q2, 0) = q0; δ(q2, 1) = q1; F = {q0, q2}
1. Algunos lenguajes de programación, los comentarios se insertan entre delimitadores como /\* y \*/ y no puede haber ninguna ocurrencia de \*/ dentro del comentario. Si C es el lenguaje de todos los comentarios válidos sobre Σ = {*, a, b};
    1. Dé un AFD que reconozca C.
    1. Dé una ER que represente C.
1. Convierta las siguientes ER sobre Σ = {0, 1} en AFN:
    1. 0(011)\*|1
    1. 0+|(01)+
    1. (0|1+)0+1+
1. A partir de las siguientes ER obtener el AFDmin aplicando todos los algoritmos intermedios:
    1. (ab)\*|(a|c)|(a|b|c)
    1. (ab|c)\*|(a|c)\*|a\*
    1. (01\*0|11)\*|(00|1)\*
    1. ab|0\*(01\*0|11)\*
1. Dado el siguiente LR:  L = {w / w ∈ {a, b, c}* y en w las palabras deben cumplir que luego de una a siempre venga dos b, antes de una b no pueden venir una c, y la cantidad de a son pares}
    1. Diseñar el AFD.
    1. Obtener la ER.
    1. A partir de la ER obtener el AFDmin.
1. Dada la siguiente ER (aa|b)\*(c|d)(cd)\*
    1. Diseñar el AFD.
    1. A partir de la ER obtener el AFDmin.
    1. Diseñar la GR.
1. Dado el siguiente lenguaje L = {w / w ∈ {a, d}* y w la cantidad de d debe ser par y la de a impar, y w no puede comenzar con d ni finalizar con a}. Se debe diseñar el AFD correspondiente y luego aplicar el algoritmo de minimización.
1. Obtener el AFDmin a partir que reconoce las cadenas del lenguaje representado por la siguiente GR:

        ```plain
        S -> λ | bB | a | aA
        B -> b | bA
        A -> aA | bB | a | aC
        C -> c | cC | bB | aA | a
        ```

1. Demostrar Utilizando el Lema Pumping si los siguientes lenguajes son o no regulares.
    1. L1 = {a^(n+1)cb^n / n ≥ 0} sobre Σ = {a, b, c}
    1. L2 = {da^(n+1)c^nb^n / n ≥ 1} sobre Σ = {a, b, c, d}
    1. L3 = {0^n1^n2^n / n ≥ 0} sobre Σ = {0, 1, 2}
    1. L4 = {a^nb^(n+1) / n ≥ 1} sobre Σ = {a, b}
    1. L5 = {e^(n+1)cf^(n+2) / n ≥ 0} sobre Σ = {e, c, f}
1. Diseñar un AFD que acepte las palabras en el alfabeto {a, b} en que la cantidad de a´s es impar.
1. Diseñar un AFD que acepte las palabras en el alfabeto {0, 1} en que las cadenas empiecen con 1 no tienen un par de 0´s consecutivos.
1. Diseñe un AF que reconozca la ER
    1. 1(1|0|-)*(1|0)|1
    1. (a|b)(a|b(a|b))*
    1. (0|1)(10)*
    1. a(bb\*a)\*
    1. a(aa)*
    1. (aa)+
    1. (0|1)*00
    1. (b|bab)+
    1. (ab|ba)+
    1. ba*
    1. (ba)*
    1. b\*a\*
1. Dada la siguiente ER: (a|ba)*(ab|ba)
    1. AF
    1. GR
1. Dado el siguiente AFD
    1. LR por extensión
    1. LR por comprensión coloquial
    1. GR
    1. ER

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | q0 | q1 |
  | q1 | q1 | q2 |
  | *q2 | q3 | q3 |
  | q3 | q3 | q3 |

1. Construya un AFD que reconozca el lenguaje L sobre el alfabeto {%, &} cuyas palabras verificar las siguientes restricciones:
    * Si una palabra tiene menos de cinco &, entonces tiene un número par de &.
    * Si una palabra tiene cinco & o más, entonces contiene un número impar de &.
    * Cualquier palabra contiene al menos un &.
1. Una cadena comando es el nombre del comando seguido de uno o más espacios en blanco, y a continuación una lista de parámetros que puede ser vacía. Un comando es una secuencia no vacía de cadenas comando separadas por un delimitador. Un delimitador es un elemento del conjunto {. , ;}. Un nombre comienza con una letra y sigue con cero o más letras o dígitos. La lista de parámetros es una secuencia de uno o más nombres separados por uno o más espacios en blanco. Opciones: Expresión regular o gramática regular o autómata finito determinista que reconozca las palabras de dicho lenguaje. Se acepta cerradura positiva. Usar como símbolo de blanco la b tachada.
1. Dado el siguiente AFD: Σ={0,1};  Q={q0, q1, q2, q3, q4, q5};  q0=q0;  F={q4}; ∆={∆(q0, 0)=q1, ∆(q0, 1)=q5, ∆(q1, 0)=q2, ∆(q1, 1)=q3, ∆(q2, 0)=q1, ∆(q2, 1)=q5, ∆(q3, 0)=q5,  ∆(q3, 1)=q4, ∆(q4, 0)=q5, ∆(q4, 1)=q3, ∆(q5, 0)=q5, ∆(q5, 1)=q5}
    1. Escriba dos palabras de menor longitud que acepte.
    1. Escriba dos palabras de menor longitud que rechace.
1. Para la siguiente ER construir el AFD que lo acepta 0 (00)*(11)+
1. Construir un AFN que reconozca el lenguaje L = {0^n / n > 0} ᴜ {1^n / n > 0}
1. Construir un AFN que reconozca el lenguaje L = {a^n / n ≥ 0} ᴜ {b^na / n ≥ 1}
1. Construir un AFN para el siguiente lenguaje y luego transformarlo en AFD L = {abc, abd, aacd}
1. Construir un AFN para cada uno de los siguientes lenguajes y luego transformar en AFD:
    1. Palabras del alfabeto {a, b, c} tal que su último símbolo aparece una única vez en la palabra (al final).
    1. Palabras del alfabeto {a, b, c} tal que si último símbolo aparece más de una vez en la palabra.  
1. Encontrar la ER correspondiente a cada GR:
    1. GR1

            ```plain
            S -> aA | λ
            A -> aA | aC | bB | aB
            B -> bB | bA | b
            C -> aC | bC 
            ```

    1. GR2

            ```plain
            S -> aA | cA | a | c
            A -> bS 
            ```

1. Para cada ER sobre el alfabeto {a, b}, encontrar la GR correspondiente:
    1. aa\*bb\* | ab
    1. (b | ab\*a)\*ab\*

1. Construir AFDmin que reconozcan el lenguaje generado por cada GR:
    1. GR1

            ```plain
            A -> 0B | λ
            B -> 1C | 1
            C -> 0B
            ```

    1. GR2

            ```plain
            S -> bA | cB | a | b
            A -> aA | a
            B -> cB | a 
            ```
1. Llevar todas las producciones a GR y luego construir el AFD correspondiente:
    1. GR1

            ```plain
            S -> T | R
            T -> aT | V
            V -> bV | b
            R -> cX | e
            X -> cX | cd 
            ```

    1. GR2

            ```plain
            S -> aT | V
            T -> aR | bR
            R -> aR | bR | V
            V -> cV | λ
            ```

1. Obtener la ER del lenguaje generado por el siguiente autómata:

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | {q0,q1} | q0 |
  | q1 | q2 | q2 |
  | q2 | q3 | - |
  | *q3 | q3 | q3 |

1. Dada la siguiente GR, hallar la ER del lenguaje asociado a dicha gramática

        ```plain
        S -> 1A | 1B
        A -> 0A | 0C | 1C | 1
        B -> 1A | 1C | 1
        C -> 1
        ```

1. Construir el AFDmin para las siguientes ER:
    1. (abc)*
    1. a+bc*  
    1. a(b|λ)b+
1. Convertir a ER cada AFD

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q0 | q1 |
  | q1 | q2 | q0 |
  | *q2 | q1 | q2 |

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q0 |
  | q1 | q2 | q1 |
  | *q2 | q2 | q1 |

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q3 |
  | *q1 | q2 | q3 |
  | q2 | q1 | q1 |
  | q3 | q3 | q3 |
