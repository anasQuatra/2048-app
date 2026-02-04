#!/bin/bash

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check for -v flag
VERBOSE=false
if [[ "$1" == "-v" ]]; then
  VERBOSE=true
fi

log() {
  if [ "$VERBOSE" = true ]; then
    echo -e "$1"
  fi
}

log "${BLUE}================================${NC}"
log "${BLUE}  2048 App Pipeline${NC}"
log "${BLUE}================================${NC}\n"

# Step 1: Install dependencies
log "${YELLOW}[Step 1/3]${NC} Installing dependencies..."
pnpm install
if [ $? -eq 0 ]; then
  log "${GREEN}✓ Dependencies installed successfully${NC}\n"
else
  log "${RED}✗ Installation failed${NC}"
  exit 1
fi

# Step 2: Type checking
log "${YELLOW}[Step 2/3]${NC} Running type check..."
pnpm nuxt typecheck
if [ $? -eq 0 ]; then
  log "${GREEN}✓ Type checking passed${NC}\n"
else
  log "${RED}✗ Type checking failed${NC}"
  exit 1
fi

# Step 3: Linting
log "${YELLOW}[Step 3/3]${NC} Running ESLint..."
pnpm eslint app/ --ext .js,.ts,.vue
if [ $? -eq 0 ]; then
  log "${GREEN}✓ Linting passed${NC}\n"
else
  log "${RED}✗ Linting failed${NC}"
  exit 1
fi

log "${GREEN}================================${NC}"
log "${GREEN}  Pipeline Completed Successfully! ${NC}"
log "${GREEN}================================${NC}"
# erreur de test dans app/Header :
    # const unused = 1;
