#!/bin/bash

pnpm install

# Exécuter l'analyse statique en ligne de commande via la commande vue-tsc --noEmit et vérifier que le projet ne comporte pas d'erreur
pnpm nuxt typecheck
# erreur de test dans app/Header :
    # <GameScoreDisplay label1="Best" :value="bestScore" />
    # au lieu de :
    # <GameScoreDisplay label="Best" :value="bestScore" />
