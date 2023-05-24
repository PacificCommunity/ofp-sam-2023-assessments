## Extract results of interest, write TAF output tables

## Before: cpue.csv, sigma_loess.csv, sigma_model.csv (model)
## After:  cpue.csv, sigma_loess.csv, sigma_model.csv (output)

library(TAF)

mkdir("output")

cp("model/cpue.csv", "output")
cp("model/sigma_loess.csv", "output")
cp("model/sigma_model.csv", "output")
