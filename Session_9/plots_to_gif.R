### Session 9  Appetizer 

# Lade Packages 
library(magick)
library(ggplot2)

# Lade daten und nur complete cases
plot_daten <- na.omit(readRDS("../Data/Project/gtdb.rds"))

# Öffne ein Bild 
img <- image_graph(600, 600, res = 96)

# Loope durch jedes Jahr und erstelle einen Plot  
for (year in seq(min(plot_daten$iyear), max(plot_daten$iyear) , 1)){
  
  plot(latitude ~ longitude,
       xlab = "Longitude",
       ylab = "Latitude",
       main = paste("Attacks in" , year),
       las = 2,
       pch = 20,
       data = plot_daten[plot_daten$iyear == year, ],
       ylim = c(-90, 90),
       xlim = c(-180, 180))
}

# Schließe das Bild 
dev.off()

# speichere die Animation ab, 1 Bild pro Sekunde 
animation <- image_animate(img, fps = 1)

# Speicher das Gif ab 
image_write(animation, "attacks_per_year.gif")



### Fintuning mit ggplot 
                                                            
# Erstelle eine Weltkarte als Layer
mapWorld <- borders("world", colour="black", fill="gray75")

# Öffne ein Bild 
img <- image_graph(1200, 600, res = 100)

# Mache einen Plot für jedes Jahr mit ggplot 
for (year in seq(min(plot_daten$iyear), max(plot_daten$iyear), 1)){
  
  gtdb_year = plot_daten[plot_daten$iyear == year, ]
  
  mp <- ggplot(aes(x = longitude, y = latitude, colour = factor(suicide), 
                   size = nkill) , data = gtdb_year) +  
    mapWorld + 
    geom_point(aes(x = longitude, y = latitude),
               data = gtdb_year) + 
    ggtitle(paste("Attacks in ", year))+ 
    scale_size_continuous(range = c(0,500))
    
  print(mp)
}

# Schließe das Bild 
dev.off()

# Speichere die Animation ab, 2 Bilder pro Sekunde 
animation_2 <- image_animate(img, fps = 1)

# Speicher als Gif
image_write(animation_2, "fancy_attacks_per_year.gif")

