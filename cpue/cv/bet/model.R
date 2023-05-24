## Run analysis, write model results

## Before: cpue.csv (data)
## After:  sigma.csv (model)

library(TAF)
source("utilities.R")

mkdir("model")

# Read CPUE obs and fit
cpue <- read.taf("data/cpue.csv")

# Split by area
splits <- split(cpue, cpue$area)

# Calculate sigma_mle
sigma <- data.frame(area=as.integer(names(splits)),
                    sigma=sapply(splits, sigma.cpue))

# Write TAF table
write.taf(sigma, dir="model")
