## app namen definieren
appname <- "dm_app_intro"

## api key
key <- "xxx"

## api secret
secret <- "xxx"

## rtweet token erstellen
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret
)

## home verzeichnis 
home_directory <- path.expand("~/")

## dateipfad erstellen
file_name <- file.path(home_directory, "twitter_token.rds")

## token speichern
saveRDS(twitter_token, file = file_name)

## token in der Renviron speichern
cat(paste0("TWITTER_PAT=", file_name),
    file = file.path(home_directory, ".Renviron"),
    append = TRUE)
