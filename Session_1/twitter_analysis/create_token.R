## whatever name you assigned to your created app
appname <- "mightyr_workshop"

## api key (example below is not a real key)
key <- "pLrGPZJwcnFsl4XogZru3NDO3"

## api secret (example below is not a real key)
secret <- "1glXLKUEPen5BR1nquuVMNAq0u6khF47AczCMeUi5Q8nOjCoJe"

## create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

## path of home directory
home_directory <- path.expand("~/")

## combine with name for token
file_name <- file.path(home_directory, "twitter_token.rds")

## save token to home directory
saveRDS(twitter_token, file = file_name)

