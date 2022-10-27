# Algoritmos con Autómata Finito

* Algoritmo de Thompson: ER -> AFNλ
* Algoritmo de Clausura-λ: {AFN, AFNλ} -> AFD
* Algoritmo reducido del Clausura-λ: AFN -> AFD
* Algoritmo AF -> ER
* Algoritmo de Clases: AFD -> AFDmin

## Algoritmo de Thompson: ER -> AFNλ

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

## Algoritmo de Clausura-λ: {AFN, AFNλ} -> AFD

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

## Algoritmo AF -> ER

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

## Algoritmo de Clases: AFD -> AFDmin

* Es el AFD con la mínima cantidad de estados que reconoce a un LR.
* Por ello, se lo considera como el único autómata óptimo asociado a la aceptación de determinado LR.
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

* Ejemplo 1:

  * AFD de a*b

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q2 |
    | q1 | q1 | q2 |
    | *q2 | qe | qe |
    | qe | qe | qe |

  * AFDmin

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q0 | q2 |
    | *q2 | - | - |

* Ejemplo 2:

  * AFD de (a|b)*

    | Q | a | b |
    | -- | -- | -- |
    | >*q0 | q1 | q1 |
    | *q1 | q1 | q1 |

  * AFDmin

    | Q | a | b |
    | -- | -- | -- |
    | >*q0 | q0 | q0 |

* Ejemplo 3:

  * AFD de b\*a(b\*ab\*a)\*b\*

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q0 |
    | *q1 | q2 | q1 |
    | q2 | q1 | q2 |

  * AFDmin

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q0 |
    | *q1 | q0 | q1 |

* Ejemplo 4:

  * AFD de (a|b)((a|b)(a|b))*

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q1 |
    | *q1 | q2 | q2 |
    | q2 | q3 | q3 |
    | *q3 | q2 | q2 |

* AFDmin

    | Q | a | b |
    | -- | -- | -- |
    | >q0 | q1 | q1 |
    | *q1 | q0 | q0 |

### AFD -> GR

* AFD = \<Q, Σ, q0, F, δ\>
* Se construye la gramática equivalente lineal por la derecha GR = \<ΣT, ΣN, S, P\> en la que P:
  * Si δ(q, a) = p entonces q -> ap, (a ∈ Σ, q ∈ Q, p ∈ Q)
  * Si δ(q, a) = p y p ∈ F, entonces q -> a, (a ∈ Σ, q ∈ Q, p ∈ Q)
  * Si q0 ∈ F, entonces q -> λ.

* Ejemplo 1: a*b

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q0 | q1 |
  | *q1 | - | - |

      ```plain
      q0 -> aq0 | b
      ```

* Ejemplo 2:

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

* Ejemplo 3:

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

* Ejemplo 4: λ | a\* | (a\*ba\*b)\*ccc(ccc)\*

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
  * Q = ΣN U {F}
  * Σ = ΣT
  * q0 = S
  * F = {F}, donde F ∉ ΣN  es un nuevo símbolo no terminal.
  * δ:
    * Si A -> vB entonces δ(A, v) = B
    * Si A -> v entonces δ(A, v) = F
    * Si S -> λ entonces δ(S, λ) = F

* Ejemplo: (ab)*

          ```plain
          A -> aB | λ
          B -> bC | b
          C -> aB
          ```

          | Q | a | b | λ |
          | -- | -- | -- | -- |
          | >A | B | - | F |
          | B | - | {C, F} | - |
          | C | B | - | - |
          | *F | - | - | - |

  * AF <{A, B, C, F}, {a, b}, A, {F}, {δ(A, a) = B, δ(A, λ) = F, δ(B, b) = {C, F}, δ(C, a) = B}>

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

![Lema del Bombeo](img/bombeo.jpg)

* L = {ab^na / n > 0}

![Lema del Bombeo](img/lb1.png)

* L = {a^nb^n / n > 0}

![Lema del Bombeo](img/lb2.png)

## Aplicaciones

* Los AF se usan frecuentemente en los problemas que implican el análisis de cadenas de caracteres. Ejemplos:
  * Búsqueda de la existencia de una cadena en un archivo.
  * Reconocimiento de cadenas de entrada que satisfaga ciertos criterios (por ejemplo, si se espera un entero sin signo como dato de entrada y el usuario confunde uno de los dígitos con un carácter no numérico, se puede dar todo tipo de resultados impropios, desde una terminación anormal hasta el cálculo de resultados incorrectos).
  * Solución: especificar la información correcta por medio de ER: Ejemplo: L(L|D|_)*(L|D)

## Ejercicios Algoritmo de Thompson: ER -> AFNλ

1. b | λ
1. b | c | a
1. bb
1. baa
1. b*
1. (ba)*|a
1. (a | b)*
1. ab\* | a\*bb |a+b
1. (a | ba)*
1. (a | ba)+
1. (0|1)\*000(0|1)\*
1. (((00)\*11)|01)\*
1. {}\*
1. (000)\*
1. (0|1)\*0 (0|1)\*1(0|1)\*0(0|1)\*
1. 010|101
1. (λ|0)1
1. (0|10)(0|1)\*
1. 0(011)\*|1
1. 0+|(01)+
1. (0|1+)0+1+

## Ejercicios Clausura-λ(q)

1. AFN

  | Q | a | λ |
  | -- | -- | -- |
  | >0 | 1 | {2,3,6} |
  | 1 | - | 2 |
  | *2 | - | 3 |
  | 3 | - | 6 |
  | 4 | 5 | 5 |
  | *5 | - | - |
  | *6 | 6 | 1 |

1. AFN

  | Q | a | λ |
  | -- | -- | -- |
  | >0 | 1 | {3,6} |
  | 1 | - | 2 |
  | *2 | - | 4 |
  | 3 | - | 4 |
  | 4 | 5 | - |
  | *5 | - | - |
  | *6 | 6 | - |

## Ejercicios Hacia(Clausura-λ(q), ó)

1. Sea el conjunto M formado por los estados 1, 2 y 3. Suponer que estos estados tienen las siguientes transiciones: δ(1, a) = 1; δ(2, a) = 1; δ(3, b) = 2; δ(2, b) = 4. Obtenga: hacia(M, a), hacia(M, b), hacia(M, c)

## Ejercicios Algoritmo Clausura-λ: AFNλ/AFN -> AFD

1. Diseñe un AFN que tenga 4 transiciones-λ, 2 ciclos y 3 estados finales.

1. AFN

  | Q | a | b |
  | -- | -- | -- |
  | >0 | {1,3} | 1 |
  | 1 | - | {1,2} |
  | 2 | - | {2,3} |
  | *3 | 3 | {1,2,3} |

1. AFN = <{a, b}, {p, q, r, s}, f, p, {s}>

  | Q | a | b | c |
  | -- | -- | -- | -- |
  | >p | {q,s} | p | {q,r} |
  | q | - | {q,r} | r |
  | r | - | {p,s} | q |
  | *s | s | {q,r,s} | - |

1. AFN = <{q0, q1}; {a, b}; δ(qo, a) = {q0, q1}; δ(qo, b) = {q1}; δ(q1, b) = {q0}; F = {q0}>
1. AFN = <{q0, q1, q2}; {a, b}; δ(qo, a) = {q2}; δ(qo, λ) = {q1}; δ(q1, a) = {q0} δ(q2, a) = {q1}; δ(q2, b) = {q1, q2}; F = {q1}>

## Ejercicios Algoritmo AF -> ER

1. AFD:

  | Q | a | b |
  | -- | -- | -- |
  | >0 | 1 | 6 |
  | 1 | 1 | 4 |
  | 2 | - | - |
  | *4 | - | 4 |
  | 5 | 2 | 2 |
  | *6 | - | 5 |

1. AFN:

  | Q | a | b |
  | -- | -- | -- |
  | >0 | {1,2} | {0,6} |
  | 1 | 1 | 4 |
  | 2 | - | - |
  | *4 | - | {4,5} |
  | 5 | 2 | 2 |
  | *6 | - | 5 |

1. AFD:  

  | Q | a | b |
  | -- | -- | -- |
  | >p | s | s |
  | *s | s | s |

1. AFN:

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | {q0,q1} | q0 |
  | q1 | q2 | q2 |
  | q2 | q3 | - |
  | *q3 | q3 | q3 |

1. AFD:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q0 | q1 |
  | q1 | q2 | q0 |
  | *q2 | q1 | q2 |

1. AFD:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q0 |
  | q1 | q2 | q1 |
  | *q2 | q2 | q1 |

1. AFD:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | q3 |
  | *q1 | q2 | q3 |
  | q2 | q1 | q1 |
  | q3 | q3 | q3 |

1. AFD = <{q0, q1}; {0, 1}; δ(qo, 0) = q0; δ(qo, 1) = q1; δ(q1, 0) = q1; δ(q1, 1) = q0; F = {q1}>

1. AFD = <{q0, q1, q2}; {0, 1}; δ(qo, 0) = q1; δ(qo, 1) = q1; δ(q1, 0) = q1; δ(q1, 1) = q2; δ(q2, 0) = q0; δ(q2, 1) = q1; F = {q0, q2}>

## Ejercicios Algoritmo de Clases: AFD -> AFDmin

1. AFD

  | Q | a | b |
  | -- | -- | -- |
  | >0 | 1 | 5 |
  | 1 | 5 | 2 |
  | *2 | 2 | 3 |
  | *3 | 4 | 2 |
  | *4 | 3 | 4 |
  | 5 | 5 | 5 |

1. AFD

  | Q | a | b |
  | -- | -- | -- |
  | >*0 | 1 | 2 |
  | *1 | 1 | 4 |
  | 2 | 3 | 2 |
  | *3 | 4 | 4 |
  | 4 | 4 | 4 |

1. a\*ba\* | a\*b\*aa

1. AFN

  | Q | a | b | c | λ |
  | -- | -- | -- | -- | -- |
  | >0 | 1 | 1 | - | - |
  | 1 | {2,3} | - | 3 | {4,5} |
  | 2 | 2 | - | 4 | 5 |
  | *3 | - | - | {1,2} | 5 |
  | 4 | {4,5} | {0,2} | - | - |
  | *5 | - | {3,4} | - | - |

1. AFN = <{a, b, c}, {p, q, r, s, t, u, v}, f, p, {v}>. Donde f = {f(q, b) = {r, s}, f(u, c) = {v}, f(r, λ) = q, f(s, a) = {t, p}, f(p, λ) = q, f(r, λ) = u, f(s, c) = {u}, f(p, λ) = t, f(t, λ) = q, f(t, b) = {v}, f(q, λ) = r, f(u, λ) = s, f(u, a) = {s, q}, f(q, λ) = s, f(v, λ) = r}

1. AFN = <{a, b, c}, {q0, q1, q2, q3, q4, q5}, f, p, {q2, q5}>. Donde f = {f(q0, a) = {q0, q3}, f(q0, b) = {q2}, f(q0, c) = {q5}, f(q1, a) = {q3}, f(q1, b) = {q2, q5}, f(q1, c) = {q2}, f(q2, a) = {q2}, f(q2, b) = {q1, q4}, f(q2, c) = {q4}, f(q3, a) = {q0}, f(q3, b) = {q5}, f(q3, c) = {q2, q5}, f(q4, c) = {q5}, f(q5, a) = {q2}, f(q5, b) = {q4}, f(q5, c) = {q1, q4}}

## Ejercicios Algoritmo GR -> AFD

1. GR

        ```grammar
        S -> bS | aA | λ
        A -> aA | bB | b
        B -> bS
        ```

1. GR

        ```grammar
        R0 -> bR1 | cR2 | a | b
        R1 -> aR1 | a
        R2 -> cR2 | a 
        ```

## Ejercicios Algoritmos intermedios ER -> AFDmin

1. (ab)\*|(a|c)|(a|b|c)
1. (ab|c)\*|(a|c)\*|a\*
1. (01\*0|11)\*|(00|1)\*
1. ab|0\*(01\*0|11)\*
1. (aa|b)\*(c|d)(cd)\*
1. (abc)*
1. a+bc*  
1. a(b|λ)b+

## Ejercicios Algoritmos intermedios LR -> AFDmin

1. L = {w / w ∈ {a, b, c}* y en w las palabras deben cumplir que luego de una a siempre venga dos b, antes de una b no pueden venir una c, y la cantidad de a son pares}
1. L = {w / w ∈ {a, d}* y w la cantidad de d debe ser par y la de a impar, y w no puede comenzar con d ni finalizar con a}

## Ejercicios Algoritmos intermedios ER -> GR

1. aa\*bb\* | ab
1. (b | ab\*a)\*ab\*

## Ejercicios Algoritmos intermedios GR -> ER

1. GR:

        ```grammar
        S -> 1A | 1B
        A -> 0A | 0C | 1C | 1
        B -> 1A | 1C | 1
        C -> 1
        ```

1. GR:

        ```grammar
        S -> aA | λ
        A -> aA | aC | bB | aB
        B -> bB | bA | b
        C -> aC | bC 
        ```

1. GR:

        ```grammar
        S -> aA | cA | a | c
        A -> bS 
        ```

## Ejercicios Algoritmos intermedios GR -> AFDmin

1. GR:

        ```grammar
        S -> λ | bB | a | aA
        B -> b | bA
        A -> aA | bB | a | aC
        C -> c | cC | bB | aA | a
        ```

1. GR:

        ```grammar
        S -> aA | λ
        A -> aA | aC | bB | aB
        B -> bB | bA | b
        C -> aC | bC 
        ```

1. GR:

        ```grammar
        S -> aA | cA | a | c
        A -> bS 
        ```

1. GR:

        ```grammar
        A -> 0B | λ
        B -> 1C | 1
        C -> 0B
        ```

1. GR:

        ```grammar
        S -> bA | cB | a | b
        A -> aA | a
        B -> cB | a 
        ```

1. GR:

        ```grammar
        S -> T | R
        T -> aT | V
        V -> bV | b
        R -> cX | e
        X -> cX | cd 
        ```

1. GR:

        ```grammar
        S -> aT | V
        T -> aR | bR
        R -> aR | bR | V
        V -> cV | λ
        ```

## Ejercicios Lema Pumping

1. L1 = {a^(n+1)cb^n / n ≥ 0} sobre Σ = {a, b, c}
1. L2 = {da^(n+1)c^nb^n / n ≥ 1} sobre Σ = {a, b, c, d}
1. L3 = {0^n1^n2^n / n ≥ 0} sobre Σ = {0, 1, 2}
1. L4 = {a^nb^(n+1) / n ≥ 1} sobre Σ = {a, b}
1. L5 = {e^(n+1)cf^(n+2) / n ≥ 0} sobre Σ = {e, c, f}
