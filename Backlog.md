## Produkt-Backlog für "REAP" (Reserve And Preorder)

### 1. Reservierung von Plätzen
- **Beschreibung**: Nutzer können einen oder mehrere Plätze für einen bestimmten Zeitpunkt und Zeitspanne reservieren.
- **Akzeptanzkriterien**:
  - Nutzer können Datum, Uhrzeit und Dauer auswählen.
  - Das System prüft die Verfügbarkeit und bestätigt/lehnt die Anfrage ab.
  - Bei erfolgreicher Reservierung erhält der Nutzer eine Bestätigung.
- **Priorität**: Hoch

### 2. Kundendaten-Erfassung
- **Beschreibung**: Beim Reservieren müssen Nutzer ihre Kontaktdaten angeben.
- **Akzeptanzkriterien**:
  - Felder für Name, Telefonnummer und E-Mail-Adresse.
  - Validierung der Eingaben.
- **Priorität**: Hoch

### 3. Auswahl der Zahlungsmethode
- **Beschreibung**: Nutzer können eine Zahlungsmethode (Kreditkarte, PayPal, Bargeld) auswählen.
- **Akzeptanzkriterien**:
  - Auswahlmöglichkeiten werden angezeigt.
  - Bei Auswahl von Online-Zahlungsmethoden muss eine sichere Zahlungsschnittstelle integriert sein.
- **Priorität**: Hoch

### 4. Vorbestellung von Speisen/Getränken
- **Beschreibung**: Nutzer können Speisen und Getränke vor ihrer Ankunft bestellen.
- **Akzeptanzkriterien**:
  - Aktuelle Speisekarte wird angezeigt.
  - Nutzer können Artikel zum Warenkorb hinzufügen und entfernen.
- **Priorität**: Mittel

### 5. QR-Code Generierung und Nutzung
- **Beschreibung**: Nach erfolgreicher Reservierung und/oder Bezahlung wird ein QR-Code generiert.
- **Akzeptanzkriterien**:
  - QR-Code enthält relevante Daten für Reservierung und Bestellung.
  - Restaurant-Mitarbeiter können den QR-Code bei Ankunft des Gastes scannen.
- **Priorität**: Hoch

### 6. Gruppenreservierung
- **Beschreibung**: Eine Person kann für eine Gruppe reservieren und QR-Codes an andere Gäste senden.
- **Akzeptanzkriterien**:
  - Möglichkeit, die Anzahl der Gäste auszuwählen.
  - Generierung individueller QR-Codes für jeden Gast.
- **Priorität**: Mittel

### 7. Terminverschiebung und Stornierung
- **Beschreibung**: Nutzer können ihre Reservierung ändern oder stornieren.
- **Akzeptanzkriterien**:
  - Optionen zum Ändern und Stornieren sind leicht zugänglich.
  - Bei Stornierung kurz vor dem Termin oder Nichterscheinen werden Gebühren erhoben.
- **Priorität**: Mittel

### 8. Benachrichtigungen
- **Beschreibung**: E-Mail-Benachrichtigungen werden für Reservierungen, Stornierungen und Änderungen gesendet.
- **Akzeptanzkriterien**:
  - E-Mails sind klar formuliert und enthalten relevante Informationen.
  - Keine Spam-Mails.
- **Priorität**: Niedrig

### 9. Integration von Drittanbieter-Zahlungs-APIs
- **Beschreibung**: Integration von Zahlungsmethoden wie PayPal.
- **Akzeptanzkriterien**:
  - Sichere Verbindung und Datenübertragung.
  - Klare Rückmeldung über den Zahlungsstatus.
- **Priorität**: Hoch

### 10. TimeOut-Benachrichtigung für das Personal
- **Beschreibung**: Das Personal wird benachrichtigt, wenn ein Gast nach 2 Stunden nicht ausgecheckt hat.
- **Akzeptanzkriterien**:
  - Automatische Benachrichtigung nach 2 Stunden.
  - Option für das Personal, den Besuch manuell zu beenden.
- **Priorität**: Niedrig