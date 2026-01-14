@echo off
REM ================================================================================
REM LOGIK SYSTEMS - GITHUB DEPLOYMENT (SUPER EINFACH)
REM ================================================================================
REM Dieses Skript pusht automatisch alle Dateien zu GitHub
REM Einfach doppelklicken und fertig!
REM ================================================================================

setlocal enabledelayedexpansion

cls
echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║                                                                ║
echo ║     🚀 LOGIK SYSTEMS - GITHUB DEPLOYMENT                      ║
echo ║                                                                ║
echo ║     Dieses Skript pusht deinen Code zu GitHub                 ║
echo ║                                                                ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.

REM Konfiguration
set GITHUB_USERNAME=logicgmbh92-max
set REPO_NAME=logik-systems-neu
set BRANCH=main
set COMMIT_MESSAGE=Initial Sovereign Core v1.0 - Compliance Ready

REM Schritt 1: Git überprüfen
echo [1/6] Git überprüfen...
git --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ FEHLER: Git ist nicht installiert!
    echo.
    echo Bitte installiere Git von: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)
echo ✓ Git gefunden
echo.

REM Schritt 2: Repository überprüfen
echo [2/6] Repository überprüfen...
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ FEHLER: Nicht in einem Git Repository!
    echo.
    echo Bitte stelle sicher, dass du im Verzeichnis "logik-systems-neu" bist.
    echo.
    echo Öffne PowerShell/CMD hier und versuche es erneut.
    echo.
    pause
    exit /b 1
)
echo ✓ Repository gefunden
echo.

REM Schritt 3: Git konfigurieren
echo [3/6] Git konfigurieren...
git config user.name "%GITHUB_USERNAME%"
git config user.email "noreply@logik-systems.com"
echo ✓ Git konfiguriert
echo.

REM Schritt 4: Dateien hinzufügen
echo [4/6] Dateien hinzufügen...
git add -A
echo ✓ Dateien hinzugefügt
echo.

REM Schritt 5: Commit erstellen
echo [5/6] Commit erstellen...
git commit -m "%COMMIT_MESSAGE%"
if errorlevel 1 (
    echo ⚠ Keine neuen Änderungen zum Committen
) else (
    echo ✓ Commit erstellt
)
echo.

REM Schritt 6: Zu GitHub pushen
echo [6/6] Zu GitHub pushen...
echo.
echo ⚠️  WICHTIG: Du wirst nach deinem GitHub Token gefragt!
echo.
echo Gib deinen neu generierten Token ein (nicht dein Passwort).
echo Der Token beginnt mit "github_pat_"
echo.
echo Wenn du den Token nicht hast, generiere einen neuen:
echo https://github.com/settings/tokens
echo.
pause

git push -u origin %BRANCH%

if errorlevel 1 (
    echo.
    echo ❌ FEHLER beim Push!
    echo.
    echo Mögliche Gründe:
    echo - Token ist falsch
    echo - Token ist abgelaufen
    echo - Keine Internetverbindung
    echo.
    pause
    exit /b 1
)

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║                                                                ║
echo ║     ✅ DEPLOYMENT ERFOLGREICH!                                ║
echo ║                                                                ║
echo ║     Dein Code ist jetzt auf GitHub!                           ║
echo ║                                                                ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.
echo Repository: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo Branch: %BRANCH%
echo Commit: %COMMIT_MESSAGE%
echo.
echo 📋 NÄCHSTE SCHRITTE:
echo.
echo 1. Gehe zu: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo 2. Überprüfe, dass alle Dateien dort sind
echo 3. Gehe zu: https://vercel.com
echo 4. Klicke "New Project"
echo 5. Wähle dein GitHub Repository
echo 6. Klicke "Deploy"
echo.
echo Deine Landing Page wird dann live sein! 🚀
echo.
pause
