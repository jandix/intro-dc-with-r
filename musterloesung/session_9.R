### Musterlösung Session 9
### Philipp Behrendt & Jan Dix

# Pakete laden 
library(rvest)

# 1) Lade den Datensatz `nyt_articles.rds`. Diesen haben wir mit Hilfe der NYT API heruntergeladen und enthält mögliche Zeitungsartikel zu Anschlägen.

# Datensatz laden
nyt_meta <- readRDS("data/nyt_articles.rds")

# 2) Lade die Artikel nun herunter. Scrape die Artikeltexte und speicher alle Artikel in einem Vektor `articles`. (Tipp: `c()`) Konzentriere dich dabei auf die ersten 10 Artikel.

# leere varibale initialisieren
articles <- NULL

for (i in 1:10) {
  # artikel herunterladen
  url <- nyt_meta$url[i]
  article <- read_html(url)
  
  # artikel parsen
  article_text <- html_nodes(article, ".story-body .story-content")
  article_text <- html_text(article_text)
  
  # artikel zusammenfügen
  articles <- c(articles, article_text)
  
  # 1 sek warten
  Sys.sleep(1)
}

# 3) Lade die Funktion `nyt_wordcloud()` aus dem Script `nyt_wordcloud.R` (`source()`). Nutzte die Funktion, um eine Wordcloud zu erstellen.

source("./r/nyt_wordcloud.R")
nyt_wordcloud(articles = articles)





