# Semaine 10/16

- [x] Perl : Standardisé POSIX, dispo sur toute plateforme
- [x] sed : Stream EDitor, dispo sur toute plateforme
- [x] awk : dispo sur toute plateforme

## Awk 

Inverser le deuxième et le premier mot de chaque ligne avec awk

```bash
awk '{print $2 " " $1}' file.txt
```

Remplacer toutes les voyelles par des x avec awk 

```bash
awk '{gsub(/[aeiou]/,"x"); print}' file.txt
```

## Sed 

BRE ERE 

```bash
sed 's/old/new/' file.txt
```

## Perl 

Oneliner == one line of code

```perl
perl -e 'print "Hello world\n"'
```

Remplacer toutes les voyelles d'une fichier par leurs majuscules: 

```perl
perl -pi -e 's/[aeiou]/\U$&/g' file.txt
```

Dans un fichier C, le malheureux développeur à mis des séparateurs de commentaires du type `/************** titre *************/` et il veut les remplacer par des `/* titre */`. 

```perl
perl -pi -e 's@/\*+\s*(.*?)\s*\*+/@/* $1 */@g' file.c
```

Dans un fichier C j'aimerais remplacer les multiples lignes vides par une seule.

```perl
perl -0pi -e 's/\n+/\n/g' file.c
```

On veut supprimer les lignes vides dans ce fichier: 

```json 
{
    "name": "John",

    "age": 30,

    "cars": [

    
        {
            "name": "Ford",
            "models": [
                "Fiesta",
                "Focus",
                "Mustang"
            ]
        },
        {
            "name": "BMW",
            "models": [
                "320",
                "X3",
                "X5"
            ]

        },

        {


            "name": "Fiat",
            "models": [
                "500",


                "Panda"
            ]
        }
    ]
}
```

```perl
perl -0pi -e 's/\n+/\n/g' file.json
```

Dans ce même fichier JSON j'aimerais mettre les tableaux sur une seule ligne

```json	
"models": [
    "320",
    "X3",
    "X5"
]
```
devient

```json
"models": [ "320", "X3", "X5" ]
```
