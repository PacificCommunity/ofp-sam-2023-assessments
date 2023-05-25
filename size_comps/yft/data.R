## Preprocess data, write TAF data tables

## Before: length.fit (boot/data)
## After:  lenfits.csv, scape.csv (data)

library(TAF)
library(FLR4MFCL)

mkdir("data")

# Read MFCL length fit
fit <- read.MFCLLenFit2("boot/data/length.fit")

# Extract obs and fit
lenfits <- lenfits(fit)

# Convert to 'scape' format
scape <- lenfits
names(scape) <- c("Series", "Y", "M", "SS", "Length", "Obs", "Fit")
scape$Year <- paste(scape$Y, scape$M, sep=".")
scape$Sex <- "Unisex"
scape <- scape[c("Series", "Year", "SS", "Sex", "Length", "Obs", "Fit",
                 "Y", "M")]

# Write TAF tables
write.taf(lenfits, dir="data")
write.taf(scape, dir="data")
