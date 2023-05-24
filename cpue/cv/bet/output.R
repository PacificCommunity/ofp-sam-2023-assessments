## Extract results of interest, write TAF output tables

## Before: sigma.csv (model)
## After:  sigma.csv (output)

library(TAF)

mkdir("output")

cp("model/sigma.csv", "output")
