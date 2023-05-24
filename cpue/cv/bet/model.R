## Run analysis, write model results

## Before: cpue.csv (data)
## After:  cpue.csv, sigma_loess.csv, sigma_model.csv (model)

library(TAF)
source("utilities.R")  # calculate.sigma.loess, calculate.sigma.model

mkdir("model")

# Read CPUE obs and fit
cpue <- read.taf("data/cpue.csv")

# Fit loess smoother
cpue$smooth <- NA_real_
for(a in sort(unique(cpue$area)))
{
  fm <- loess(obs~time, cpue, subset=area==a)
  cpue$smooth[cpue$area==a] <- predict(fm, cpue[cpue$area==a,])
}

# Calculate sigma
splits <- split(cpue, cpue$area)
sigma.loess <- sapply(splits, calculate.sigma.loess)
sigma.loess <- as.data.frame(t(sigma.loess))
sigma.model <- sapply(splits, calculate.sigma.model)
sigma.model <- as.data.frame(t(sigma.model))

# Write TAF tables
write.taf(cpue, dir="model")
write.taf(sigma.loess, dir="model")
write.taf(sigma.model, dir="model")
