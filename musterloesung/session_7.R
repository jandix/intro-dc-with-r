### Musterlösung Session 7
### Philipp Behrendt & Jan Dix

# RTWEET
library(rtweet)
token <- get_token()

# 1) Finde 2000 Tweets mit dem Hashtag #TrumpKimSummit und speicher diese in der Variablen great_summit.

great_summit <- search_tweets(q = "#TrumpKimSummit",
                              n = 2000,
                              token = token)

# 2) Lad dir die Timeline von Jens Spahn herrunter und speicher sie in der Variable jens_spahn (n = 2000). Erstelle eine sample ohne die retweets. Welches Endgerät nutzt Jens Spahn? Wieviele likes bekommt Jens Spahn durchschnittlich? Wieviele retweets bekommt Jens Spahn durchschnittlich?

# Lade tweets von Jens Spahn
jens_spahn <- get_timeline("jensspahn",
                           n = 2000,
                           token = token)

# ohne retweets
jens_spahn_ort <- jens_spahn[!jens_spahn$is_retweet, ]

# endgerät
table(jens_spahn_ort$source)

# mean likes
mean(jens_spahn_ort$favorite_count)

# mean retweets
mean(jens_spahn_ort$retweet_count)


# RTIMES

# Pakete laden und installieren
if (!require(lubridate)) install.packages("lubridate")
library(lubridate)
if (!require(rtimes)) install.packages("rtimes")
library(rtimes)

# Datensatz laden
gtdb <- readRDS("data/gtdb_2012_cc.rds")

#########################################################################
# TODO: Erstelle ein Sample basierend auf einem Land (z.B.: Kolumbien).
#########################################################################
gtdb_country_sample <- gtdb[gtdb$country_code == "us", ]
  
# date erstellen
gtdb_country_sample$date <- make_date(year = gtdb_country_sample$iyear,
                                      month = gtdb_country_sample$imonth,
                                      day = gtdb_country_sample$iday)

# parameter
zeit_spanne <- 5 # 5 Tage
api_key <- "xxx"

for (i in 1:nrow(gtdb_country_sample)) {
  
  # begin date
  begin <- gsub("-", "", gtdb_country_sample$date[i])
  
  # end date 
  end <- gsub("-", "", gtdb_country_sample$date[i] + ddays(zeit_spanne))
  
  #########################################################################
  # TODO: Query definieren. (Tipp: paste())
  #########################################################################
  query <- gtdb_country_sample$gname[i]
  
  if (!is.na(gtdb_country_sample$province[i])) {
    query <- paste(gtdb_country_sample$gname[i], gtdb_country_sample$province[i])
  }
  
  if (!is.na(gtdb_country_sample$city[i])) {
    query <- paste(gtdb_country_sample$gname[i], gtdb_country_sample$city[i])
  }
  
  # get articles
  result <- as_search(q = query,
                      begin_date = begin,
                      end_date = end,
                      all_results = T,
                      key = api_key)
  
  if (nrow(result$data) > 0) {
    if (!exists("articles")) {
      articles <- data.frame(nyt_id = result$data$`_id`,
                             headline = result$data$headline.main,
                             url = result$data$web_url,
                             pub_date = result$data$pub_date,
                             word_count = result$data$word_count,
                             event_id = gtdb_country_sample$eventid[i],
                             stringsAsFactors = F)
    } else {
      article <- data.frame(nyt_id = result$data$`_id`,
                            headline = result$data$headline.main,
                            url = result$data$web_url,
                            pub_date = result$data$pub_date,
                            word_count = result$data$word_count,
                            event_id = gtdb_country_sample$eventid[i],
                            stringsAsFactors = F)
      articles <- rbind(articles, article)
    }
  }
  
  Sys.sleep(1)
}

# Datensatz speichern
saveRDS(articles, "data/nyt_articles.rds")
