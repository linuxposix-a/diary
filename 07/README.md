# Semaine 07/16

## POSIX 

### Arborescence et filesystem 

- `/` Racine du système de fichier
- `/bin` Application systèmes
- `/home` Répertoire utilisateurs
- `/etc` Fichiers de configuration
- `/var` Fichiers de processus comme les logs et les bases de données
- `/mnt` Point de montage pour les périphériques de stockage  

### Shell

Interface utilisateur avec le noyau du système d'exploitation.

- `sh` Bourne shell
- `bash` Bourne again shell
- `zsh` Z shell
- `fish` Friendly interactive shell

Vous pouvez exécuter des commandes, et visualiser les résultats dans le terminal.

### Commandes

- `ls` Liste les fichiers et dossiers
- `cp` Copie un fichier
- `mv` Déplace un fichier
- `rm` Supprime un fichier
- `dd` Copie un fichier en utilisant des blocs (TRES DANGEREUX)

Voici comment on génère un fichier de 100 MB contenant que des 0 avec dd: 

```bash
dd if=/dev/zero of=100MB.txt bs=1M count=100
```

## Appels systems

Les appels systèmes sont des fonctions qui permettent d'interagir avec le noyau du système d'exploitation.

### Exemple

```c
#include <stdio.h>
#include <unistd.h>

int main() {
    open("test.txt", O_CREAT | O_WRONLY, 0644);
    write(1, "Hello World\n", 12);
    read(0, buffer, 12);
}
```

Pour visualiser les appels systèmes, on utilise `strace`:

```bash
strace ./test
```

### Gestion des droits d'accès aux fichiers

Sous POSIX il n'y a que trois types de droits d'accès aux fichiers:

- `r` Lecture
- `w` Ecriture
- `x` Exécution

Que ces droits sont propres à trois catégories : 

- `u` Utilisateur
- `g` Groupe
- `o` Autres

Que chaque trio de droits est représenté par un nombre en base 8:

- `rwx` 7
- `rw-` 6
- `r-x` 5
- `r--` 4
- `---` 0

Les droits d'une clé ssh publique seront par exemple `644` (rw-r--r--).
Par contre, les droits d'une clé ssh privée seront `400` (r--------).

Vous pouvez visualiser ces droits avec la commande `ls -l`:

```bash
$ ls -l
total 8
-rw-r--r-- 1 user user  0 Jul  1 10:00 100MB.txt
-rw-r--r-- 1 user user  0 Jul  1 10:00 10MB.txt
-rw-r--r-- 1 user user  0 Jul  1 10:00 1MB.txt
```

Il existe une couche logicielle qui permet de gérer les droits d'accès aux fichiers, c'est `ACL` (Access Control List). Et on utilise `setfacl` pour la gérer.

```bash
$ setfacl -m u:username:rwx file
```

### Processus 

Un processus est un programme en cours d'exécution. Il est composé d'un ensemble de ressources. 

Pour visualiser les processus en cours d'exécution, on utilise `ps`. Les commandes `top` et `htop` sont des interfaces graphiques pour `ps`.

## GPG 

GPG est un logiciel de chiffrement de données. Il permet de chiffrer des fichiers, des messages, des emails, des disques, etc.

### Exercice 

- Se documenter sur GPG (c'est quoi, c'est quoi l'histoire, pourquoi ? comment ?)
- Installer GPG ou GPG2 (la différence) sur votre WSL2
- Générer une clé GPG
  - Chiffrement 2048 bits
  - Expiration de 1 an 
  - Publier la clé sur un serveur de clés
- Un collègue utilise votre clé publiée sur le serveur de clés pour déchiffrer le fichier
- Un collègue chiffre un fichier avec GPG et vous l'envoie
- Vous déchiffrez le fichier avec GPG
- Voir comment signer un commit Git avec GPG (vous pouvez utiliser le répo de la semaine 06)
- Mettre sur votre GitHub votre clé publique GPG

