# UNIVERSIDAD ARGENTINA DE LA EMPRESA

## Departamento de Tecnología Informática

## TEORÍA DE LA COMPUTACIÓN (3.4.104)

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Segundo Examen Parcial noviembre 2023

* ALUMNO:  
* LU:
* CARRERA:

---

### NOTA: EL EXAMEN ESCRITO ES UN DOCUMENTO DE GRAN IMPORTANCIA PARA LA EVALUACIÓN DE LOS CONOCIMIENTOS ADQUIRIDOS, POR LO TANTO, SE SOLICITA LEER ATENTAMENTE LO SIGUIENTE

* Responda claramente cada punto, detallando con la mayor precisión posible lo solicitado.
* Sea prolijo y ordenado en el desarrollo de los temas.
* Sea cuidadoso con las faltas de ortografía y sus oraciones.
* No desarrollar el examen en lápiz.
* Aprobación del examen: Con nota mayor o igual a 4 (cuatro)
* Condiciones de aprobación: 60% correcto.
* Duración de examen: 2 horas.

---

1. [3.3 puntos] - Diséñese AP por vaciado de pila para L = {w1w2w3w2^R / w1,w3 ∈ {a, b}^2 ^ w2 ∈ {a, b}* }

```plain
S -> UT
U -> aa | ab | ba | bb
T -> aTa | bTb | V
V -> aa | ab | ba | bb

FNG
S -> aAT | aBT | bAT | bBT
T -> aTA | bTB | aA | aB | bA | bB
A -> a
B -> b
```

1. [3.3 puntos] - Determínese por comprensión simbólica el LIC generado por GIC:
S -> λ | aAZ | aBY | aZ | aY | aCYD | aYD | bZ | aCY | bDZ
A -> aAZ | aZ | aBZ
B -> aBY | aY
C -> aCY | aY
D -> bDZ | bZ
Y -> b
Z -> c

```plain
L = {a^n b^m c^k / n, m , k >= 0; k + m = n v k + n = m}
```

1. [3.3 puntos] - Diséñese MT unicinta L = {(ab^2)^n / n > 0}

| | a | b | B |
| -- | -- | -- | -- |
| >q0 | q1aR | - | - |
| q1  | - | q2bR | - |
| q2  | - | q3bR | - |
| q3  | q1aR | - | q4BL |
| *q4 | - | - | - |

---
