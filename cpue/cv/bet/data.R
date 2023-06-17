## Preprocess data, write TAF data tables

## Before: plot-11.par.rep (boot/data)
## After:  cpue.csv (data)

library(TAF)
library(FLR4MFCL)

mkdir("data")

# Read MFCL results
rep <- read.MFCLRep("boot/data/plot-11.par.rep")

# Extract CPUE obs and fit
obs <- as.data.frame(cpue_obs(rep))
fit <- as.data.frame(cpue_pred(rep))
names(obs)[names(obs)=="data"] <- "obs"
names(fit)[names(fit)=="data"] <- "fit"

# Combine, filter, rename columns, calculate area, time and indices
cpue <- merge(obs, fit)
cpue <- type.convert(cpue, as.is=TRUE)
cpue <- cpue[cpue$unit %in% 33:41,]
cpue$area <- cpue$unit - 32L
cpue$age <- cpue$iter <- cpue$unit <- NULL
cpue$time <- cpue$year + (cpue$season-1) / 4
cpue$obs <- exp(cpue$obs)
cpue$fit <- exp(cpue$fit)
cpue <- cpue[c("year", "season", "time", "area", "obs", "fit")]

# Write TAF table
write.taf(cpue, dir="data")
