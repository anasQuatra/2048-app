# plateformes CI/CD
on va se concentrer sur gitLab & GitHub Actions (voir les autres dans les slides)

# pipeline en plateformes vs. script ( comme Lab02)
- versionner le code 
- triggers/ hooks qui se basent sur des changements éventuels
- gérer l'environnement pour tous, pas juste sa machine 
- beaucooup plus de fonctionalités déja codées

# Agent d'éxec
execute le pipeline + possibilité de parallélisation + choix d'agent par pipeline

# Structure
pipeline ( n stages ) -> stage (m jobs) [diff agents] -> job (k tasks) 
