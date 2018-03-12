##########################################################################
#
# Introduction to Data Collection with R
# Session 3: Daten einlesen & speichern
# Philipp Behrendt (philipp.behrendt@uni.kn) & Jan Dix (jan.dix@uni.kn)
#
##########################################################################

# packages laden
library(readxl)

# datensatz laden
gtdb <- read_excel("D:/NextCloud/uni/courses/intro-dc-with-r/Data/gtdb.xlsx")


View(gtdb)


library(ggplot2)

mp <- NULL
mapWorld <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
mp <- ggplot() +   mapWorld

#Now Layer the cities on top
mp <- mp+ geom_point(aes(x=gtdb$longitude[1:20000], y=gtdb$latitude[1:20000]), color="pink", size=1, alpha = .6) 
mp
