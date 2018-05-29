### Musterlösung Session 4
### Philipp Behrendt & Jan Dix

# Lade den Datensatz gtdb, den du in den Hausaufgaben erstellt hast.
gtdb <- readRDS("./data/gtdb.rds")

# 1. Speicher alle Daten aus dem Jahr 2002 in einer neuen Variablen gtdb_2002.
gtdb_2002 <- gtdb[gtdb$iyear == 2002, ]

# 2. Speicher alle Events, bei denen es mehr als 200 Tote gab in gtdb_200.
gtdb_200 <- gtdb[gtdb$nkill > 200 & !is.na(gtdb$nkill), ]

# 3. Speicher alle Summaries für Selbstmordanschläge in summary_suicide.
summary_suicide <- gtdb[gtdb$suicide == 1, "summary"]

# 4. Speicher Latitude, Longitude und attacktype_1_txt für die Jahre 1999 und 2003 in gtdb_geo.
gtdb_geo <- gtdb[gtdb$iyear == 1999 | gtdb$iyear == 2003, c("latitude", "longitude", "attacktype1_txt")]

# 5. Speicher alle Daten für alle Jahre vor 2006 bei denen das Ziel das Militär war in gtdb_military.
gtdb_military <- gtdb[gtdb$iyear < 2006 & (gtdb$targtype1_txt == "Military" | gtdb$targtype1_txt == "Transportation"), ]

## Hausaufgaben

# 1. Was ist der Median von `nkill`?
median(gtdb$nkill, na.rm = TRUE)

# 2. Wieviele Selbstmordanschläge gab es?
sum(gtdb$suicide == 1)

# 3. Wieviele verschiedene Kategorien hat die Variable `attacktype1_txt`?
table(gtdb$attacktype1_txt)

# 4. Wieviele Selbstmordanschläge gab es im Jahr 2003?
sum(gtdb$iyear == 2003 & gtdb$suicide == 1)

# 5. Wie oft wurde das russische Militär angegriffen? 
sum(gtdb$natlty1 == 167 & gtdb$targtype1 == 4, na.rm = TRUE)
sum(gtdb$natlty1_txt == "Russia" & gtdb$targtype1_txt == "Military", na.rm = TRUE)

# 6. Wie oft war ein Selbstmordanschlag mit einer Bombe erfolgreich?

sum(gtdb$suicide == 1 & gtdb$attacktype1  == 3 & gtdb$success == 1, na.rm = TRUE)

# 7. Bestimme alle Kennzahlen von `nkill` und interpretiere diese.
summary(gtdb$nkill)

# 8. Wie hoch ist der `mean` bei Selbstmordanschläge? Wie hoch bei allen anderen Fällen?
mean(gtdb$nkill[gtdb$suicide == 1], na.rm = TRUE)
mean(gtdb$nkill[gtdb$suicide != 1], na.rm = TRUE)

# 9. Wieviel Anschläge gab es im Jahr 2009 bei dem das Ziel eine `Educational Institution` oder das angegriffene Ziel aus `East Timor` war?
nrow(gtdb[gtdb$iyear == 2009 & 
             (gtdb$targtype1_txt == "Educational Institution" | gtdb$natlty1_txt == "East Timor"), ])

# 10. Wie oft könnte die Opferzahl nicht ermittelt werden?
sum(is.na(gtdb$nkill))