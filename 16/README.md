# Semaine 16/16

## Git Submodules

```bash
# Créer répo main sur GitHub
# Créer répo dep sur GitHub
git clone github::main
git clone github::dep
cd dep
touch main.c
git add main.c
git commit -am "Added main.c"
git push
cd ../main
git submodule add github::dep
git commit -am "Added dep submodule"
git push
#.... Pendant ce temps à Very Cruiz
git clone github::main
cd main
git submodule init
git submodule update
#... Profit!!

```