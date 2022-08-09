# Introducción a los Lenguajes Formales

## Lenguaje Formal (L)

* Los LENGUAJES FORMALES están formados por PALABRAS, las palabras son CADENAS y las cadenas están constituidas por SÍMBOLOS de un ALFABETO. 

## Símbolo (ó)

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
* Se construye CONCATENANDO (yuxtaponiendo) símbolos de un alfabeto dado. 
* w = s1s2 ...sn        donde si ∈ Σ, para 1 ≤ i ≤ n
* Ejemplos:
  * abac (se lee "a-b-a-c") es una palabra formada con símbolos del alfabeto {a, b, c}. 
  * 101110 ("uno-cero-uno-uno-uno-cero") es una palabra construida con símbolos del alfabeto {0, 1}. 
  * abc, abb, aaaaaa son palabras construidas con símbolos del alfabeto {a, b, c}

### Longitud de una palabra

* Es la cantidad o número de símbolos del alfabeto que la componen.
* Se representa |w|.
* Ejemplos:
  * |palabra| = 7; en el caso de que los símbolos sean los del alfabeto español.
  * |palabra| = 3; en el caso que Σ = {na, pa, la, bra} 
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
* NO ES CONMUTATIVA, es decir,  w1 w2 ≠ w2 w1
* La palabra vacía (λ) es la IDENTIDAD para la concatenación. Esto es: para cualquier palabra w, w λ = λ w = w. 
* Ejemplos: 
  * Sean w1 = aab y w2 = ba; entonces, w1w2 = aabba.
  * abc . aaaaa = abcaaaaa  

### Potenciación de una palabra

* Si w es una palabra, entonces w^n (con n ≥ 1 y entero) representa la palabra que resulta de concatenar la palabra w, consigo misma, n-1 veces. 
  * w^n = w.w.w…w (n-veces)
* w^0 = λ (la palabra vacía), para cualquier palabra w. 
* Ejemplos: 
  * Sea w = ab; entonces: w^3 = www = (ab)^3 = ababab. 
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
* w^-1 = an…a2a1
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

