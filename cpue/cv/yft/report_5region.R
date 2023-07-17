## Calculate 5-region sigmas and flag values

## Before: mfcl_model.csv, sigma_model.csv (output)
## After:  mfcl_five.csv, sigma_five.csv (report)

library(TAF)
source("utilities.R")  # convert.cv

# Read sigma and MFCL flag values
sigma <- read.taf("output/sigma_model.csv")
mfcl <- read.taf("report/mfcl_model.csv")

# Map old regions to new
map <- read.table(text="
old  new
1    1
2    1
3    4
4    4
5    5
6    5
7    2
8    3
9    5
", header=TRUE)

# Calculate average sigma
sigma.five <- data.frame(map, sigma=unlist(sigma))
sigma.five <- aggregate(sigma~new, sigma.five, mean)
names(sigma.five) <- c("region", "sigma")

# Convert to MFCL flag values
mfcl.five <- data.frame(region=1:5, value=convert.cv(sigma.five$sigma))

# Alternatively, we could average the 9-region flag values
alt.five <- data.frame(map, value=unlist(mfcl))
alt.five <- aggregate(value~new, alt.five, function(x) round(mean(x)))
names(alt.five) <- c("region", "value")
# but we won't use that

# Write TAF tables
write.taf(sigma.five, dir="report")
write.taf(mfcl.five, dir="report")
