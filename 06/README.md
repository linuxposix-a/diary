# Git 

## Gitconfig 

https://github.com/yves-chevallier/dotfiles

## Etats avant commit

- `staged` : fichier ajouté au prochain commit
- `modified` : fichier non ajouté au prochain commit 
- `untracked` : fichier non suivi par git
- `HEAD` 

## Glossaire 

- `HEAD` : pointe sur le dernier commit
- `master` : branche principale
- `staged` : fichier ajouté au prochain commit

## Meta commandes

La commande `pull` est une combinaison de `fetch` et `merge` ou de `rebase` si on a configuré git pour utiliser `rebase` par défaut.

```console
git pull --rebase # Stratégie de rebase
git pull # Stratégie de merge
```

La commande `clone` effectue les actions suivantes:

1. Créer un dossier
2. Git init
3. Git remote add origin <url>
4. Git fetch
5. Git checkout -t origin/master

## Commandes Git

- `git init` : initialise un dépôt git
- `git add` : ajoute un fichier au dépôt, ou on stage les fichiers.
- `git commit` : enregistre les modifications
- `git log` : affiche l'historique des commits
- `git log --oneline` : affiche l'historique des commits en une ligne
- `git log --oneline --graph` : affiche l'historique des commits en une ligne avec un graphique
- `git branch toto`: crée une branche nommée `toto` là ou est ma tête
