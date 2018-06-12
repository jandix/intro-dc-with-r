osm_geocoding <- function (q, 
                           street = NULL,
                           city = NULL,
                           county = NULL,
                           state = NULL,
                           country = NULL,
                           postalcode = NULL) {
  
  # catch empty query
  if (is.null(q)) {
    stop("Please provide a query", call. = FALSE)
  }
  
  # define base url
  url <- httr::parse_url("https://nominatim.openstreetmap.org/search")
  
  # define query
  url$query <- list(
    format = "json",
    q = q,
    street = street,
    city = city,
    county = county,
    state = state,
    country = country,
    postalcode = postalcode
  )
  
  # paste url
  url <- httr::build_url(url)
  
  # request query
  response <- httr::GET(url, httr::add_headers("user-agent" = "Data-Collection with R "))
  
  # check if successful
  if (httr::http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  # get content
  json <- httr::content(response, "text")
  
  # parse result to data frame
  parsed_json <- jsonlite::fromJSON(json)
  
  # check if http error
  if (httr::http_error(response)) {
    stop(
      sprintf(
        "OpenStreetMap request failed [%s]",
        httr::status_code(response)
      ),
      call. = FALSE
    )
  }
  
  # check if http error
  if (!is.null(parsed_json$error)) {
    stop(
      sprintf(
        "OpenStreetMap request failed \n[%s] %s",
        httr::status_code(response),
        parsed_json$error
      ),
      call. = FALSE
    )
  }
  
  # return parsed object
  parsed_json[1, ]
}

osm_reverse_geocoding <- function (lat,
                                   lon) {
  
  # catch empty query
  if (is.null(lat) | is.null(lon)) {
    stop("Please provide latitude and longitude", call. = FALSE)
  }
  
  # define base url
  url <- httr::parse_url("https://nominatim.openstreetmap.org/reverse")
  
  # define query
  url$query <- list(
    format = "json",
    lat = lat,
    lon = lon
  )
  
  # paste url
  url <- httr::build_url(url)
  
  # request query
  response <- httr::GET(url, httr::add_headers("user-agent" = "Data-Collection with R"))
  
  # check if successful
  if (httr::http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  # get content
  json <- httr::content(response, "text")
  
  # parse result to data frame
  parsed_json <- jsonlite::fromJSON(json)
  
  # check if http error
  if (httr::http_error(response)) {
    stop(
      sprintf(
        "OpenStreetMap request failed [%s]",
        httr::status_code(response)
      ),
      call. = FALSE
    )
  }
  
  # check if http error
  if (!is.null(parsed_json$error)) {
    stop(
      sprintf(
        "OpenStreetMap request failed \n[%s] %s",
        httr::status_code(response),
        parsed_json$error
      ),
      call. = FALSE
    )
  }
  
  # return parsed object
  parsed_json <- data.frame(parsed_json$address, stringsAsFactors = F)
  parsed_json
}



