# Spezifikation für das Projekt "REAP" (Reserve And Preorder)

## 1. Einleitung

### 1.1 Hintergrund

In der heutigen schnelllebigen Welt suchen Menschen nach Möglichkeiten, ihre täglichen Aktivitäten zu optimieren und effizienter zu gestalten. "REAP" bietet eine Lösung für Restaurantbesucher, die ihre Zeit in der Mittagspause maximieren möchten.

### 1.2 Zielsetzung

Die Hauptzielsetzung dieses Projekts ist die Entwicklung eines Systems, das Restaurantbesuchern ermöglicht, Plätze zu reservieren, Speisen und Getränke vorzubestellen und im Voraus zu bezahlen, um den Besuch im Restaurant zu optimieren.

## 2. Hauptfunktionalitäten

### 2.1 Reservierung von Plätzen

- Reservierung für einen bestimmten Zeitpunkt und eine bestimmte Zeitspanne
- Erfassung von Kundendaten: Name, Telefonnummer, E-Mail-Adresse
- Auswahl der Zahlungsmethode: Kreditkarte, PayPal, Bargeld

### 2.2 Vorbestellung von Speisen/Getränken

- Auswahl aus der Speisekarte
- Optionale Vorabzahlung

### 2.3 QR-Code-System

- Generierung eines QR-Codes für Reservierung und Bezahlung
- Check-in bei Ankunft über den QR-Code
- Nachbestellung von Speisen/Getränken über QR-Code
- Feedback-Option nach dem Besuch

### 2.4 Gruppenreservierung

- Reservierung durch eine Hauptperson mit der Möglichkeit, anderen Gästen individuelle QR-Codes zu senden
- Jeder Gast kann individuell bestellen und bezahlen

### 2.5 Terminmanagement

- Option zur Verschiebung und Stornierung von Terminen
- Benachrichtigungsfunktionen für das Personal

## 3. Zusätzliche Features

### 3.1 Benachrichtigungen

- E-Mail-Benachrichtigungen über Reservierungen, Stornierungen und Änderungen
- Benachrichtigung für das Personal bei längerem Verbleib des Gastes

### 3.2 Sicherheit

- Verschlüsselung von sensiblen Daten
- Authentifizierung und Autorisierung für bestimmte Bereiche

## 4. Grenzfälle

- TimeOut: Wenn ein Besuch nach 2 Stunden nicht beendet wurde
- Stornierungsgebühren und Absenzgebühren
- Teilstornierung bei Gruppenreservierungen

## 5. Technologie

- **Backend**: Java, Datenbank, GRPC
- **Frontend**: Web-App mit Servlet-Technologie oder Webservice-Schnittstelle, Template-Engine
- **Zahlungsschnittstelle**: Integration von Drittanbieter-APIs
- **QR-Code Generierung**: Java-Bibliothek (z.B. ZXing)

### 5.1 Vorläufiges UML-Diagram

![UML Diagram](/docu/UML_0-1.png)

### 5.2 (Gruppen-) Aufteilung

Gruppenänderung jeder Zeit möglich, da z.b. die Resoourcen benötigt werden

![UML Diagram](/docu/Organigramm_0-1.png)

### 5.3 Datenbank

Die Datenbank besteht aus sechs Tabellen: Restaurants, Menüs, Mahlzeiten, Zutaten, Reservierungen und einer Zwischentabelle Mahlzeiten-Zutaten. 
Jedes Restaurant kann mehrere Menüs und mehrere Reservierungen haben.
Jede Reservierung kann nur zu einem einzigen Restaurant gehören.
Jedes Menü kann nur zu einem einzigen Restaurant gehören.
Jedes Menü kann mehrere Speisen enthalten
Jede Speise kann mehrere Zutaten haben und jede Zutat kann zu mehreren Speisen gehören

![Datenbank](/docu/Database-Diagram.png)

### 5.3 Farbpalette (Lightmode)

![Datenbank](/docu/farbpalette.png)


## 6. Abschluss

Dieses Dokument dient als Grundlage für die Entwicklung des "REAP"-Systems. Es soll sicherstellen, dass alle Beteiligten ein klares Verständnis der Anforderungen und Erwartungen des Projekts haben. Es wird erwartet, dass während der Entwicklungsphase Anpassungen vorgenommen werden können, um den sich ändernden Bedürfnissen und Herausforderungen gerecht zu werden.