# Introducción a los Lenguajes Formales

## Ejercicios Σ

1. Escriba el Σ que se requiere para construir el conjunto de los números enteros con signo en base 10
1. Escriba el Σ mínimo a partir del cual se construye el LF L = {Argentina, Holanda, Brasil}
1. Sea el LF L = {λ, a, ba, abc}. ¿Cuál es el mínimo alfabeto Σ sobre el que se puede construir este lenguaje?

## Ejercicios w según operación

1. Dado el Σ = {0, 1, 2}, construya dos palabras en la que cada uno de estos símbolos aparezca una sola vez
1. Dado el Σ = {ab, cde}, construya una palabra que tenga cuatro símbolos
1. Simplificando con el uso de la “potenciación”, escriba la palabra que tiene 1300 aes seguidas de 846 bes seguidas de 257 aes
1. Sean las palabras S1 = aab y S2 = ba. Obtenga la palabra S1S2S1S2
1. ¿Por qué el superíndice 0 no es aplicable a símbolos pero sí a palabras?
1. Demuestre que (abc)^0 = (1234)^0
1. Demuestre que las palabras (ab^3)^3 y ((ab)^3)^3 son diferentes
1. Sean la palabras x = cd y z = ab definidas sobre el Σ = {a, b, c, d}. Calcular:
    1. x^1
    1. x^2
    1. x^0
    1. x^R
    1. x^Rz
    1. z^Rz^R
    1. x^Rz^2
    1. x^2z^3
1. Sea el LF L = {0, 00, 01, 010}. Escriba una concatenación de dos palabras que produce otra palabra de este lenguaje
1. Sea el lenguaje anterior. Escriba una concatenación de dos palabras que produce una cadena que no es palabra del lenguaje

## Ejercicios |w|

1. Sea el LF L = {ab^na / n ≥ 1}. Escriba las tres palabras de menor longitud y describa este lenguaje mediante una frase en castellano
1. Para cada uno de los siguientes LF, dé la palabra de menor longitud y otras dos palabras de distinta longitud:
    1. L1 = {w / w ∈ {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}* y w es un número par}
    1. L2 = {a^nb^md^(n+m) / n, m ≥ 0}
    1. L3 = {w / w ∈ {a, b, c, d}* y w contiene la subpalabra ab y w no la subpalabra bc}
    1. L4 = {w0^(2k+1) / w ∈ {a, b, c}* y |w| es múltiplo de 4 y w termina en bb y k ≥ 0}
    1. L5 = {w / w ∈ {a, b, c}* y w contiene al menos dos b y w contiene la subpalabra bc}
1. Sea Σ = {a, b} y sea el lenguaje Σ*. ¿Cuántas palabras de longitud 3 tiene este lenguaje? ¿Y cuántas de longitud 4?
1. Sea el lenguaje infinito L = {ab^n / n ≥ 1}. Escriba las tres palabras de menor longitud
1. Sea el lenguaje infinito L = {(ab)^n / n ≥ 1}. Escriba las tres palabras de menor longitud

## Ejercicios LF por Extensión

1. Escriba un LF con cuatro palabras de longitud cinco sobre el Σ = {c, p}
1. Describa por extensión el LF sobre el Σ = {a, b, c} formado por todas las palabras de longitud 30 que comienzan con a, terminan con b y, en medio, tienen exactamente tres ces. Una palabra de este lenguaje es: a^20cbbcacb^4
1. Dado el alfabeto Σ = {a, b, c}, escriba las palabras del LF L = {w / w ∈ Σ}
1. Escriba todas las palabras del LF L = {a^(2n+1) / 1 ≤ n ≤ 4}

## Ejercicios LF por Comprensión Simbólica

1. Describa por comprensión el siguiente LF L = {λ, b, bb, bbb, bbbb, bbbbb, bbbbbb, bbbbbbb, bbbbbbbb}
1. Describa por comprensión el LF sobre el Σ = {a, b, c} formado por todas las palabras de longitud 30 que comienzan con a, terminan con b y, en medio, tienen exactamente tres ces. Una palabra de este lenguaje es: a^20cbbcacb^4
1. Sea el LF L = {a^(2n) / 200 ≥ n ≥ 0}. Escriba, por comprensión, el LF que se obtiene realizando todas las concatenaciones de dos palabras cualesquiera del lenguaje dado
1. Sea el Σ = {0, 1}. Describa, por comprensión, un lenguaje infinito L sobre Σ (que no sea Σ*)

## Ejercicios LF por Comprensión Coloquial

1. Describa mediante una frase el LF L = {λ, b, bb, bbb, bbbb, bbbbb, bbbbbb, bbbbbbb, bbbbbbbb}
1. Describa mediante una frase al LF L = {a^(2n+1) / 200 ≥ n ≥ 0}
1. ¿Cuál es la cardinalidad del lenguaje L = {λ, a, aa, aaa}? Describa el lenguaje mediante una frase en castellano
1. Describa, mediante una frase en castellano, el lenguaje L = {a^nb^n / 1 ≤ n ≤ 3000}

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
1. Sean L1 y L2 lenguajes arbitrarios sobre un Σ, ¿Cuáles de las siguientes afirmaciones son verdaderas y por qué? Para las falsas, dé un contraejemplo adecuado
    1. L1 L2 = L2 L1
    1. {}* L1 = {λ} L1 = L1
    1. (L1 L2)\* = L1\*L2\*
    1. {} L1 = L1 {} = L1
    1. L1 {} = {λ}
    1. L1 {λ} = {}

## Ejercicios w pertenece o no a un LF

1. Sean L1 = {a^nb^(2k) / n ≥ 0 y k ≥ n} y L2 = {0^m1^n / m impar y n par, o m par y n par}. Determine para cada una de las siguientes palabras si pertenecen o no pertenecen al lenguaje indicado
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
