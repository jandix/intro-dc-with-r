##########################################################################
#
# Session 4: Analyse
# Introduction to Data Collection with R
# Philipp Behrendt (philipp.behrendt@uni.kn) & Jan Dix (jan.dix@uni.kn)
#
##########################################################################

# Datensatz beschreiben ----

## Wieviele Fälle gibt es?
nrow(gtdb)

## Wieviele Spalten gibt es?
ncol(gtdb)

## Welche Variablen gibt es?
## Ein Blick ins Codebook hilft, die Varibalennamen zu verstehen.
names(gtdb)

# Nominale Variablen ----

## Welche Ausprägungen nimmt die Variable 'attacktype1_txt' an?
table(gtdb$attacktype1_txt)

## Welche Ausprägungen nimmt die Variable 'natlty1_txt' an?
table(gtdb$natlty1_txt)


# For-loop ----


# Numerische Variablen ----