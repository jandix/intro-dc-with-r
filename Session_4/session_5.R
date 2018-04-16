##########################################################################
#
# Session 4: Analyse & Basic Programming
# Introduction to Data Collection with R
# Philipp Behrendt (philipp.behrendt@uni.kn) & Jan Dix (jan.dix@uni.kn)
#
##########################################################################

# Load Dataset ----
## Pfad an eigene Ordnerstruktur anpassen!
## readRDS("gtdb.rds")


# Subsetting ----

## Recall 
a <-  c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
subset_a <- a[1:3]

##
b <- c(1, 2, 3, 1, 3, 5, 7, 1, 3, 1)
subset_b <- b[b == 1]

## 





# Basic Programming ----

## If Else

age <- 18

if (age >= 18) {
  print("Champagner") 
} else {
  print("Limo")
}


## For Loop

for (index in 1:10) {
  print(index)
}

suicide_counter <- 0 

for (index in 1:nrow(gtdb)) {
  if (gtdb$suicide[index] == 1) {
    suicide_counter <-  suicide_counter + 1 
  } else {
    suicide_counter <- suicide_counter + 0 
  }
}















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