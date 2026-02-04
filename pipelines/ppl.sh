#!/bin/bash

pnpm install

# Exécuter l'analyse statique en ligne de commande via la commande vue-tsc --noEmit et vérifier que le projet ne comporte pas d'erreur
pnpm nuxt typecheck
# erreur de test dans app/Header :
    # <GameScoreDisplay label1="Best" :value="bestScore" />
    # au lieu de :
    # <GameScoreDisplay label="Best" :value="bestScore" />

# Exécuter eslint pour qu'il analyse statiquement les fichiers Vue et TypeScript: s'assurer qu'il n'y a pas d'erreur
 pnpm eslint app/ --ext .js,.ts,.vue

# Ajouter ou modifier du code pour qu'ESLint remonte une erreur. Constater que l'IDE remonte bien l'erreur

# Vérifier que l'erreur est bien remontée également en exécutant ESLint

# Enlever la modification et ajouter l'étape d'analyse statique de code au script