### Musterlösung Session 2
### Philipp Behrendt & Jan Dix

## Aufgabe 1:
# Erstelle die Variable radius mit dem Wert 5.
radius <- 5

# Berechne den Umfang und speicher den Wert in umfang.
umfang <- 2 * pi * radius

# Erstelle die Variable fname mit deinem Vornamen.
fname <- "Hans"

# Erstelle die Variable lname mit deinem Nachnamen.
lname <- "Peters"

# Transformiere lname zu Großbuchstaben und speicher den Wert in lname_upper.
lname_upper <- toupper(lname)

# Füge fname und lname in der Variable name zusammen. (Tipp: ?paste)
name <- paste(fname, lname)

## Aufgabe 2:
# Nehme an, dass a <- TRUE, b <- FALSE und c <- TRUE. Bestimmen den Wahrheitswert der folgenden Aussagen:
a <- TRUE
b <- FALSE
c <- TRUE

a && b # FALSE
c && !b # TRUE
a || b || c # TRUE
(a && b) || !c # FALSE
(a && b) || !c && !!b || a # TRUE

## Aufgabe 3:
# Erstelle die folgenden Vektoren:
numbers_1 <- 1:6
numbers_2 <- seq(1, 2, 0.2)
numbers_3 <- c("1", "222", "079", "362", "902", "007")

# Addiere numbers_1 und numbers_2. Speicher das Ergebnis in addition.
addition <- numbers_1 + numbers_2

# Kombiniere die ersten fünf Elemente von addition und die letzten drei Elemente von numbers_2 zu einem neuen Vektor long_n.
long_n <- c(addition[1:5], numbers_2[4:6])

# Addiere numbers_1 und long_n. Was fällt dir auf?
numbers_1 + long_n

# Ersetzte alle 0 mit 9 in numbers_3. Speicher das Ergebnis in numbers_large.
numbers_large <- gsub("0", "9", numbers_3)

# Kombiniere Vektor numbers_large und numbers_2 zu einem neuen Vektor long_c. Was fällt dir auf?
long_c <- c(numbers_large, numbers_2) 

# Addiere Vektor numbers_large und addition. (Tipp: as.numeric())
as.numeric(numbers_large) + addition

## Aufgabe 4:
# Datensatz runterladen/kopieren
# Datensatz im Projektordern unter ./data/ speichern
# Datensatz öffnen
load("data/Session_2/gtdb_data_types.Rdata")

# Wieviele Zeilen hat der Datensatz?
# Wie heißen die Spalten des Datensatz?
# Wie lautet der dritte Eintrag in der Spalte 'n_kill'?
# Welchen Datetypen haben die Spalten im Datensatz?
# Wie hoch war die maximale Anzahl der Tötungen? (Tipp: na.rm = TRUE)

