## Run analysis, write model results

## Before: fdesc.csv, frq_yft.csv (data)
## After:  frq_yft.csv (model)

library(TAF)

mkdir("model")

# Read files
fdesc <- read.taf("data/fdesc.csv")
frq.yft <- read.taf("data/frq_yft.csv")

# Merge length frequencies and fishery descriptions
frq.yft <- merge(frq.yft, fdesc)
frq.yft <- frq.yft[c("fishery.id", "fishery", "region", "length", "freq")]

# Write table
write.taf(frq.yft, dir="model")
