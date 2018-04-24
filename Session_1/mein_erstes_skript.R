# datensatz laden
mtcars <- mtcars

# Miles per Gallon abhängig von Horse Power
plot(mpg ~ hp,
     main = "Miles per Gallon vs. Horse Power",
     data = mtcars)
abline(lm(mpg ~ hp,
          data = mtcars))