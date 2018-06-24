# Pakete laden und installieren
if (!require(dplyr)) install.packages("dplyr")
library(dplyr) # daten transformieren
if (!require(tidytext)) install.packages("tidytext")
library(tidytext) # text daten bearbeiten
if (!require(RColorBrewer)) install.packages("RColorBrewer")
library(RColorBrewer) # farbpalletten
if (!require(wordcloud)) install.packages("wordcloud")
library(wordcloud) # wordcloud erstellen

nyt_wordcloud <- function (articles) {
  # load texts into df, remove stopwords and count frequency
  text_df <- data_frame(text = articles) %>% 
    unnest_tokens(word, text) %>% 
    anti_join(stop_words) %>%
    count(word, sort = TRUE) 
  
  # define colors
  colors <- brewer.pal(8, "Dark2")
  
  # plot wordcloud
  wordcloud(words = text_df$word,
            freq = text_df$n,
            colors = colors,
            min.freq = 10)
}
