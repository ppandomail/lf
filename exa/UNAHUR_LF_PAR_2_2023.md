# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Inst. de Tecnología e Ingeniería

## LENGUAJES FORMALES Y AUTÓMATAS

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Segundo Examen Parcial noviembre 2023

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
* Condiciones de aprobación: 60%
* Duración de examen: 3 horas.

---

1. [2 puntos] Diséñese una GIC para L = {[], [id], [id,id], [id,id,id], ...}

    ```grammar
    S -> [A] | []
    A -> id,A | id
    ```

1. [2 puntos] Diséñese una GIC FNC para L = {[^n]^m / m > n >= 0}

    ```grammar
    m > n =>  m = n + a

    L = {[^n ]^n ]^a / n >= 0 ^ a > 0}

    S -> AB | B
    A -> [A] | []
    B -> ]B | ]

    FNC: 
    S  -> AB | CB | ]
    A  -> OA' | OC
    A' -> AC
    B  -> CB | ]
    O  -> [
    C  -> ] 
    ```

1. [2 puntos] Diséñese AP (por vaciado) que reconozca [][], mostrando movimientos. GIC: S -> SS | [S] | []

    ```grammar
    FNG:
    S -> [SFS | [FS | [SF | [F
    F -> ]

    AP:
    δ(q0, [, S) = (q0, SFS)
    δ(q0, [, S) = (q0, FS)
    δ(q0, [, S) = (q0, SF)
    δ(q0, [, S) = (q0, F)
    δ(q0, ], F) = (q0, λ)
    ```

1. [2 puntos] Diséñese una MT unicinta que reconozca L del punto 1)

1. [2 puntos] Defínase por comprensión simbólica el L generado por S -> [S[ | ]S] | [[ | ]]

    ```plain
    L = {ww^(-1) / w ∈  {[, ]}* }
    ```

---
