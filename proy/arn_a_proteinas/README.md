# TP

* Año: 2024
* Alumno: Adrian Yaniri

## Mapa conceptual

```mermaid
mindmap
  root((Teoría de la Computación))
    Computabilidad
      "Estudia: Problemas resolubles"
    Complejidad
      "Estudia: Recursos necesarios"
    Habilidades
      Resolución de Problemas
      Pensamiento Algorítmico
      Programación
      Análisis de Algoritmos
    Limitaciones
      Recursos Finitos
      Problemas Intratables
    Recursos
      Tiempo
      Espacio
      Energía
    Algoritmos
      "¿Representables en lenguajes?"
        "Sí, teóricamente en lenguajes adecuados"
    Funciones Computables
      "¿Cuándo?"
        "Cuando puede ser resuelta por una máquina de Turing"
```

[mapa conceptual](https://www.mermaidchart.com/app/projects/5b8d1a5a-a6cd-43df-a550-027b6bbebc38/diagrams/0fbda422-f56b-4a0f-a84e-51efb1f07152/version/v0.1/edit)

[editor onile mermaid](https://www.mermaidchart.com/)

## Maquina de Turing

### Tabla estandar de proteinas

#### Definicion

* La traducción del ARN a proteínas es el proceso mediante el cual la información genética codificada en la secuencia de ARN mensajero (ARNm) se utiliza para sintetizar proteínas específicas.
* Este proceso ocurre en los ribosomas, que actúan como las fábricas celulares de proteínas. Durante la traducción, los ribosomas leen secuencialmente los codones del ARNm y utilizan el código genético para ensamblar una cadena polipeptídica de aminoácidos, siguiendo las reglas de correspondencia entre los codones y los aminoácidos especificados por el ARN de transferencia (ARNt).

| Codón de ARN                 | Aminoácido          |
|------------------------------|---------------------|
| AUG                          | M (Metionina)       |
| UUU, UUC                     | F (Fenilalanina)    |
| UUA, UUG, CUU                | L (Leucina)         |
| UCU, UCC, UCA,               | S (Serina)          |
| UAU, UAC                     | Y (Tirosina)        |
| UGU, UGC                     | C (Cisteína)        |
| UGG                          | W (Triptófano)      |
| CCU, CCC, CCA, CCG           | P (Prolina)         |
| CAU, CAC                     | H (Histidina)       |
| CAA, CAG                     | Q (Glutamina)       |
| CGU, CGC, CGA, CGG, AGA, AGG | R (Arginina)        |
| AUU, AUC, AUA                | I (Isoleucina)      |
| ACU, ACC, ACA, ACG           | T (Treonina)        |
| AAU, AAC                     | N (Asparagina)      |
| AAA, AAG                     | K (Lisina)          |
| GAU, GAC                     | D (Ácido aspártico) |
| GAA, GAG                     | E (Ácido glutámico) |
| UAA, UAG, UGA                | # (Parada)          |

#### Nucleótidos

* A = Adenina
* C = Citosina
* G: Guanina
* U: Uracilo

* Codon de Inicio: **AUG**
* Codones de terminación: **UUU**, **UAG**, **UGA**

#### Cadena ARN

* ***AUGGCUAAGUUUUAA*** (cadena) -> ***MAK*** (traducion de proteina)

### MT1

![JFLAP MT1](./resources/MT1.png)

### MT2

![JFLAP MT2](./resources/MT12.jpg)

### Simulator

[Programa](./resources/simulator.mt)