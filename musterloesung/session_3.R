### Musterlösung Session 3
### Philipp Behrendt & Jan Dix

## Recap Lösungen

# 1. Speicher `attack_type` in **Uppercase** in der Variable `attack_upper`.
attack_upper <- toupper(gtdb$attack_type)

# 2. Kombiniere `date` und `n_kill` zu einem neuen Vektor `nonsense`. Wie lang ist der Vektor?
nonsense <- c(gtdb$date, gtdb$n_kill) 

# 3. Wieviele Tote gab es durchschnittlich?
mean(gtdb$n_kill)


# Pakete laden
library(readxl)
library(readr)

## Aufgabe 2 & 3:
## Laden Sie alle Dateien in R und speichern Sie sie in unterschiedlichen, aussagekräftigen Variablen.
## Schauen Sie sich die Variablen mit Hilfe des Befehls View() an.

# gtdb_1998-2014.xlsx laden
gtdb_1998_2014 <- read_excel("./data/Session_3/gtdb_1998-2014.xlsx")
View(gtdb_1998_2014)

# gtdb_2015.tsv laden
gtdb_2015 <- read_delim("./data/Session_3/gtdb_2015.tsv", 
                        delim = "\t", 
                        escape_double = FALSE, 
                        trim_ws = TRUE)
View(gtdb_2015)

# gtdb_2016.csv laden
gtdb_2016 <- read_delim("./data/Session_3/gtdb_2016.csv", 
                        delim = ";", 
                        escape_double = FALSE, 
                        col_names = FALSE, 
                        trim_ws = TRUE)
names(gtdb_2016) <- names(gtdb_2015)
View(gtdb_2016)

# gtdb_coordinates.RData laden
load("./data/Session_3/gtdb_coordinates.RData")


## Aufgabe 4:
## Fügen Sie die vier Teildatensätze sinnvoll zusammen. Überlegen Sie sorgfältig, welche der kennengelernten Funktionen Sie dabei benötigen.
# Reihen zusammenfügen
gtdb <- rbind(gtdb_1998_2014, 
              gtdb_2015, 
              gtdb_2016)

# Koordinaten hinzufügen
gtdb <- merge(gtdb, gtdb_coordinates,
              by = "eventid")

## Aufgabe 5:
## Speichern Sie den finalen Datensatz im rds-Format in Ihrem Projektordner.
saveRDS(gtdb, file = "./data/gtdb.rds")
