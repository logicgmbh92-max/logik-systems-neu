#!/bin/bash

# ================================================================================
# LOGIK SYSTEMS - GITHUB DEPLOYMENT SCRIPT
# ================================================================================
# Dieses Skript pusht alle Dateien zu deinem GitHub Repository
# Verwendung: bash deploy-to-github.sh
# ================================================================================

set -e  # Exit on error

echo "🚀 Logik Systems - GitHub Deployment"
echo "===================================="
echo ""

# Konfiguration
GITHUB_USERNAME="logicgmbh92-max"
REPO_NAME="logik-systems-neu"
BRANCH="main"
COMMIT_MESSAGE="Initial Sovereign Core v1.0 - Compliance Ready"

# Farben für Output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Schritt 1: Git konfigurieren
echo -e "${BLUE}[1/6]${NC} Git konfigurieren..."
git config user.name "$GITHUB_USERNAME" || true
git config user.email "noreply@logik-systems.com" || true
echo -e "${GREEN}✓ Git konfiguriert${NC}"
echo ""

# Schritt 2: Repository Status überprüfen
echo -e "${BLUE}[2/6]${NC} Repository Status überprüfen..."
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Fehler: Nicht in einem Git Repository!${NC}"
    echo "Bitte führe dieses Skript im Projektverzeichnis aus:"
    echo "  cd logik-systems-neu"
    echo "  bash deploy-to-github.sh"
    exit 1
fi
echo -e "${GREEN}✓ Git Repository gefunden${NC}"
echo ""

# Schritt 3: Dateien hinzufügen
echo -e "${BLUE}[3/6]${NC} Dateien zum Staging hinzufügen..."
git add -A
echo -e "${GREEN}✓ Dateien hinzugefügt${NC}"
echo ""

# Schritt 4: Status anzeigen
echo -e "${BLUE}[4/6]${NC} Geänderte Dateien:"
git status --short
echo ""

# Schritt 5: Commit erstellen
echo -e "${BLUE}[5/6]${NC} Commit erstellen..."
git commit -m "$COMMIT_MESSAGE" || {
    echo -e "${YELLOW}⚠ Keine Änderungen zum Committen${NC}"
}
echo -e "${GREEN}✓ Commit erstellt${NC}"
echo ""

# Schritt 6: Push zu GitHub
echo -e "${BLUE}[6/6]${NC} Zu GitHub pushen..."
echo -e "${YELLOW}Hinweis: Du wirst möglicherweise nach deinem GitHub Token gefragt.${NC}"
echo -e "${YELLOW}Gib deinen neu generierten Token ein (nicht das Passwort).${NC}"
echo ""

git push origin $BRANCH

echo ""
echo -e "${GREEN}✅ DEPLOYMENT ERFOLGREICH!${NC}"
echo ""
echo "Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "Branch: $BRANCH"
echo "Commit: $COMMIT_MESSAGE"
echo ""
echo "Nächste Schritte:"
echo "1. Gehe zu https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "2. Verbinde das Repository mit Vercel"
echo "3. Deploye die Landing Page"
echo ""
