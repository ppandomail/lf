# Autómata de Pila (AP)

## Definición AP

* Conocidos como autómatas “push-down”
* Permiten analizar palabras para reconocer si pertenecen o no a LIC
* Tienen la misma estructura que los AF, pero se les agrega una pila (memoria auxiliar con método LIFO) para poder guardar información que podrá ser útil en momentos posteriores del análisis
* Más poderosos que los AF, porque además de reconocer a los LR tienen la capacidad de reconocer a los LIC
* Por ejemplo: balanceo de paréntesis (por cada paréntesis de apertura debe existir posteriormente un paréntesis de cierre)
* Este aspecto es imposible de controlar con un AF
* Los AP, al disponer de memoria auxiliar (pila), pueden introducir en ella un elemento en la pila por cada paréntesis de apertura leído, e ir eliminando de la pila un elemento por cada paréntesis de cierre leído, y, por tanto, llevar el control de sí se han cerrado todos o no

## Definición formal

* Formalmente un autómata de pila se define como una 7-upla: M = <Σ, Ґ, Q, q0, p0, F, δ>
  * Σ:  alfabeto (conjunto finito de símbolos) de la cadena de entrada
  * Ґ: alfabeto (conjunto finito de símbolos) de pila. Puede tener símbolos en común con Σ. (Algunos autores Σ ∩ Ґ = Ø)
  * Q:  conjunto finito de estados
  * q0: estado inicial. q0 ∈ Q
  * p0: símbolo inicial de pila, que aparece en el tope de la pila. p0 ∈ Ґ. Ejemplo: $, #, Z0
  * F:  conjunto de estados finales o estados de aceptación. F ⊆ Q
  * δ:  función de transición entre estados. Se define: δ: Q x Σ U {λ} x Ґ\* -> Q x Ґ\*  (para algunos autores siempre hay que sacar un solo símbolo de la pila)

* Por cada estado, símbolo de entrada o palabra vacía (λ), y símbolo en el tope de la pila, determina la transición a otro estado y decide que se debe escribir en la pila
* La pila puede encontrarse o no inicializada con el símbolo inicial de pila (también llamado distinguido), es decir, cuando la pila está vacía se puede leer en su tope el valor de p0

  ![AP](img/ap.png)

## Ejemplo AP

* L = {1^n 0^n / n ≥ 1}

  ![AP para L = {1^n 0^n / n ≥ 1}](img/ap1.png)

  | TM | 1 | 0  | λ |
  | -- | -- | -- | -- |
  | >q0,$ | (q0,1$)| - | - |
  | q0,1 | (q0,11) | (q1,λ) | - |
  | q1,$ | - | -  | (q1,λ) |
  | q1,1 | - | (q1,λ) | - |

  * Σ = {0, 1}
  * Ґ = {$, 1}
  * Q = {q0, q1}
  * q0 = q0
  * p0 = $
  * F = {}
  * δ = {δ(q0,1,\$)=(q0,1$), δ(q0,1,1)=(q0,11), δ(q0,0,1)=(q1,λ), δ(q1,0,1)=(q1,λ), δ(q1,λ,$)=(q1,λ)}

## Funcionamiento

* Cuando recibe un 1 en la entrada y está en el estado q0, pone el 1 en la pila, para memorizar cuantos ha leído
* Cuando lee un 0, transita al estado q1 que se dedica a eliminar un 1 de la pila por cada 0 que lee
* Así, si la pila se queda vacía es porque ha leído el mismo número de unos que de ceros

* Entrada: 111000

| Falta leer | Leo | Pila |
| -- | -- | -- |
| 0011 |  | $ |
| 011 | 0 | 0$ |
| 11 | 0 | 00$ |
| 1 | 1 | 0$ |
| λ | 1 | $ |
| λ | λ | $ |

## Tipos de transiciones

* El AP tiene dos tipos de transiciones:
  * **Cuando lee un símbolo de la entrada**, a ∈ Σ, si está en el estado q ∈ Q, hay un símbolo en el tope de la pila Z ∈ Ґ, y la función de transición para esa terna, es:
    * δ(q, a, Z) = {(q1, z1), (q2, z2), ... ,(qn, zn)}, (qi ∈ Q, zi ∈ Ґ*)
    * Entonces transita a uno de los estado qi, se saca de la pila el símbolo Z, se pone en el tope de la pila los símbolos que formen parte del zi correspondiente, y se sitúa la cabeza de lectura en el siguiente símbolo de la entrada
  * **Cuando no se lee ningún símbolo de la entrada**, si está en el estado q ∈ Q, hay un símbolo en el tope de la pila Z ∈ Ґ, y la función de transición para la terna, es:
    * δ(q, λ, Z) = {(q1, z1), (q2, z2), ... ,(qn, zn)}, (qi ∈ Q, zi ∈ Ґ*)
    * Entonces transita a uno de los estado qi, se saca de la pila el símbolo Z, se pone en el tope de la pila los símbolos que formen parte del zi correspondiente, y no se mueve la cabeza de lectura de la entrada

### Transiciones Especiales

| Transición | Deescripción |
| -- | -- |
| δ(p,x,λ)=(q,z) | Transita sin extraer nada de la pila |
| δ(p,λ,s)=(q,λ) | Transita sin avanzar en la cinta de entrada |
| δ(p,λ,λ)=(q,λ) | Transita sin avanzar en la cinta de entrada y sin extraer nada de la pila |
| δ(p,x,λ)=(q,λ) | AF |

## Descripción instantánea

* Permite describir la configuración del AP en cada momento
* Es una terna (q, x, z), q ∈ Q, x ∈ Σ*, z ∈ Ґ*
* Contiene el estado actual, el resto de la palabra de entrada que queda por leer, y la situación de la pila en ese instante
* El primer símbolo de la palabra de entrada representa el puntero de lectura de la cinta de entrada, y el primer símbolo de la pila representa el tope de la pila
* Ejemplo:
  * momento inicial: (q0, 1100, $)
  * siguiente: (q0, 100, 1$)  
  * final: (q1, λ, λ)

## Movimientos

* Si (p, x) ∈ δ(q, a, Z), con p, q ∈ Q, a ∈ Σ U {λ}, Z ∈ Ґ, x ∈ Ґ*
* Entonces, de la descripción instantánea (q, ay, ZX), se puede pasar a la descripción instantánea (p, y, xX), representándose como: (q, ay, ZX) ├ (p, y, xX)
* Ejemplo: (q0, 1100, $)├ (q0, 100, 1$)├ (q0, 00, 11$)├ (q1, 0, 1$)├ (q1, λ, $)├ (q1, λ, λ)

## Sucesión de movimientos

* Para representar el hecho de que se puede alcanzar la descripción instantánea d2 a partir de la d1, se utilizará la siguiente notación: d1 ├* d2
* Ejemplo: (q0, 1100, $) ├* (q1, λ, λ)

## Tipos de AP

* **Autómatas de Pila Deterministas (APD)**:
  * Un AP es determinista cuando si hay alguna transición λ dados un estado q y un símbolo de la pila \$, entonces no puede haber transición con ningún símbolo de entrada, y, además, no puede haber más de una transición dados el mismo estado q y símbolo de la pila en el tope de la pila $, incluyendo las transiciones λ

* **Autómatas de Pila No Deterministas (APN)**:
  * Ejemplo:

    ![AFN](img/apn.png)

    | TM | 1 | 0  | λ |
    | -- | -- | -- | -- |
    | >q0,$ | (q0,1$)| (q0,0$) | - |
    | q0,0 | (q0,10) | {(q0,00),(q1,λ)} | - |
    | q0,1 | {(q0,11),(q1,1),(q1,λ)} | (q0,01) | - |
    | q1,$ | - | - | (q1,λ) |
    | q1,0 | - | (q1,λ) | - |
    | q1,1 | (q1,λ) | - | - |

    * Es APN debido a que, para las transiciones con (q0,0,0) y (q0,1,1), hay más de una posible transición.

      * δ(qorigen, α, A) = (qdestino, λ)
      * δ(qorigen, λ, A) = (qdestino, A)

    * Las transiciones anteriores generan no determinismo debido a que se debe interpretar como:
      * Leo una α en la cadena de entrada y teniendo A en el tope de la pila, desapilo, o
      * Sin leer ningún elemento en la cadena de entrada y teniendo A en el tope de la pila, dejo A en el tope

* Todo LIC no puede ser reconocido por un APD, por lo tanto, habrá lenguajes que son sólo reconocidos por APN

## Lenguaje aceptado por un AP: L(M)

* Es el lenguaje L aceptado por el AP M
* Es la colección de todas las palabras que acepta M
* Los lenguajes aceptados por los AP incluyen los LR
* Hay dos formas equivalentes de caracterizar el lenguaje aceptado por un AP (reconocimiento):
  * Por vaciado de pila
  * Por estado final, como en los AF

### Por vaciado de pila

* El lenguaje aceptado es el conjunto de palabras que permiten transitar desde el estado inicial hasta una descripción instantánea en la que tanto la entrada como la pila estén vacías
* LVAP = { x / (q0, x, p0) ├\* (p, λ, λ) y p ∈ Q, x ∈ Σ*}

  ![LVAP](img/ap1.png)

### Por estado final

* El lenguaje aceptado es el equivalente al de los AF: todas las palabras que permiten transitar desde el estado inicial a uno final
* Se aceptarán todas las palabras que permitan pasar de la configuración inicial a una en la que se haya leído toda la palabra de entrada y el autómata esté en uno de los estado finales, independientemente del contenido de la pila
* LFAP = { x / (q0, x, p0) ├\* (p, λ, X) y p ∈ F, x ∈ Σ*, X ∈ Ґ*}

  ![LFAP](img/lfap.png)

## AP y GIC

* Obtención del AP correspondiente a una GIC y viceversa:
  * AP asociado a una GIC: para cada GIC existe un AP que reconoce el lenguaje generado por esta
  * GIC asociada a un AP: a partir de cualquier AP, se puede construir una GIC que genera el lenguaje aceptado por el AP

### AP que reconoce por vaciado de pila el lenguaje generado por una GIC

* Entrada: G = <ΣT, ΣN, S, P> en FNG
* Salida: AP = <Σ = ΣT, Ґ = ΣN, Q = {q0}, q0 = q0, p0 = S, {},  δ> donde δ se define como sigue:
  * Si A -> aB ∈ P, (a ∈ ΣT , A ∈ ΣN , B ∈ ΣN*), entonces (q, B) ∈ δ(q, a, A)
  * Si S -> λ ∈ P, entonces (q, λ) ∈ δ(q, λ, S)
* Ejemplo: S -> (S) | ()

    ```grammar
    En FNG:
    S -> (SA | (A
    A -> ) 
    ```

  ![VAP](img/vap.png)

### AP que reconoce por estado final el lenguaje generado por una GIC

* Entrada: G = <ΣT, ΣN, S, P>
* Salida: AP = <Σ = ΣT, Ґ, Q, q0, p0, {q2}, δ> donde:
  * Ґ = ΣT U ΣN U {p0}, de forma que p0 ∉ (ΣT U ΣN)
  * Q = {q0, q1, q2} donde q0 es el estado inicial, q1 es el estado por el que se realizan las transiciones, y q2 es el estado final
  * La función de transición δ se define como sigue:
    * δ(q0, λ, p0) = {q1, Sp0} donde S es el axioma de la GIC
    * Para cada A ∈ ΣN , si A -> a ∈ P, (a ∈ Σ*), entonces (q1, a) ∈ δ(q1, λ, A)
    * Para cada a ∈ ΣT , (q1, λ) ∈ δ(q1, a, a)
    * δ(q1, λ, p0) = {q2, p0}
* Ejemplo: S -> (S) | ()

  ![FAP](img/fap.png)

* Ejemplo:

  ```grammar
  S -> zMNz
  M -> aMa | z
  N -> bNb | z
  ````

  ![FAP](img/fap2.png)

## Lema del bombeo para LIC

* Se utiliza para demostrar que determinados lenguajes no son LIC
* Las GIC en FNC permiten obtener la relación que existe entre la longitud de una palabra y el número de pasos de su derivación
* Se puede probar mediante inducción, que si se puede derivar w y |w| > 0, entonces la derivación tiene exactamente 2|w| etapas (sustitución)
* El conocimiento de la relación existente entre la |w| y su derivación en una GIC permite demostrar el lema del bombeo para los LIC

* Sea L un LIC
* Existe una constante n tal que para toda palabra w perteneciente a L con |w| ≥ n, se puede descomponer w en 5 palabras w = uvxyz de modo que:
  * v ≠ λ  o  y ≠ λ, es decir, |vy| > 0
  * |vxy| ≤ n
  * Para todo k ≥ 0, la palabra uv^kxy^kz también pertenece a L

* Con otras palabras...
  * En cualquier palabra lo suficientemente larga de un LIC, es posible encontrar a los sumo dos subpalabras cortas y muy próximas que pueden “bombearse” en tándem. Es decir, se puede repetir ambas palabras k veces, para cualquier entero k, y la palabra resultante pertenecerá al lenguaje
  * El lema del bombeo para los LIC es bastante similar al lema de bombeo para los LR, pero se descompone cada palabra w del LIC L en 5 partes y se bombean en tándem la segunda y la cuarta partes

* Este lema define una condición necesaria, pero no suficiente, para que un lenguaje sea independiente del contexto
* Por ello, del hecho de que un lenguaje cumpla la conclusión del lema no se sigue que sea independiente de contexto
* Sin embargo, si no la cumple, queda demostrado que no lo es

* Demostración que L = {a^nb^n / n > 0} es LIC. No es suficiente

  ![Bombeo L = {a^nb^n / n > 0}](img/bombeo1.png)

* Demostración que L = {a^nb^nc^n / n> 0} no es LIC. Es suficiente

  ![Bombeo L = {a^nb^nc^n / n> 0}](img/bombeo2.png)

## Propiedades de los LIC

* Las GIC son incapaces de expresar las restricciones de que:
  * diferentes variables no pueden tener el mismo nombre
  * el número de parámetros formales de una función debe ser igual al número de parámetros actuales cuando se llama a la función
  * las referencias a identificadores no declarados son ilegales
* No obstante, lo anterior, el poder de las GIC permite incluir un considerable número de reglas de sintaxis de los lenguajes de programación actuales
* Las características del lenguaje que se salen del alcance de las GIC se manejan como casos especiales o se evalúan como parte del análisis semántico, en vez de hacerlo en las rutinas de análisis sintáctico

## Estructura interna de un Compilador

  ![Compilador](img/compilador.png)
