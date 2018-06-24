### Musterlösung Session 8
### Philipp Behrendt & Jan Dix

# Pakete laden
library(htmltab)

# 1) Lade die Tabelle mit der Zusammensetzung des deutschen Bundestags herunter.

url <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(19._Wahlperiode)"
zusammensetzung <- htmltab(url)

# 2) Benutzte den Datensatz `gtdb_2012_cc.rds` aus der letzten Sitzung.

# Datensatz laden
gtdb <- readRDS("data/gtdb_2012_cc.rds")

# Afghanistan sample erstellen
afg_sample <- gtdb[gtdb$country == "Afghanistan", ]

# Provinz Tabelle laden
url <- "https://en.wikipedia.org/wiki/Provinces_of_Afghanistan"
provinces <- htmltab(url,
                     which = 3)

# Spalten löschen
provinces <- provinces[ , c(1, 5, 6, 7)]

# Namen anpassen
names(provinces) <- c("province_name", "population", "area", "districts")

# Zahlen parsen
provinces[ , 2] <- gsub(",", "", provinces[ , 2])
provinces[ , 2] <- as.numeric(provinces[ , 2])
provinces[ , 3] <- gsub(",", "", provinces[ , 3])
provinces[ , 3] <- as.numeric(provinces[ , 3])

# Merge
afg_sample <- merge(afg_sample, provinces,
                    by.x = "province", 
                    by.y = "province_name")
