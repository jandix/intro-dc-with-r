##########################################################################
#
# Introduction to Data Collection with R
# Session 6: Application Programming Interfaces (APIs)
# Philipp Behrendt (philipp.behrendt@uni.kn) & Jan Dix (jan.dix@uni.kn)
#
##########################################################################

# Was sind APIs?
#
#
#
#

# Aktuellen Datensatz laden


# Google Maps API

## Installiere das Paket
if (!require(ggmap)) install.packages(ggmap)

## Funktion testen
result <- revgeocode(c(9.18, 47.68), output = "more")

## Funktioniert auch auf Vektoren


# Aufgabe 1: 
# Füge vier neue Spalten zu der aktuellen Version deines Datensatz hinzu. 
#   (1) Erstelle eine Spalte "city", die Ort/Stadt enthält.
#   (2) Erstelle eine Spalte "state", die das Bundesland/State enthält.
#   (3) Erstelle eine Spalte "country", die das Land enthält.
#   (4) Erstelle eine Spalte "postal_code", die das

# New York Times API


