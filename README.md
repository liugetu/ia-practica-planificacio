# Pràctica de Planificació - Reserves d'Hotel

Aquesta pràctica consisteix en modelar un sistema de reserves d'hotel utilitzant PDDL (Planning Domain Definition Language) i resolent-lo amb el planificador Metric-FF.

## Descripció del Problema

Una central de reserves necessita assignar peticions de reserva a habitacions d'un hotel. Cada habitació té una capacitat (1-4 persones) i cada reserva especifica el nombre de persones i els dies d'ocupació (dins d'un mes de 30 dies).

### Nivells Implementats

- **Bàsic**: Assignar totes les reserves a habitacions amb capacitat suficient sense solapaments
- **Extensió 1**: Maximitzar el nombre de reserves assignades (es poden rebutjar reserves)
- **Extensió 3**: Minimitzar el malbaratament de capacitat (assignar a habitacions ajustades)
- **Extensió 4**: Minimitzar el nombre d'habitacions utilitzades durant el mes

## Estructura del Projecte

```
domain-basic.pddl       # Domini nivell bàsic
domain-ext1.pddl        # Domini extensió 1
domain-ext3.pddl        # Domini extensió 3
domain-ext4.pddl        # Domini extensió 4
jocs-prova/             # Jocs de prova per cada nivell
generate_problems.py    # Generador automàtic de problemes
Metric-FF/              # Planificador Fast Forward (versió mètrica)
```

## Ús

### Generar Problemes Automàticament

```bash
python3 generate_problems.py <num_reserves> --level <nivell> [--seed X]
```

Nivells disponibles: `basic`, `ext1`, `ext3`, `ext4`

Exemple:
```bash
python3 generate_problems.py 10 --level ext1
```

### Executar un Problema

```bash
./Metric-FF/ff -O -o <fitxer_domini> -f <fitxer_problema>
```

Exemple:
```bash
./Metric-FF/ff -O -o domain-basic.pddl -f ./jocs-prova/problem-basic-test.pddl
```

Els jocs de prova es troben a la carpeta `jocs-prova/`.

Nota: per les extensions amb optimització (ext1, ext3, ext4), es poden utilitzar els paràmetres `-g 100 -h 1` per assegurar que es troba el pla òptim:

```bash
./Metric-FF/ff -O -g 100 -h 1 -o domain-ext1.pddl -f jocs-prova/problem-ext1-test.pddl
```