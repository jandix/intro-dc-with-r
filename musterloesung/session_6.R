### Musterlösung Session 6
### Philipp Behrendt & Jan Dix

# Textdateien können mit Hilfe des Befehls readLines() eingelesen werden. Die Funktion nimmt als Argument einen Dateipfad oder eine URL.

# Lese und parse die Datei https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/countries.json.
library(jsonlite)
json <- readLines("https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/countries.json")
parse_json <- fromJSON(json)

# Lese und parse die Datei https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/batman.xml und gebe das Alter aller Heroes aus. Errechne anschließend das Durchschnittsalter.
library(xml2)
xml <- readLines("https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/batman.xml")
xml <- paste(xml, collapse = "")
xml_parsed <- read_xml(xml)
heroes <- xml_find_all(xml_parsed, "//hero")
ages <- xml_attr(heroes, "age")
ages <- as.numeric(ages)
mean(ages)


# In dem Datensatz hat sich bei attacktype1_txt bei manchen Variablen ein 
# Fehler eingeschlichen. Ändere die numerischen Werte in ihre String-Repräsentation. 
# Erstelle nun einen neuen Barplot, bei dem auch die Variablenname passen. 
# Änder dazu entweder die Schriftgröße oder passe die Variablennamen an. 
# Für Fortgeschrittene: Schau dir par() an, um die Plottingcanvas anzupassen.

# Datensatz laden
gtdb <- readRDS("./data/gtdb.rds")

# 1) Ändere die numerischen Werte in ihre String-Repräsentation.

table(gtdb$attacktype1_txt)
gtdb$attacktype1_txt <- ifelse(gtdb$attacktype1_txt == "1", "Assassination", gtdb$attacktype1_txt)
gtdb$attacktype1_txt <- ifelse(gtdb$attacktype1_txt == "2", "Armed Assault", gtdb$attacktype1_txt)
gtdb$attacktype1_txt <- ifelse(gtdb$attacktype1_txt == "7", "Facility/Infrastructure Attack", gtdb$attacktype1_txt)
table(gtdb$attacktype1_txt)

# 2) Erstelle nun einen neuen Barplot, bei dem auch die Variablenname passen.

# original grafik parameter speichern
original_par <- par()

# neue margins einstellen
par(mar = c(10, 4.1, 4.1, 2.1))

# frequency table erstellen
attacks <- table(gtdb$attacktype1_txt)

# Label umbenennen
names(attacks) <- c("Armed Assault",
                    "Assassination",
                    "Bombing",
                    "Infrastructure Attack",
                    "Hijacking",
                    "Barricade Incident",
                    "Kidnapping",
                    "Unarmed Assault",
                    "Unknown")

# plotten
barplot(attacks,
        main = "Attacks by Type",
        las = 2,
        col = rainbow(n = 9))

# original parameter zurücksetzten
par(original_par)

# Erstelle ein Sample mit allen vollständigen Observationen aus dem Jahr 2012. 
# Speicher diesen Datensatz in gtdb_2012_complete.

# Lade openstreetmap Funktionen
source("./r/openstreetmap.r")

# Lade den Datensatz gtdb, den du in den Hausaufgaben erstellt hast.
gtdb <- readRDS("./data/gtdb.rds")

# Lösche alle Zeilen mit mindestens einem NA
gtdb <- na.omit(gtdb)
gtdb_2012_complete <- gtdb[gtdb$iyear == 2012, ]

# 1) Erstelle eine leere Spalte country in dem neuen Datensatz.
gtdb_2012_complete$country <- NA

# 2) Ermittle den country_code für jede Observation mit Hilfe von osm_reverse_geocoding(). Obacht Diese Funktion ist nicht vektorisiert. Die Ausführung kann sehr, sehr lange dauern.

# Lade Land für alle Observationen
for (i in 1:nrow(gtdb_2012_complete)) {
  # Koordinaten extrahieren
  lat <- gtdb_2012_complete$latitude[i]
  lon <- gtdb_2012_complete$longitude[i] 
  
  # Abfrage
  result <- osm_reverse_geocoding(lat, lon)
  
  # Countrycode extrahieren
  gtdb_2012_complete$country[i] <- result$country_code 
  
  # Fortschritt ausgeben
  if (i %% 10 == 0) {
    print(i)
  }
  
  # Schlafen
  Sys.sleep(1)
}


