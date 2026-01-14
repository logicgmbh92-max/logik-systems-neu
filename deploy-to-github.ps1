# ================================================================================
# LOGIK SYSTEMS - GITHUB DEPLOYMENT SCRIPT (Windows PowerShell)
# ================================================================================
# Dieses Skript pusht alle Dateien zu deinem GitHub Repository
# Verwendung: powershell -ExecutionPolicy Bypass -File deploy-to-github.ps1
# ================================================================================

# Konfiguration
$GITHUB_USERNAME = "logicgmbh92-max"
$REPO_NAME = "logik-systems-neu"
$BRANCH = "main"
$COMMIT_MESSAGE = "Initial Sovereign Core v1.0 - Compliance Ready"

# Farben
$Green = "Green"
$Blue = "Cyan"
$Yellow = "Yellow"
$Red = "Red"

Write-Host "🚀 Logik Systems - GitHub Deployment" -ForegroundColor $Blue
Write-Host "====================================" -ForegroundColor $Blue
Write-Host ""

# Schritt 1: Git konfigurieren
Write-Host "[1/6] Git konfigurieren..." -ForegroundColor $Blue
git config user.name $GITHUB_USERNAME
git config user.email "noreply@logik-systems.com"
Write-Host "✓ Git konfiguriert" -ForegroundColor $Green
Write-Host ""

# Schritt 2: Repository Status überprüfen
Write-Host "[2/6] Repository Status überprüfen..." -ForegroundColor $Blue
$gitDir = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Fehler: Nicht in einem Git Repository!" -ForegroundColor $Red
    Write-Host "Bitte führe dieses Skript im Projektverzeichnis aus:" -ForegroundColor $Red
    Write-Host "  cd logik-systems-neu" -ForegroundColor $Red
    Write-Host "  powershell -ExecutionPolicy Bypass -File deploy-to-github.ps1" -ForegroundColor $Red
    exit 1
}
Write-Host "✓ Git Repository gefunden" -ForegroundColor $Green
Write-Host ""

# Schritt 3: Dateien hinzufügen
Write-Host "[3/6] Dateien zum Staging hinzufügen..." -ForegroundColor $Blue
git add -A
Write-Host "✓ Dateien hinzugefügt" -ForegroundColor $Green
Write-Host ""

# Schritt 4: Status anzeigen
Write-Host "[4/6] Geänderte Dateien:" -ForegroundColor $Blue
git status --short
Write-Host ""

# Schritt 5: Commit erstellen
Write-Host "[5/6] Commit erstellen..." -ForegroundColor $Blue
git commit -m $COMMIT_MESSAGE
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Commit erstellt" -ForegroundColor $Green
} else {
    Write-Host "⚠ Keine Änderungen zum Committen" -ForegroundColor $Yellow
}
Write-Host ""

# Schritt 6: Push zu GitHub
Write-Host "[6/6] Zu GitHub pushen..." -ForegroundColor $Blue
Write-Host "Hinweis: Du wirst möglicherweise nach deinem GitHub Token gefragt." -ForegroundColor $Yellow
Write-Host "Gib deinen neu generierten Token ein (nicht das Passwort)." -ForegroundColor $Yellow
Write-Host ""

git push origin $BRANCH

Write-Host ""
Write-Host "✅ DEPLOYMENT ERFOLGREICH!" -ForegroundColor $Green
Write-Host ""
Write-Host "Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
Write-Host "Branch: $BRANCH"
Write-Host "Commit: $COMMIT_MESSAGE"
Write-Host ""
Write-Host "Nächste Schritte:" -ForegroundColor $Blue
Write-Host "1. Gehe zu https://github.com/$GITHUB_USERNAME/$REPO_NAME"
Write-Host "2. Verbinde das Repository mit Vercel"
Write-Host "3. Deploye die Landing Page"
Write-Host ""
