## Extract results of interest, write TAF output tables

## Before: frq_yft.csv (model)
## After:  frq_yft.csv (output)

library(TAF)

mkdir("output")

cp("model/frq_yft.csv", "output")
