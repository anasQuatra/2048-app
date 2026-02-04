#!/bin/bash

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  2048 App Pipeline${NC}"
echo -e "${BLUE}================================${NC}\n"

# Step 1: Install dependencies
echo -e "${YELLOW}[Step 1/3]${NC} Installing dependencies..."
pnpm install
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✓ Dependencies installed successfully${NC}\n"
else
  echo -e "${RED}✗ Installation failed${NC}"
  exit 1
fi

# Step 2: Type checking
echo -e "${YELLOW}[Step 2/3]${NC} Running type check..."
pnpm nuxt typecheck
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✓ Type checking passed${NC}\n"
else
  echo -e "${RED}✗ Type checking failed${NC}"
  exit 1
fi

# Step 3: Linting
echo -e "${YELLOW}[Step 3/3]${NC} Running ESLint..."
pnpm eslint app/ --ext .js,.ts,.vue
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✓ Linting passed${NC}\n"
else
  echo -e "${RED}✗ Linting failed${NC}"
  exit 1
fi

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}  Pipeline Completed Successfully! ${NC}"
echo -e "${GREEN}================================${NC}"
# erreur de test dans app/Header :
    # const unused = 1;
