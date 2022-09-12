# Teoria de la Complejidad Computacional

## Complejidad computacional respecto a los algoritmos

* Algoritmia: es el estudio del diseño y análisis de algoritmos:
  * **Correctitud de los algoritmos**: finalización y obtención del resultado deseado.
  * **Eficiencia de los algoritmos**: cantidad de recursos que utiliza (tiempo, espacio).

* Deben ser medidos en forma objetiva:
  * **Empíricamente**: se programa el algoritmo y se corren tests con distintas entradas.
  * **Teóricamente**: se determina matemáticamente la cantidad de recursos necesarios como una función de la entrada.

* Para cada algoritmo, la cantidad de recursos (memoria, tiempo) depende fuertemente del tamaño de la entrada.
* Se definen entonces funciones de cantidad de recursos en base al tamaño de la entrada (cantidad de dígitos de un número, cantidad de elementos en un vector, etc.).
* Estas funciones determinan una "unidad de medida" de los factores de complejidad algorítmica.

## Complejidad computacional respecto a los autómatas y lenguajes

* Las distintas definiciones de una MT no incrementan la potencia computacional del modelo básico.
* Una MT de un tipo puede simular una MT de otro tipo.
* Cuando se simulan las acciones de una MT de un tipo más complejo mediante una que corresponde al modelo básico, es habitual que se consuma la mayoría del espacio y del tiempo.
* El modelo de MT que se use no afecta a la potencia computacional o a la capacidad para decidir un problema.
* Sin embargo, los requerimientos de espacio y tiempo para una computación se ven claramente afectados por el modelo elegido.
* La complejidad de una computación se mide por la cantidad de espacio y tiempo que consume.
* Las computaciones eficientes tienen unas exigencias de recursos pequeñas.
* Es común estudiar la complejidad en el contexto de un sistema computacional fijo, por ejemplo, la MT:

![MT complejidad](img/complejidad.png)

## Complejidad Espacial

* Sea M una MT con k cintas. Suponer que, sobre cualquier entrada de longitud n, la cabeza de lectura/escritura de M consulta al menos S(n) celdas de cualquiera de las cintas, donde S: N -> N es una función.
* Entonces se dice que M tiene una complejidad espacial S(n) o que es una MT espacialmente acotada por S(n).
* También se dice que L(M) es un lenguaje con complejidad espacial S(n).
* Es el número de celdas de la cinta que dicho cálculo requiere.

| Configuración Inicial | Complejidad Espacial |
| -- | -- |
| ...□**x**xx□□□... | 5 (la cabeza se moverá hasta la cuarta celda de la cinta antes de regresar a la primera y detenerse) |
| ...**□**□□□...| 2 (la máquina ejecutará un cálculo con complejidad espacial dos ya que sólo se utilizarán dos celdas de la cinta) |

## Complejidad Temporal

* La complejidad temporal de las computaciones de MT, depende del tamaño de la cadena de entrada.
* El tiempo se mide por el número de movimientos que hace la MT.
* Sea M una MT de k cintas. Se supone que M realiza como máximo T(n) movimientos sobre toda cadena de longitud n y para una función T: N -> N.
* Entonces se dice que M tiene complejidad temporal T(n) o que es un MT con cota temporal T(n).
* Además se dice que L(M) es un lenguaje temporalmente acotado por T(n) o con complejidad temporal T(n).
* Es el número de pasos que se ejecutan durante los cálculos.

| Configuración Inicial | Complejidad Temporal |
| -- | -- |
| ...□**x**xx□□□... | 7 (3 pasos para mover la cabeza al primer espacio en blanco después de la x, 1 paso para escribir una x en este lugar y  3 pasos más para colocar la cabeza en el primer blanco). No se considera Stay |
| ...**□**□□□...| 1. No se considera Stay |

## Complejidad de los cálculos de Máquinas de Turing

* Se observa que las complejidades espacial y temporal son diferentes y, por lo tanto, es posible que difieran para el mismo cálculo.
* Sin embargo, no son independientes: "Si la complejidad temporal de una MT es n, entonces la complejidad espacial del cálculo no será mayor que n + 1".

## Ejemplo de complejidad computacional

* Comparar 2 palabras de igual longitud en {x, y, z}\* escritas en la cinta separadas por un asterisco  #yxxz*yxzx###...
* La máquina deberá detenerse con la configuración en cinta:
  * #Y###... Si las palabras son iguales.
  * #N###... Si las palabras son diferentes.
* El tiempo requerido para que esta máquina complete su tarea depende de la longitud de la palabra de entrada.
* El tiempo requerido para ejecutar un algoritmo tiende a ser una función de la longitud de entrada. En este caso, la siguiente fórmula indica el tiempo necesario (medido en pasos ejecutados) para confirmar que 2 palabras de longitud n son idénticas: **2n^2 + 10n + 9**
  * 2n^2 + 5n + 1 pasos para completar el proceso de comparación.
  * 5n + 4 pasos para mover la cabeza hacia el extremo derecho de la entrada y borrar la cinta de derecha a izquierda.
  * 3 pasos para escribir el símbolo Y en la cinta.
  * 1 paso para trasladarse al estado de parada.
* Complejidad temporal para comparar 2 palabras idénticas: **2n^2 + 10n + 9**

| Longitud w | Pasos |
| -- | -- |
| 4 | 81 |
| 10 | 309 |

* Al evaluar la complejidad de un algoritmo, se manejan dos variaciones en el rendimiento de un algoritmo identificando las situaciones en el:
  * **Peor caso**: se da en el cálculo más largo, se evalúa toda la cadena (las cadenas son idénticas) -> **2n^2 + 10n + 9**
  * **Mejor caso**: se da en el cálculo más corto, cuando las cadenas difieren en la primera posición -> **6n + 10**
* Se define la Complejidad Temporal de un algoritmo como su rendimiento en el peor caso.

## Tratabilidad

* Dado un algoritmo que resuelve un problema, es razonable preguntarse si no existirá un algoritmo más eficiente.
* El objetivo fundamental de la complejidad computacional es clasificar los problemas de acuerdo a su tratabilidad, tomando el o los algoritmos más eficientes para resolverlos.
* Se debería poder determinar:
  * ¿Cuán tratable es el problema?
  * Si el problema es tratable: ¿el algoritmo es eficiente?

### Problemas Abiertos y Cerrados

* Si se demuestra que el problema no admite soluciones mejores, entonces se puede afirmar que el algoritmo es eficiente (salvo las constantes ocultas).
* Un problema se dice **cerrado** si se han encontrado algoritmos que lo resuelven y se ha demostrado que estos algoritmos son óptimos en cuanto al orden exacto del tiempo de ejecución.
* Por ejemplo, la búsqueda en un arreglo ordenado y el ordenamiento de un arreglo son problemas cerrados.

### Grados de Tratabilidad

* Para cerrar un problema se puede encontrar un algoritmo asintóticamente mejor que los que se conocen.
* En general, los distintos grados de tratabilidad son muy subjetivos (varían mucho de acuerdo al modelo computacional, los recursos disponibles, las variantes de las estructuras de datos, etc.).
* Por lo tanto, un objetivo primario del estudio de la complejidad es definir cuáles problemas son tratables y cuáles no, para luego considerar distintos grados de tratabilidad o intratabilidad.
* Muchos problemas computacionales son **tratables**: tienen solución para instancias grandes.
* Algunos problemas son **intratables**: el Problema de las Torres de Hanoi, el Problema del Viajante; los mismos pueden resolverse solamente para instancias pequeñas.
* En general, aquellos problemas con **complejidad polinomial son tratables**, mientras que los problemas con **complejidad super polinomial (más allá de polinomial) son intratables**.

| Tiempo | Ejemplo |
| -- | -- |
| O(1) constante | Agregar un item al principio de una lista |
| O(log n) log | Búsqueda en un arreglo ordenado |
| O(n) lineal | Búsqueda en un arreglo desordenado |
| O(n log n) | Ordenar n items usando mergesort |
| O(n^2) cuadrático | Camino más corto entre dos nodos de un grafo |
| O(2^n) exp| Resolver Torres de Hanoi |

## Complejidad de los problemas

* Una función de cadena f es Turing computable si existe una MT M que, dada una cadena de entrada w, calcula u siempre que f(w) = u.
* Una función de cadena que es Turing computable se dice que es computable en tiempo polinómico si hay una MT que la calcula y tiene una cota temporal polinómica.

## Clases de Problemas

* Entre los problemas decidibles, el hecho de saber si una MT se parará en un tiempo finito no resulta práctico, si dicho tiempo es excesivo.
* Por eso es interesante estudiar las necesidades de ejecución de un algoritmo.
* Para ello, se suelen distinguir  dos clases de problemas: P y NP

### Clase P

* Prácticamente todos los algoritmos que se ejecutan en una computadora tienen una complejidad polinomial, es decir; la relación entre el tamaño del problema (número de datos o valor de n) y el tiempo de ejecución se puede encontrar por medio de una expresión polinomial.
* Son algoritmos que tienen una complejidad de O(n), O(log n)
* Ejemplos: algoritmos de búsqueda, ordenamiento, etc.
* La clase P se compone de todos los lenguajes que acepta una MTD que tiene una cota temporal polinómica.
* Un lenguaje se dice polinomialmente decidible, si es Turing-decidible con una MT acotada polinomialmente.
* P es la clase de lenguajes polinomialmente decidibles
* Informalmente, P es la clase de problemas que se resuelven en un tiempo polinomial por una MTD.
* Aparentemente, el Problema del Viajante no se encuentra en esta categoría, ya que el tiempo para hallar la solución crece exponencialmente con la cantidad de ciudades del mapa.
* A pesar de los constantes esfuerzos de encontrar una MTD que resuelva el Problema del Viajante (entre otros) en tiempo polinomial, ninguna se ha encontrado.
* Sin embargo, este problema, y otros similares, se pueden resolver en tiempo polinomial, pero con MTND.

### Clase NP

* Son aquellos algoritmos en donde el número de pasos que se deben realizar para llegar al resultado tienen un crecimiento exponencial en relación a la cantidad de datos o valor de n.
* Esto ocurre en los algoritmos para encontrar combinaciones.
* Ejemplo: factorial de n, obtener los movimientos que se realizan para acomodar n discos con el algoritmo de las torres de Hanoi.
* Se dice que no es conveniente ejecutar algoritmos con complejidad NP con valores medianamente grandes de n, ya que la computadora no puede con ellos, no solamente por el factor tiempo sino también por el espacio.
* La clase NP se compone de todos los lenguajes que aceptan MTND que tengan una cota temporal polinómica.
* Se define entonces otra clase de problemas.
* NP es la clase de lenguajes decidibles con MTND  polinomialmente acotadas.
* Informalmente, NP es la clase de problemas que pueden ser resueltos por una MTND en tiempo polinomial.
* Ejemplos:
  * Dados 2 AFN con el mismo alfabeto, responder "S" si y sólo si aceptan lenguajes distintos.
  * Dada un GIC y un entero positivo k, responder "S" si y sólo si la GIC no es LR(k)
  * Dada una colección finita k de enteros positivos y otro entero positivo n, responder "S" si y sólo si existe un subconjunto de k cuya suma sea n.
  * Dado un grafo, responder "S" si y sólo si dicho grafo contiene una ruta que visita precisamente una vez cada uno de los vértices y termina en el mismo vértice donde se inició (esta ruta se conoce como circuito de Hamilton).

### P vs. NP

* Claramente, P está incluido o es igual a NP.
* Al ser las MTD un caso particular de las MTND, todo problema P es también un problema NP.
* Hasta el momento no se ha podido demostrar si es o no posible resolver todos los problemas NP en tiempo polinómico de manera determinista. Por consiguiente, la cuestión de si las clases de problemas P y NP son o no iguales es un problema abierto en la informática.

### NP-completos

* Un problema L que pertenece a NP es NP-completo si todos los demás problemas de NP se pueden reducir a él en tiempo polinómico en una MTD.
* Esta  clase de problemas es importante, pues bastaría encontrar una solución en tiempo polinómico en una MTD para un solo problema L que sea NP-completo, para demostrar que P = NP.
* En efecto: como cualquier problema NP se puede reducir a L en tiempo polinómico y L se puede resolver en tiempo polinómico, todo problema en NP tiene que tener una solución determinista en tiempo polinómico.
* Teorema de Cook. SAT es NP-completo.
* Dada una expresión de la lógica proposicional, el problema SAT tiene por objeto descubrir si es posible satisfacerla. Por ejemplo: p ^ (q v ¬p).
* La expresión completa será verdadera si y sólo si las dos cláusulas son verdaderas. Se puede afirmar que ésta es satisfactible.
* Este problema es resoluble. Pertenece a NP y es NP-completo.

## Ejercicios

1. Dada una MT que reconoce el lenguaje L = {wcw^(-1) / w ∈ Σ*} determinar las complejidades espacial y temporal realizada por la misma.
1. Dada una MT que calcula la función de cadena f((ab)^n) = (ab)^(n+1), determinar las complejidades espacial y temporal realizada por la misma.
