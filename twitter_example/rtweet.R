## rtweet installieren
# if (!require(rtweet)) install.packages("rtweet")

## packages laden
library(rtweet) # twitter api
library(dplyr) # daten transformieren
library(tidytext) # text daten bearbeiten
library(RColorBrewer) # farbpalletten
library(wordcloud) # wordcloud erstellen

## nachrichten herunter laden
dms <- direct_messages()

## text extrahieren
messages <- paste(dms$text, collapse = " ")

## deutsche stop wörter
german_stop_words <- readLines(con = "https://raw.githubusercontent.com/stopwords-iso/stopwords-de/master/stopwords-de.txt")
german_stop_words <- data_frame(word = german_stop_words)
  
## stop wörter löschen und zahlen
text_df <- data_frame(text = messages) %>% 
  unnest_tokens(word, text) %>% 
  anti_join(german_stop_words) %>%
  count(word, sort = TRUE) 

## wordcloud erstellen
colors <- brewer.pal(8, "Dark2")
wordcloud(words = text_df$word,
          freq = text_df$n,
          colors = colors)

## alle einzigartigen user und namen extrahieren
users <- unique(dms$sender_screen_name)
names <- unique(dms$sender$name)

## nachricht
message <- "Hallo %s,\n

leider sind im Raum nur wenige Steckdosen vorhanden. Es wäre super, wenn noch einige von Euch einen Dreifachstecker mitbringen könnten.\n

Bis morgen

Philipp & Jan
"

## nachricht an jeden user senden
for (i in 1:length(users)) {
  post_message(sprintf(message, names[i]), users[i])
}
