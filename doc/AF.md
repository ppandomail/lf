# Autómata Finito (AF)

## Definición

* Es una herramienta abstracta que se utiliza para reconocer un determinado LR.
* Es un modelo formal matemático de un sistema que recibe una cadena constituida por símbolos de cierto alfabeto Σ y tiene capacidad de determinar si esa cadena pertenece al LR que el AF reconoce.
* Es una máquina de estados finitos. Una máquina es una abstracción matemática que capturan solamente el aspecto referente a las secuencias de eventos (transiciones) que ocurren.

![AF grande](img/afgrande1.png)

![AF grande](img/afgrande2.png)

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

## Operaciones con AF

* Complemento
* Intersección
* Unión
* Concatenación

### Complemento

* Se define el autómata complementario Mc como aquel que se obtiene a partir de M dando a los estados no aceptadores el carácter de aceptadores y viceversa  L(M^c) = ~L(M)
  * M^c = (Q, Σ, q0, F = Q - F, δ)
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

### Intersección

* M1 ∩ M2
* M = (Q = Q1 x Q2, Σ, q0 = q1,q2,  F = F1 x F2
* ∀p ∈ Q1, ∀q ∈ Q2, ∀w ∈ Σ*
* δ((p, q), w) = (δ1(p, w), δ2(q, w))
* (p, q)w = (pw, qw)

### Unión

* M1 U M2
* M = (Q = Q1 U Q2, Σ, q0 = q1 U q2, F = F1 U F2, δ = δ1 U δ2)
* δ(q, w) = δ1(q, w) si q ∈ Q1
* δ(q, w) = δ2(q, w) si q ∈ Q2

### Concatenación

* M1.M2
* M = (Q = Q1 U Q2, Σ, q0 = q1, F = F2
* δ(q, a) = δ1(q, a) si q ∈ Q1 y a ∈ Σ
* δ(q, a) = δ2(q, a) si q ∈ Q2 y a ∈ Σ
* δ(q, λ) = q2  ∀q ∈ F1

## Programa Prolog que implementa un AF

```prolog
% Ejemplo: ER a* (b | bb)
final(q1).
final(q2).
transicion(q0, a, q0).
transicion(q0, b, q1).
transicion(q1, b, q2).
automata([], E) :- final(E).
automata([H|Q], E) :- transicion(E, H, E2), automata(Q, E2), !.
automata(L) :- automata(L, q0).

% ?- automata([b, b, b]).
% false

% ?- automata([a, a, b, b]).
% true
```

## En resumen

![resumen](img/af.jpeg)

## Ejercicios conceptuales

1. ¿Existirá un AF que reconozca {ab, abc}?. Justifique su respuesta. Si existe, ¿ese AF reconoce la palabra abb?. Justifique su respuesta.
1. Investigue e informe si un AP puede reconocer a un LR. Investigue e informe si una MT puede reconocer a un LR.
1. Dado el siguiente AFD: Σ={0,1};  Q={q0, q1, q2, q3, q4, q5};  q0=q0;  F={q4}; ∆={∆(q0, 0)=q1, ∆(q0, 1)=q5, ∆(q1, 0)=q2, ∆(q1, 1)=q3, ∆(q2, 0)=q1, ∆(q2, 1)=q5, ∆(q3, 0)=q5,  ∆(q3, 1)=q4, ∆(q4, 0)=q5, ∆(q4, 1)=q3, ∆(q5, 0)=q5, ∆(q5, 1)=q5}
    1. Escriba dos palabras de menor longitud que acepte.
    1. Escriba dos palabras de menor longitud que rechace.

## Ejercicios de casos posibles y actividades

1. Sea el alfabeto {a, b} y sea el LR {a, aba}. Diseñe el AF que reconoce este LR. Describa los diferentes casos posibles y sus actividades.
1. Diseñe un AF que reconozca la ER a\*bb\*a. Dibuje el DT, y muestre las actividades para diferentes casos.
1. Describa las diferentes actividades de este AF:

  | Q | a | b |
  | -- | -- | -- |
  | >q0 | q1 | - |
  | q1 | q2 | - |
  | q2 | q3 | - |
  | q3 | - | q4 |
  | *q4 | - | q4 |

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

## Ejercicio determinar LR representado por AF

1. ¿Qué LR reconoce este AF? Escriba una ER que lo represente.

  | Q | 0 | 1 |
  | -- | -- | -- |
  | >q0 | q1 | q3 |
  | q1 | - | q2 |
  | *q2 | - | - |
  | q3 | q2 | - |

1. AF1 = <{a, b}, {p, q, r, s, t, u}, f1, p, {q, r}>, AF2 = <{a, b}, {p, q, r, s, t, u}, f2, p, {u}> y AF3 = <{a, b}, {p, q, r, s, t, u}, f3, p, {s, t, u}>

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

1. AF = <Σ, Q, f, q0, F> donde Σ = {a, ba}, Q = {q0, q1, q2, q3}

  | f | a | b |
  | -- | -- | -- |
  | >*q0 | q1 | q0 |
  | q1 | q1 | q2 |
  | q2 | q3 | q0 |
  | q3 | q3 | q3 |

1. AFD = <{a, b}, {p, q, r}, f, p, {q}>

  | f | a | b |
  | -- | -- | -- |
  | >p | q | r |
  | *q | p | r |
  | r | p | r |

1. AFD = <{a, b, c}, {A, B}, f, A, {B}>

  | f | a | b | c |
  | -- | -- | -- | -- |
  | >A | A | B | A |
  | *B | B | B | B |

1. AFD = <{a, b, c}, {A, B}, f, A, {B}>

  | f | a | b | c |
  | -- | -- | -- | -- |
  | >A | B | A | A |
  | *B | B | B | B |

1. AFD = <{a, b}, {p, q, r, s, t, u, v}, f, p, {r, t}>

  | f | a | b |
  | -- | -- | -- |
  | >p | q | r |
  | q | s | v |
  | *r | v | s |
  | s | t | q |
  | *t | q | u |
  | u | r | v |
  | v | u | q |

1. AFD = <{a, b}, {A, B, C}, f, A, {C}>

  | f | a | b |
  | -- | -- | -- |
  | >A | C | A |
  | B | B | A |
  | *C | C | B |

1. AFD = <{a, b}, {A, B, C, D}, f, A, {D}>

  | f | a | b |
  | -- | -- | -- |
  | >A | B | D |
  | B | B | C |
  | C | D | B |
  | *D | D | B |

1. AFD = <{a, b}, {A, B}, f, A, {B}>

  | f | a | b |
  | -- | -- | -- |
  | >A | B | A |
  | *B | B | A |

1. AFD = <{0, 1}, {q0, q1, q2, q3}, f, q0, {q2}>

  | f | 0 | 1 |
  | -- | -- | -- |
  | >q0 | q0 | q1 |
  | q1 | q1 | q2 |
  | *q2 | q3 | q3 |
  | q3 | q3 | q3 |

1. AFN = <{a, b}, {p, q, r, s, t, u, v}, f, p, {v}>

  | f | a | b |
  | -- | -- | -- |
  | >p | {q,r} | p |
  | q | {r,q} | {s,t,u} |
  | r | - | {p,v} |
  | s | {u,r} | - |
  | t | - | - |
  | u | {t,s} | v |
  | *v | {u,s,t} | v |

## Ejercicios diseño de AF que reconoce el LR representado por ER

1. (a|b|c|d)*
1. a(ab)+
1. a*|ab
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
1. (a|ba)*(ab|ba)

## Ejercicios diseño de AFD que reconoce el LR representado por ER

1. ab*c
1. a(bc)*bc
1. a\*b(c\*a)\*
1. cb\*|aa\*
1. b(a | b)\*|cb\*
1. a | ac(a | b)\* | c(a | b | c)\*
1. 0(00)*(11)+

## Ejercicios diseño de AFN que reconoce el LR representado por ER

1. (a|b)\*a(a|b)\*b

## Ejercicios diseño de AFNλ que reconoce el LR representado por ER

1. ab\*|a\*b|aa\*
1. 0\*11|001\*|01\*00

## Ejercicios diseño de AFD que reconoce el LR definido simbólicamente

1. {w / w comienza con 1 y termina con 0} sobre Σ = {0, 1}.
1. {w / w contiene por lo menos tres 1s} sobre Σ = {0, 1}.
1. {w / w contiene la palabra 0101} sobre Σ = {0, 1}.
1. {w / w tiene longitud por lo menos 3 y su tercer símbolo es 0} sobre Σ = {0, 1}.
1. {w / w comienza con 0 y tiene longitud impar o comienza con 1 y tiene longitud par} sobre Σ = {0, 1}.
1. {w / w no contiene la palabra 1101} sobre Σ = {0, 1}.
1. {w / la longitud de w es a lo sumo 5} sobre Σ = {0, 1}.
1. {w / w es cualquier palabra excepto 11 y 1111} sobre Σ = {0, 1}.
1. {w / cada posición impar de w es un 1} sobre Σ = {0, 1}.
1. {w / w contiene por lo menos dos 0s y a lo sumo un 1} sobre Σ = {0, 1}.
1. (λ, 0} sobre Σ = {0, 1}.
1. {w / w contiene un número par de 0s y exactamente dos 1s} sobre Σ = {0, 1}.
1. {} sobre Σ = {0, 1}.
1. {w / w tiene por los menos dos 0s y por lo menos tres 1s} sobre Σ = {0, 1}.
1. {w / w tiene exactamente dos 0s y por lo menos dos 1s} sobre Σ = {0, 1}.
1. {w / w tiene un número par de 0s y uno o dos 1s} sobre Σ = {0, 1}.
1. {w / w tiene un número par de 0s y cada 0 está seguido por lo menos un 1} sobre Σ = {0, 1}.
1. {w / w tiene un número impar de 0s termina con 1} sobre Σ = {0, 1}.
1. {w / w tiene longitud par y un número impar de 1s} sobre Σ = {0, 1}.
1. {w / w no contiene la palabra 01} sobre Σ = {0, 1}.
1. {w / w no contiene la palabra 1010} sobre Σ = {0, 1}.
1. {w / w no contiene las palabras 10 ni 01} sobre Σ = {0, 1}.
1. {w / w es cualquier palabra que no está en 0\*1\*} sobre Σ = {0, 1}.
1. {w / w es cualquier palabra que no está en (01+)\*} sobre Σ = {0, 1}.
1. {w / w es cualquier palabra que no está en 0\*|1\*} sobre Σ = {0, 1}.
1. {w / w es cualquier palabra que no contiene exactamente dos 1s} sobre Σ = {0, 1}.
1. {w / w es cualquier palabra excepto 0 o 1} sobre Σ = {0, 1}.

## Ejercicios diseño de AFN que reconoce el LR definido simbólicamente

1. L = {0^n / n > 0} ᴜ {1^n / n > 0}
1. L = {a^n / n ≥ 0} ᴜ {b^na / n ≥ 1}
1. L = {w / w tiene un número par de 0s, un número impar de 1s y no contiene la palabra 01}

## Ejercicios diseño de AFD que reconoce el LR definido coloquialmente

1. "Todas las palabras sobre el alfabeto {a, b, c} que tienen por lo menos tres letras". Representa la función de transiciones mediante una TT.
1. "Todos los números enteros en base 10 que pueden estar precedidos por un signo". Algunas palabras de este lenguaje son: 6, 1234, -47822, +9876543210, 000. Algunas palabras que no pertenecen a este lenguaje son: 123A, *66, 14.25. Considerar que el alfabeto original son todos los símbolos ASCII. Para simplificar, suponer que el alfabeto del AFD está formado por tres símbolos: S, que representa a cualquiera de los dos signos; D, que representa a cualquiera de los diez dígitos decimales; y O, que representa a cualquier otro símbolo.
1. "Todos los números binarios que contienen una secuencia de exactamente dos ceros por lo menos una vez".
1. "Palabras en el alfabeto {a, b} en que la cantidad de a's es impar".
1. "Palabras en el alfabeto {0, 1} en que las cadenas empiecen con 1 no tienen un par de 0´s consecutivos".
1. Lenguaje L sobre el alfabeto {%, &} cuyas palabras verificar las siguientes restricciones:
    * Si una palabra tiene menos de cinco &, entonces tiene un número par de &.
    * Si una palabra tiene cinco & o más, entonces contiene un número impar de &.
    * Cualquier palabra contiene al menos un &.
1. Una cadena comando es el nombre del comando seguido de uno o más espacios en blanco, y a continuación una lista de parámetros que puede ser vacía. Un comando es una secuencia no vacía de cadenas comando separadas por un delimitador. Un delimitador es un elemento del conjunto {. , ;}. Un nombre comienza con una letra y sigue con cero o más letras o dígitos. La lista de parámetros es una secuencia de uno o más nombres separados por uno o más espacios en blanco.

## Ejercicios diseño de AF complemento

1. "Todas las palabras sobre {a, b} que no contienen la secuencia bab".
1. "Todas las palabras sobre {a, b, c} que no comienzan con la secuencia caab".
1. "Todas las palabras sobre {a, b, c} que no terminan con la secuencia abc".
1. AFD

  | Q | a | b |
  | -- | -- | -- |
  | >*0 | 1 | 2 |
  | *1 | 1 | 0 |
  | *2 | 0 | 1 |

## Ejercicios diseño de AFD según operación

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

## Ejercicios diseño de AFN según su operación

1. {w / w comienza con 1 y termina con 0} U {w / w contiene por lo menos tres 1s}
1. {w / w contiene la palabra 0101} U {w / w no contiene la palabra 1101}
1. {w / la longitud de w es a lo sumo 5} . {w / cada posición impar de w es un 1}
1. {w / w contiene por lo menos tres 1s} . {}

## Ejercicios diseño de AF intersección

1. (a | b)\* aa   y   b(a | b)\*
1. (ab\*)\*  y  b(a | b)\*

## Ejercicio completar el AF

1. M = (Q, Σ, q0, F, δ), donde: Q = {0, 1, 2, 3}; Σ = {a, b, c}; q0 = 0; F = {2, 3}; δ ={δ(0, a) = 1, δ(1, c) = 2, δ(1, b) = 3, δ(3, a) = 3}.

## Ejercicio comprobación de AF equivalentes

1. AFD1 = <{a, b, c}, {p, q, r, s, t, u, v}, f1, p, {s, t, u, v}> y AFD2 = <{a, b, c}, {p, q, r, s, t}, f2, p, {r, s, t}>

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
