# LANDING PAGE DEPLOYMENT GUIDE

**Logik Systems - Professionelle Landing Page**

---

## 📋 Dateien

Die folgenden HTML-Dateien wurden erstellt:

1. **index.html** - Hauptseite (Hero, Features, Pricing, How It Works, Compliance, CTA)
2. **terms.html** - Nutzungsbedingungen
3. **privacy.html** - Datenschutzerklärung

---

## 🚀 Deployment auf Vercel

### Option 1: Automatisches Deployment (Empfohlen)

#### Schritt 1: GitHub Repository vorbereiten

```bash
# Im Projektverzeichnis
git init
git add index.html terms.html privacy.html
git commit -m "Add landing page"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/logik-systems-landing.git
git push -u origin main
```

#### Schritt 2: Mit Vercel verbinden

1. Gehen Sie zu https://vercel.com
2. Klicken Sie auf "New Project"
3. Wählen Sie Ihr GitHub Repository
4. Klicken Sie auf "Import"
5. Vercel erkennt automatisch, dass es statische HTML-Dateien sind
6. Klicken Sie auf "Deploy"

#### Schritt 3: Domain konfigurieren

1. Nach dem Deployment gehen Sie zu "Settings"
2. Klicken Sie auf "Domains"
3. Fügen Sie Ihre Domain hinzu: `logik-systems.com`
4. Folgen Sie den DNS-Anweisungen

---

### Option 2: Manuelles Deployment

#### Schritt 1: Vercel CLI installieren

```bash
npm install -g vercel
```

#### Schritt 2: Anmelden

```bash
vercel login
```

#### Schritt 3: Deployen

```bash
vercel --prod
```

#### Schritt 4: Domain konfigurieren

```bash
vercel domains add logik-systems.com
```

---

## 🔗 DNS-Konfiguration (United Domains)

Nach dem Deployment auf Vercel müssen Sie die DNS-Records aktualisieren:

### A-Record
```
Name: @
Type: A
Value: 76.76.21.21
TTL: 3600
```

### CNAME-Record
```
Name: www
Type: CNAME
Value: cname.vercel-dns.com
TTL: 3600
```

### TXT-Records (Optional, für Email)

**SPF:**
```
Name: @
Type: TXT
Value: v=spf1 include:sendgrid.net include:_spf.google.com ~all
TTL: 3600
```

**DMARC:**
```
Name: _dmarc
Type: TXT
Value: v=DMARC1; p=quarantine; adkim=s; aspf=s;
TTL: 3600
```

---

## ✅ Verifikation

Nach dem Deployment überprüfen Sie:

```bash
# Test der Hauptseite
curl https://www.logik-systems.com/

# Test der Nutzungsbedingungen
curl https://www.logik-systems.com/terms.html

# Test der Datenschutzerklärung
curl https://www.logik-systems.com/privacy.html

# SSL-Zertifikat überprüfen
openssl s_client -connect www.logik-systems.com:443
```

---

## 📱 Responsive Design

Die Landing Page ist vollständig responsive und funktioniert auf:
- ✅ Desktop (1920px+)
- ✅ Tablet (768px - 1024px)
- ✅ Mobile (320px - 767px)

---

## 🎨 Anpassungen

### Farben ändern

Bearbeiten Sie die CSS-Variablen in `index.html`:

```css
/* Hauptfarbe (aktuell: Schwarz) */
background-color: #000000;

/* Akzentfarbe (aktuell: Weiß) */
color: #ffffff;
```

### Text ändern

Alle Texte sind direkt in den HTML-Dateien enthalten. Suchen Sie nach dem Text und ersetzen Sie ihn.

### Bilder hinzufügen

Fügen Sie `<img>`-Tags hinzu:

```html
<img src="https://example.com/image.jpg" alt="Description">
```

---

## 📊 Analytics (Optional)

### Google Analytics hinzufügen

Fügen Sie diesen Code vor `</head>` in `index.html` ein:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

Ersetzen Sie `GA_MEASUREMENT_ID` mit Ihrer Google Analytics ID.

---

## 🔐 Sicherheit

### HTTPS
- ✅ Automatisch durch Vercel
- ✅ SSL-Zertifikat kostenlos

### Security Headers
Vercel fügt automatisch hinzu:
- ✅ X-Content-Type-Options
- ✅ X-Frame-Options
- ✅ X-XSS-Protection

---

## 📧 Email-Links

Die Landing Page enthält Email-Links:

- **Support:** support@logik-systems.com
- **Sales:** sales@logik-systems.com
- **Compliance:** compliance@logik-systems.com
- **Privacy:** privacy@logik-systems.com

Stellen Sie sicher, dass diese Email-Adressen konfiguriert sind.

---

## 🔄 Aktualisierungen

### Lokale Änderungen

```bash
# Änderungen vornehmen
# Dann:
git add .
git commit -m "Update landing page"
git push origin main

# Vercel deployed automatisch
```

### Ohne Git

```bash
# Mit Vercel CLI
vercel --prod
```

---

## 📞 Support

### Häufige Probleme

**Problem: 404 Fehler**
- Überprüfen Sie, dass die HTML-Dateien im Root-Verzeichnis sind
- Vercel sollte `index.html` automatisch als Startseite erkennen

**Problem: Domain funktioniert nicht**
- Warten Sie 24-48 Stunden für DNS-Propagation
- Überprüfen Sie die DNS-Records in United Domains
- Verwenden Sie `nslookup logik-systems.com` zum Testen

**Problem: SSL-Zertifikat nicht gültig**
- Vercel generiert automatisch Zertifikate
- Warten Sie 5-10 Minuten nach dem Deployment

---

## 🎯 Nächste Schritte

1. ✅ Landing Page deployen
2. ✅ Domain konfigurieren
3. ✅ DNS-Records aktualisieren
4. ✅ SSL-Zertifikat überprüfen
5. ⏭️ Backend-API deployen (main.py)
6. ⏭️ Stripe-Integration testen
7. ⏭️ Email-Konfiguration einrichten
8. ⏭️ Analytics einrichten

---

## 📝 Checkliste

- [ ] HTML-Dateien erstellt
- [ ] GitHub Repository erstellt
- [ ] Mit Vercel verbunden
- [ ] Deployment erfolgreich
- [ ] Domain hinzugefügt
- [ ] DNS-Records aktualisiert
- [ ] HTTPS funktioniert
- [ ] Alle Links funktionieren
- [ ] Mobile-Ansicht getestet
- [ ] Email-Links funktionieren

---

**Deployment-Datum:** _______________
**Deployed von:** _______________
**Status:** ✅ Live

---

**Weitere Hilfe:** support@logik-systems.com
