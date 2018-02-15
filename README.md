# Introduction to Data Collection with R

Philipp Behrendt (philipp.behrendt@uni-konstanz.de), MSc SEDA

Jan Dix (jan.dix@uni-konstanz.de), MSc SEDA 

#### Kursbeschreibung

Ziel des Kurses ist es den Studierenden das Thema Data Collection näher zu bringen, als fakultative Ergänzung zur Methodenvorlesung und richtet sich somit primär an Studierende des zweiten Semesters Politik- und Verwaltungswissenschaften. Dabei soll nicht auf den Inhalt der Vorlesung eingangen werden, sondern das Sammeln und Aufbreiten von Daten aus verschiedenen Quellen, wie Global Terrorism Database, Google Maps und New York Times API, näher gebracht werden. Die Studierenden sollen ermutigt werden, Daten eigenständig zusammenzutragen und einfache Auswertungen durchzuführen. Der Kurs beinhaltet keine wöchentlichen Literatur, aber setzt das eigenständige Auseinandersetzen und Nachbereiten des Kursinhalts voraus. Es wird wöchentliche Challenges geben, die die Studierenden in Eigenarbeit lösen. Der praktische Aspekt, das Programmieren, steht dabei im Vordergrund. Der Kurs ist auf 40 Studierende begrenzt.

#### Bewerbung

Die Bewerbung erfolgt über eine private Nachricht an den Twitter Account [\@MightyeR_KN](https://twitter.com/MightyeR_KN). Die Bewerbung soll sich an der Länge von zwei Tweets (+/- 560 Zeichen) orientieren. Die Auswahl der KandidatenInnen erfolgt auf Basis der eigenreichten Nachricht. 

#### Daten Quellen

1. [Global Terrorism Database](apps.start.umd.edu/gtd/downloads/dataset/GTD_0617dist.zip)
2. [NYT API](https://developer.nytimes.com/)
3. [Google Maps API](https://developers.google.com/maps/)


#### Session 1 - R and RStudio

##### Motivation
- Wo wollen wir hin?
- Auswertung der Berwerbungen

##### Syllabus

##### Einführung in die Programmiersprache R
- Was ist R?
- Wo kommt R her?
- Für welchen Zweck ist R entwickelt worden? 

##### Aufgabe: Installation des Systems

##### Einführung in RStudio
- Tour durch RStudio
- Fenster
- Globale Einstellungen

##### Wie arbeiten wir mit RStudio
- Workflow
- Pakete
- Directory Structures and Projects

##### Hilfe?!
- Stack Overflow
- Help Pages
- Twitter
- Hadley Wickham
- RStudio


#### Session 2 - Data Types and Basic Programming

##### Daten Typen

- Primitive Daten Typen und einfache Operatoren
- (Komplexe) Daten Typen und einfache Funktionen (Bsp.: c(1,2,3))
- Eigene Daten Typen

#### Session 3 - Daten einlesen und speichern

##### Daten einlesen
- CSV, TSV, etc...
- Stata
- Excel
- RData
- Online

##### Daten speichern
- CSV
- Excel
- RData

**Weeklies:** Projektstruktur anlegen, Datensatz einlesen und als RData speichern. (siehe Datenquelle 1)


#### Session 4 - Einfache Analyse (numerisch)

- Anwendung von Schleifen

##### Deskriptive Statistiken
- table
- sums 
- means

**Weeklies:** Fragen zum Datensatz. (Bsp.: Wie oft ist die Polizei das Zeil von Anschlägen?)


#### Session 5 - Visualisierung 

##### Visualiserung
- Ergebnisse der Weeklies ploten
- Individualiseren der Plots - gleichzeitig Einführung in R Dokumentation

**Weeklies:** Schwieriegere Fragen zum Datensatz. (Bsp.: Wie oft ist die Polizei das Ziel von Anschlägen im Jahr 2000?)


#### Session 6 - Alternative Datenquellen

##### APIs
- Google Maps - hinzufügen der Länder
- Länder/Anschläge Barchart zur Heatmap
- New York Times API (cleveres Query)

**Weeklies:** Zeitungsartikel zu 100 Anschlägen suchen über die New York Times API.

#### Session 7 - Strings
- Regex
- Document Term Matrix
- Wordclouds

**Weeklies:** Wordclouds der Zeitungsartikel aus Session 6.


#### Session 8 & 9 - Web Scraping
- Einführung in `httr`und `rvest`
- Laden und analysieren der New York Times Artikel
 