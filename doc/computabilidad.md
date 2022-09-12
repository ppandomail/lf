# Teoria de la Computabilidad

* Parte de la computación que analiza y determina los problemas que pueden resolverse por medio de un algoritmo o bien por una MT.

## Función computable

* Una **función f es computable**, si existe un algoritmo que puede ser descrito en un número finito de pasos o enunciados y con cuya ayuda se puede obtener efectivamente el valor de la función f(w) para todo posible argumento w.
* Una **función f es Turing-computable, o computable**, si existe una MT que computa f(w) para toda w perteneciente al dominio de f.
* **"computable"**: cualquier proceso que pueda representarse con una MT.

## Turing–calculable

* Toda MT describe un algoritmo. ¿Todo algoritmo puede ser realizado por una MT?
* Toda computación puede ser concebida como un proceso susceptible de ser dividido en pasos aislados.
* Un paso de computación lleva de una cierta situación inicial o configuración inicial a una nueva situación o configuración.
* Sea f una función, se dice que f es Turing-computable si existe una MT sobre un alfabeto Γ con Σ < Γ tal que si se escribe una palabra arbitraria w (sobre Σ) en la cinta de cálculo, entonces MT se detendrá después de un número finito de pasos tras una palabra que represente el valor f(w) de la función.
* Las MT también pueden ser utilizadas para calcular resultados u operaciones a partir de la entrada.
* En vez de considerar como "basura" el contenido de la cinta al llegar a halt, se podría ver como un resultado calculado.
* Una MT M calcula una función f : Σ\* -> Σ\* si para toda entrada w, M calcula un resultado u tal que f(w) = u. Si hay una MT que calcula una función f, se dice que f es Turing-calculable.
* Las MT se pueden utilizar para cálculos de funciones, en donde los números de esas funciones se encuentran codificados en unarios (unos).  Ejemplo 5 = 11111.
* Si la función tiene más de un valor de entrada, los mismos se encuentran en la cinta de entrada separados por el símbolo cero (0).
* El resultado de la función también se encuentra codificado en unario.
* En el caso de querer presentar el valor cero "0", el mismo se muestra a través de una cinta vacía, es decir, con todas sus posiciones con valor "B"; ó con solo el valor "0".

### Ejemplo MT que calcula el complemento a 1 de un número binario

| Q | 0 | 1 | □ |
| -- | -- | -- | -- |
| >q0 | (q0,1,R) | (q0,0,R) | (q1,□,S) |
| *q1 | - | - | - |

### Ejemplo MT que calcula el número consecutivo de un número binario

| Q | 0 | 1 | □ |
| -- | -- | -- | -- |
| >q0 | (q0,0,R) | (q0,1,R) | (q1,□,L) |
| q1 | (q2,1,S) | (q1,0,L) | (q2,1,S) |
| *q2 | - | - | - |

### Ejemplo MT que calcula n % 2

| Q | 1 | □ |
| -- | -- | -- |
| >q0 | (q0,1,R| (q1,□,L) |
| q1 | (q2,□,L) | (q4,□,S) |
| q2 | (q1,□,L) | (q3,□,R) |
| q3 | - | (q4,1,L) |
| *q4 | - | - |

### Ejemplo MT que suma dos números unarios separados por cero

| Q | 0 | 1 | □ |
| -- | -- | -- | -- |
| >p | (p,1,R) | (p,1,R) | (q,□,L) |
| q | - | (s,□,S) | (s,□,S) |
| *s | - | - | - |

## Máquina de Turing Universal

* Alan Turing introdujo una generalización de su máquina, a la que se denominó Máquina de Turing Universal (MTU) o máquina-u.
* Se trata de una MT que es capaz de simular cualquier otra MT, y por tanto capaz de procesar distintos programas. Por consiguiente, una computadora es un ejemplo de MTU.
* El hecho de que una MT pueda ser universal representa un paso decisivo en la historia de las computadoras.
* Es una máquina que recibe en la cinta una descripción de otra MT, y el contenido de la cinta de esta MT, y produce, como resultado de su ejecución, el mismo resultado que produciría la MT sobre su cinta.
* Recibe el nombre de universal, porque es capaz de simular el comportamiento de cualquier MT.
* Se convierte de esta forma, en un dispositivo análogo a una computadora, capaz de realizar cualquier cómputo.
* Sin perder generalidad, se puede reducir el número de MT que una MTU es capaz de simular, a las máquinas binarias con cinta limitada a la derecha (MTBD).

![MTU](img/mtu.png)

### Codificación

* La cinta de una MTU es infinita en ambos sentidos, y se divide en dos partes, separadas por símbolo identificativo (por ejemplo, $).
* A la derecha de $ se codifica la MTDB.
* A la izquierda de $ se codifica su cinta (CMTDB).
* El resultado de la ejecución de la MTU consistirá en dejar la parte derecha de la cinta (la que describe la MTBD) intacta, y, en la izquierda, la misma información que habría dejado en su cinta la MTDB.
* Para que la MTU realice su trabajo, simulando a otra MT, se debe codificar la MT y su cinta de entrada en la cinta de entrada de la MTU.
* La codificación de la CMTBD transcribe la cinta tal cual, exceptuando la posición que ocupa la cabeza lectora grabadora, en la cual se coloca otro símbolo identificativo de cabeza lectora grabadora (por ejemplo,  *).
* El bit que había en dicha posición, se transcribe justo a la derecha del símbolo $.
* Para codificar la MTBD, en primer lugar se codifican los estados en binario. Así, si se tienen 6 estados, se necesitarán 3 bits para su codificación.
* La parte derecha de la cinta se divide en tantos registros como entradas tenga la tabla de transiciones de la MTBD.
* Cada registro está separado por un símbolo especial (por ejemplo, #) y contiene, en binario, la codificación de cada transición, de la siguiente manera:
  * El estado en que está (estado origen, codificado en binario).
  * El símbolo a leer (0 ó 1)
  * El estado al que va (estado destino, codificado en binario).
  * El símbolo a escribir (0 ó 1)
  * El movimiento a realizar (codificado en binario, por ejemplo 0 derecha "R", 1 izquierda "L")
  * Entre el símbolo $ y el primer registro, denotado por # está el estado en que está la máquina y el símbolo que lee en ese momento la cabeza lectora grabadora.

* Ejemplo: Suponer que se tiene la siguiente MT: MTB2 = ({0, 1}, 0, {p, q, r}, p, δ, {})

| Q | 0 | 1 |
| -- | -- | -- |
| p | q0R | p1L |
| q | p1L | r0R |
| r | q1R | p0L |

* Y la cinta CMTB2 contiene la siguiente secuencia binaria, donde la cabeza de lectura escritura estaría en el tercer uno: CMTB2 = ...101101

1. Se calcula el número de bits necesarios para representar los estados. Se necesitan 2 bits para codificar los estados: p -> 00, q -> 01, r -> 10
2. El número de bits para codificar las entradas es 1. En esta caso, la codificación es inmediata: el 0 para representar a la entrada 0 y el 1 para la entrada 1.
3. En el caso del movimiento, se codifica con un bit para los dos posibles movimientos (0 para la R y 1 para la L).

* Así, la cinta de la MTU sería: 101*01$001#0000100#0010011#0100011#0111000#1000110#10100001

* Donde, por ejemplo, el contenido del primer registro, 0000100, estará formado por la primera transición: 00 (estado p), 0 (entrada 0), 01(transita al estado q), 0 (escribe un 0), y 0 (se mueve a la derecha).
* Con esta codificación, el funcionamiento de la MTU sería el siguiente:
  1. Localizar en alguno de los registros la cadena que aparece entre los símbolos $ y # (llamarlo registro 0);
  1. Leer y memorizar uno a uno los símbolos que restan del registro encontrado, excepto el último (que se corresponde con el movimiento a realizar);
  1. Para c/u de los símbolos memorizados con anterioridad, colocarlos en la parte correspondiente del registro 0;
  1. El penúltimo bit del registro localizado (que se corresponde con el bit a escribir), se escribe en el lugar que ocupa el *;
  1. Se localiza y memoriza el último bit del registro encontrado anteriormente (que se corresponde con el movimiento), para desplazar la cabeza lectora/grabadora correctamente y colocar el * en el lugar adecuado;
  1. El contenido que había en la posición donde se escribe el * ha de ser memorizado y escrito en la última posición del registro 0, para, de esta forma, recoger lo que lee la cabeza lectora y poder preparar todo el sistema para una nueva lectura.

## Tesis de Church - Turing

* Alonzo Church formuló con Alan Turing lo que se ha bautizado como Tesis de Church - Turing.
* La tesis establece que la clase de problemas que puede resolver una MTU, y por tanto una computadora, son los que su solución puede ser expresada por medio de un algoritmo (expresión de la época: "método efectivo de computación").
* De estas consideraciones se concluye que una computadora es una MTU que procesa algoritmos. Cuando la solución a un problema es expresable por medio de un algoritmo.
* Si una función f es computada por una MT T, entonces las quíntuplas que definen constituyen en sí un algoritmo, pues son una lista finita de instrucciones, codificadas en un lenguaje, y que pueden llevarse a cabo de manera mecánica.
* Church enunció una tesis similar, pero utilizando otro formalismo: las funciones recursivas parciales o generales (clase de funciones de los números naturales en los números naturales f: N -> N que son "computables" en un sentido intuitivo). Ejemplo: función constante cero C(x)=0, función sucesor S(x) = x + 1, función proyección Πn,i (x1, ..., xn) = xi

### Tesis de Turing

* Todo proceso que corresponda a un algoritmo puede ser realizado por una MT, es decir, es Turing-computable.
* "Las funciones que pueden ser calculadas mediante un algoritmo, son las funciones que pueden ser calculadas por medio de una MT", además demostró que el Entscheidungsproblem no era computable, dando suficientes argumentos al respecto.
* Todo proceso computacional realizado por una MT es en realidad el cálculo de una función recursiva parcial.

### Tesis de Church

* Todo proceso que corresponda a un procedimiento efectivo o las funciones efectivamente computables constituyen la clase de funciones Recursivas Parciales.
* "Las clases de funciones que se pueden calcular mediante un algoritmo coinciden con las funciones recursivas". Con base en eso, Church demostró que el problema Entscheidungsproblem es no computable.
* Toda función recursiva parcial es computable por una MT.

### Conclusión

* Church y Turing trabajaron en el mismo problema pero en forma independiente y llegaron a los mismos resultados en cuanto al Entscheidungsproblem y las conclusiones de ellos forman lo que hoy se conoce como la tesis de Church - Turing, que establece que: **"Si una Máquina de Turing no puede resolver un problema, ninguna otra computadora podrá hacerlo puesto que no existe algoritmo para resolver dicho problema"**.

## Limitaciones de computabilidad

* ¿Qué cosas las MT NO pueden hacer?
* Se pueden categorizar a los problemas de acuerdo a la posibilidad de resolverlos en términos de MT.

## Problemas de decisión (PD)

* Es aquel formulado por una pregunta (referida a alguna propiedad) que requiere una respuesta de tipo "sí/no"; es decir, cuando el resultado de la computación es sí o no (1 ó 0).
* Esta clase de computabilidad se conoce como resolubilidad.
* Ejemplo: El problema "dada una GIC G, ¿L(G) es vacío?". Hay un número infinito de casos, uno por cada GIC. Además, para cada caso, se puede determinar una respuesta afirmativa o negativa.

### Tipos de problemas de decisión

* **Solubles (resolubles, decidibles, computables)**: si existe un algoritmo que es capaz de responder sí o no a cada uno de dichos casos. Existe una MT que **siempre para** al resolver el problema. Ejemplos: Dado un número natural, ¿es par?. Dada una GIC G, ¿L(G) es vacío?. Dada una GR G y una palabra w, ¿w ∈ L(G)?
* **Insolubles (irresolubles, indecidibles, no computables)**: si no existe un algoritmo que es capaz de responder sí o no a cada uno de los dichos casos. **No existe una MT para resolver el problema**. Ejemplos Dada una GIC G, ¿G es ambigua?. Dada una MT M, ¿M se detendrá comenzando en el estado inicial con w en la cinta?

## Problema de la parada

* Sea M una MT arbitraria con un alfabeto de entrada Σ. Sea w ∈ Σ*.  ¿Parará M con la palabra w como cadena de entrada?, es decir, ¿se puede determinar si M terminará en un número finito de pasos cuando es ejecutada usando w como palabra de entrada?
* Alan Turing, en su famoso artículo “On Computable Numbers, with an Application to the Entscheidungsproblem” (1936), demostró que el problema de la parada de la MT es indecidible (no computable o insoluble), en el sentido de que ninguna MT lo puede resolver.
* Al ejecutar un programa, este puede terminar  después de un número finito de pasos o puede no terminar nunca (queda “trabado” o que entra en un bucle infinito).
* ¿Existe  un programa P, tal que, dado un programa cualquiera Q y unos datos de entrada x, muestre como salida:
  * 1 si Q termina en número finito de pasos o
  * 0 si Q entra en un bucle infinito.

* Conocer si existe el programa P es, en términos resumidos, el problema de la parada.
* No existe una manera automática computable de saber si todos los programas del mundo terminan.
* No se niega que exista la prueba para programas concretos.
* De hecho, la construcción de pruebas para programas concretos es un paso obligatorio para demostrar su correctitud.

* Un caso del problema de la parada está formado por la pareja Máquina de Turing – cadena de entrada (MT, w). Una solución a dicho problema sería un algoritmo que, para cualquier caso, respondiera sí o no de forma correcta.
* Considerar el lenguaje L = {w / w no es aceptada por M}.
* Se puede afirmar que L no es un LRE. Para demostrarlo, suponer que L es un LRE. Entonces L debe ser aceptado por alguna MT M. Considerar w. Observar que, si w ∈ L, entonces w no debe ser aceptada por M, con lo que w ∉ L(M) = L, lo que es una contradicción.
* Por otro lado, si w ∉ L, entonces ya que L = L(M), se obtiene que w ∉ L(M) y, por tanto, w debe estar en L, entonces ya que L = L(M), se obtiene que w ∉ L(M) y, por tanto, w debe estar en L, lo que es otra contradicción.
* De esto se deduce que no hay ninguna MT que acepte L y que, por tanto, no puede ser recursivamente enumerable.

## Ejercicios Diseño de MT calculables

1. Duplicar una cadena de aes y bes en la cinta. Ejemplo: si la MT comienza con abbaa□ en su cinta, luego de procesar su programa debe terminar con abbaa□abbaa.
1. Se dispone de una cinta en la que hay un número m de 1s seguido de un número n ≥ m de Aes. Se desea definir una MT que cambie las primeras m Aes por Bes. Se supone que la cabeza de la cinta inicialmente está en el 1 más a la izquierda.
1. Comprobar si dos palabras de entrada del LF formado por el Σ = {0, 1, 2} son iguales. Las dos palabras están separadas por el símbolo #.
1. Sumatoria de (n + i) , con 1 ≤ i ≤ n, con n codificado en unario.
1. [(x*y) / 2], para x, y > 0 codificados en unario.
1. x mod y, para x, y > 0, codificados en unario.
1. La parte entera superior del promedio de n números mayores que cero codificados en unario. Usar como separador de números unarios en la cinta de entrada al símbolo 0. Ejemplo:
    * Cinta de entrada: 111110111010 (números 5, 3 y 1).
    * Cinta resultado: 111 (cálculo [(5 + 3 + 1) / 3] = 3).
1. Calcular a^nba^m -> a^(n+m)b
1. Decidir si m < n,  a^nb^m / n, m > 0, escribiendo en la cinta T (true) o F (false).
1. Que recibe un número binario (cadena no vacía de 0’s y 1’s) y devuelve el siguiente número binario (es decir, le suma 1).
1. Para eliminar el blanco que separa los dos argumentos x e y, moviendo los símbolos de y un lugar hacia la izquierda. Σ = {a, b}.
1. MT de 3 cintas que reste el número binario de la segunda cinta del número binario de la primera y deje el resultado en la tercer cinta. Hacer otra, suponiendo que la MT es de 2 cintas y que el resultado se deja sobre la segunda. Hacerlo también para que el resultado quede en la primera.
1. MT de 3 cintas que determine si el número binario que está en la primera cinta es menor que el de la segunda. Si es menor, escribir el símbolo S sobre la tercer cinta y si no lo es, escribir los símbolos GE sobre la tercer cinta.
1. Una cinta contiene dos cadenas binarias X e Y separadas por el símbolo * tales que la longitud de cada cadena es la mínima necesaria para representar el número correspondiente (es decir, que ninguno de los números comienzan con cero). En esas condiciones construir una MT que devuelva los valores 0, 1 ó 2 según sea X = Y, X > Y o X < Y respectivamente.
1. Dados dos números binarios separados por el símbolo *, defina y construya una MT que calcule la suma de ambos números.
1. Dadas dos cadenas de palotes, separadas por el símbolo \* defina y construya una MT que decida si la primera cadena es submúltiplo de la segunda, y cuántas veces. Pruebe la solución hallada con las siguientes cadenas:
    * |||*|||||| (es submúltiplo, dos veces)
    * ||*||||| (no es submúltiplo)
