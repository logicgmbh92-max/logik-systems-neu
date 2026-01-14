#!/bin/bash

# ================================================================================
# LOGIK SYSTEMS - GITHUB DEPLOYMENT (SUPER EINFACH)
# ================================================================================
# Dieses Skript pusht automatisch alle Dateien zu GitHub
# Einfach ausführen: bash deploy.sh
# ================================================================================

clear

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║     🚀 LOGIK SYSTEMS - GITHUB DEPLOYMENT                      ║"
echo "║                                                                ║"
echo "║     Dieses Skript pusht deinen Code zu GitHub                 ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Konfiguration
GITHUB_USERNAME="logicgmbh92-max"
REPO_NAME="logik-systems-neu"
BRANCH="main"
COMMIT_MESSAGE="Initial Sovereign Core v1.0 - Compliance Ready"

# Farben
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Schritt 1: Git überprüfen
echo -e "${BLUE}[1/6]${NC} Git überprüfen..."
if ! command -v git &> /dev/null; then
    echo ""
    echo -e "${RED}❌ FEHLER: Git ist nicht installiert!${NC}"
    echo ""
    echo "Bitte installiere Git:"
    echo "  macOS: brew install git"
    echo "  Linux: sudo apt-get install git"
    echo ""
    exit 1
fi
echo -e "${GREEN}✓ Git gefunden${NC}"
echo ""

# Schritt 2: Repository überprüfen
echo -e "${BLUE}[2/6]${NC} Repository überprüfen..."
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo ""
    echo -e "${RED}❌ FEHLER: Nicht in einem Git Repository!${NC}"
    echo ""
    echo "Bitte stelle sicher, dass du im Verzeichnis 'logik-systems-neu' bist:"
    echo "  cd logik-systems-neu"
    echo "  bash deploy.sh"
    echo ""
    exit 1
fi
echo -e "${GREEN}✓ Repository gefunden${NC}"
echo ""

# Schritt 3: Git konfigurieren
echo -e "${BLUE}[3/6]${NC} Git konfigurieren..."
git config user.name "$GITHUB_USERNAME"
git config user.email "noreply@logik-systems.com"
echo -e "${GREEN}✓ Git konfiguriert${NC}"
echo ""

# Schritt 4: Dateien hinzufügen
echo -e "${BLUE}[4/6]${NC} Dateien hinzufügen..."
git add -A
echo -e "${GREEN}✓ Dateien hinzugefügt${NC}"
echo ""

# Schritt 5: Commit erstellen
echo -e "${BLUE}[5/6]${NC} Commit erstellen..."
if git commit -m "$COMMIT_MESSAGE" 2>/dev/null; then
    echo -e "${GREEN}✓ Commit erstellt${NC}"
else
    echo -e "${YELLOW}⚠ Keine neuen Änderungen zum Committen${NC}"
fi
echo ""

# Schritt 6: Zu GitHub pushen
echo -e "${BLUE}[6/6]${NC} Zu GitHub pushen..."
echo ""
echo -e "${YELLOW}⚠️  WICHTIG: Du wirst nach deinem GitHub Token gefragt!${NC}"
echo ""
echo "Gib deinen neu generierten Token ein (nicht dein Passwort)."
echo "Der Token beginnt mit 'github_pat_'"
echo ""
echo "Wenn du den Token nicht hast, generiere einen neuen:"
echo "https://github.com/settings/tokens"
echo ""
read -p "Drücke Enter zum Fortfahren..."
echo ""

git push -u origin $BRANCH

if [ $? -ne 0 ]; then
    echo ""
    echo -e "${RED}❌ FEHLER beim Push!${NC}"
    echo ""
    echo "Mögliche Gründe:"
    echo "- Token ist falsch"
    echo "- Token ist abgelaufen"
    echo "- Keine Internetverbindung"
    echo ""
    exit 1
fi

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║     ✅ DEPLOYMENT ERFOLGREICH!                                ║"
echo "║                                                                ║"
echo "║     Dein Code ist jetzt auf GitHub!                           ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "Branch: $BRANCH"
echo "Commit: $COMMIT_MESSAGE"
echo ""
echo -e "${BLUE}📋 NÄCHSTE SCHRITTE:${NC}"
echo ""
echo "1. Gehe zu: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "2. Überprüfe, dass alle Dateien dort sind"
echo "3. Gehe zu: https://vercel.com"
echo "4. Klicke 'New Project'"
echo "5. Wähle dein GitHub Repository"
echo "6. Klicke 'Deploy'"
echo ""
echo "Deine Landing Page wird dann live sein! 🚀"
echo ""
