### Musterlösung Session 6
### Philipp Behrendt & Jan Dix

## Textdateien können mit Hilfe des Befehls readLines() eingelesen werden. Die Funktion nimmt als Argument einen Dateipfad oder eine URL.

## Lese und parse die Datei https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/countries.json.
library(jsonlite)
json <- readLines("https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/countries.json")
parse_json <- fromJSON(json)


## Lese und parse die Datei https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/batman.xml und gebe das Alter aller Heroes aus. Errechne anschließend das Durchschnittsalter.
library(xml2)
xml <- readLines("https://raw.githubusercontent.com/jandix/intro-dc-with-r/master/Data/Session_6/batman.xml")
xml <- paste(xml, collapse = "")
xml_parsed <- read_xml(xml)
heroes <- xml_find_all(xml_parsed, "//hero")
ages <- xml_attr(heroes, "age")
ages <- as.numeric(ages)
mean(ages)
