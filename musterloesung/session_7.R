### Musterlösung Session 7
### Philipp Behrendt & Jan Dix

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
gtdb_country_sample <- 
  
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
  query <- 
  
  if (!is.na(gtdb_country_sample$province[i])) {
    query <- 
  }
  
  if (!is.na(gtdb_country_sample$city[i])) {
    query <- 
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
