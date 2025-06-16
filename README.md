Musiker App

Eine mobile Anwendung, die Musikern und Bands dabei hilft, ihre Auftritte effizient zu organisieren, Songmaterial zu verwalten und die interne Kommunikation zu optimieren. Entwickelt für iOS und Android, zielt diese App darauf ab, die oft chaotische Planung über Messenger und Tabellen durch eine zentrale, intuitive Plattform zu ersetzen.
Projektziel

Das Hauptziel der Musiker App ist es, den Organisationsaufwand für Musiker und Musikgruppen zu minimieren. Sie bietet eine zentrale Anlaufstelle für die Koordination von Auftrittsterminen, die Vorbereitung von Songs und die rollenspezifische Bereitstellung von Notenmaterial. Durch die Automatisierung dieser Aufgaben können sich Musiker voll auf ihre Kunst konzentrieren.
Kernfunktionen (MVP)

Die aktuelle Version der App konzentriert sich auf die Implementierung folgender Schlüsselmerkmale:
1. Benutzerverwaltung

    Registrierung und Login: Sichere Funktionen zur Erstellung neuer Konten und zur Anmeldung.

    Rollenbasierte Zuordnung: Beim ersten Login wählen Benutzer ihre Rolle (z.B. Gitarrist, Sänger, Schlagzeuger). Diese Rolle wird persistent gespeichert und steuert den Zugriff auf spezifische Inhalte und Funktionen.

2. Kalenderfunktion

    Auftrittsplanung: Eine übersichtliche Kalenderansicht zur Darstellung aller geplanten Auftritte.

    Termindetails: Jeder Termin kann Informationen wie Ort, Zeit und individuelle Notizen enthalten.

    Kartenintegration: Verknüpfung mit Kartendiensten zur direkten Anzeige des Veranstaltungsortes und zur Routenplanung.

3. Songauswahl pro Auftritt

    Flexible Songlisten: Jeder Auftritt kann eine eigene, anpassbare Songliste führen.

    Songmanagement: Einfaches Hinzufügen, Entfernen und Bearbeiten von Songs innerhalb der Auftrittsliste.

4. Rollenbasierter Dateizugriff

    Spezifische Materialien: Zu jedem Song können rollenspezifische Dateien (z.B. gitarrist.pdf, bassist.txt) hinterlegt werden.

    Automatischer Download: Die App lädt automatisch die für die jeweilige Benutzerrolle passende Datei aus einem Cloud-Speicher (z.B. Firebase Storage).

    In-App Viewer: Bereitstellung eines einfachen Viewers zur Anzeige von Text- und PDF-Dateien direkt in der App.

Technischer Überblick

Die Musiker App wird mit Flutter entwickelt, was eine plattformübergreifende Kompatibilität für iOS und Android gewährleistet. Für die Backend-Services, einschließlich Authentifizierung, Datenbank (Firestore) und Dateispeicherung (Firebase Storage), wird Firebase genutzt.
Zukünftige Entwicklung & Roadmap

Die aktuellen Implementierungen konzentrieren sich auf die Kernlogik und die Integration der grundlegenden Services. In zukünftigen Iterationen sind folgende Erweiterungen geplant:

    Benutzeroberfläche (UI/UX): Gestaltung einer intuitiven und ästhetisch ansprechenden Benutzeroberfläche, die eine reibungslose Benutzererfahrung bietet.

    API-Integrationen: Erweiterung der Funktionen durch Integration weiterer externer APIs (z.B. für Musikdienste, Wetter etc.).

    Kommunikationsfunktionen: Implementierung von In-App-Chat oder Benachrichtigungssystemen zur Verbesserung der Bandkommunikation.

    Erweiterte Zusammenarbeit: Funktionen zur gemeinsamen Bearbeitung von Songlisten oder Notizen.

    Lokalisierung: Unterstützung weiterer Sprachen, um eine breitere Nutzerbasis zu erreichen.

Installation (für Entwickler)

Um das Projekt lokal einzurichten, folge diesen Schritten:

    Voraussetzungen: Stelle sicher, dass Flutter und die Firebase CLI auf deinem System installiert sind.

    Klonen des Repositorys:

    git clone https://github.com/Flocanic/musikapp.git
    cd musikapp

    Abhängigkeiten installieren:

    flutter pub get

    Firebase-Konfiguration: Richte ein Firebase-Projekt ein und füge die entsprechenden google-services.json (Android) und GoogleService-Info.plist (iOS) Dateien in die jeweiligen Projektordner ein. Aktualisiere auch die lib/firebase_options.dart Datei mit deinen Projekt-IDs.

    App starten:

    flutter run

Mitwirken

Wir freuen uns über Beiträge zur Verbesserung der Musiker App! Wenn du Ideen hast oder Fehler findest, öffne bitte ein Issue oder sende einen Pull Request.
Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert. Weitere Details findest du in der LICENSE-Datei (falls vorhanden, ansonsten sollte sie hinzugefügt werden).

Vielen Dank, dass du dir die Musiker App ansiehst!
