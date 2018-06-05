### Musterlösung Session 5
### Philipp Behrendt & Jan Dix

# 1. Schreibe eine For-Loop, in der die Quadratzahlen von 1 bis 10 ausgegeben werden
for (index in 1:10) {
  print(index)
  print(index^2)
}

# 2. Erstelle einen Vektor half_of_year, der eine 0 angibt, wenn der Anschlag im ersten Halbjahr des Jahres stattgefunden hat, und eine 1 für die zweite Jahreshälfte.
half_of_year <- ifelse(gtdb$imonth <= 6, 0, 1)

# 3. Bestimme mit Hilfe einer For-Loop die Anzahl aller getöteten Personen für den gesamten Datensatz. Welche andere Funktion erledigt das mit einer Zeile Code?
n_kill_count <- 0

for (index in 1:nrow(gtdb)) {
  if (!is.na(gtdb$nkill[index]) & gtdb$nkill[index] >= 1) {
    n_kill_count <- n_kill_count + gtdb$nkill[index]
  }
}




  
  