## Calculate 6-region sigmas and flag values

## Before: sigma_model.csv (output)
## After:  mfcl_six.csv, sigma_six.csv (report)

library(TAF)
source("utilities.R")  # convert.cv

mkdir("report")

# Read sigma and MFCL flag values
sigma <- read.taf("output/sigma_model.csv")

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
9    6
", header=TRUE)

# Calculate average sigma
sigma.six <- data.frame(map, sigma=unlist(sigma))
sigma.six <- aggregate(sigma~new, sigma.six, mean)
names(sigma.six) <- c("region", "sigma")

# Convert to MFCL flag values
mfcl.six <- data.frame(region=1:6, value=convert.cv(sigma.six$sigma))

# Write TAF tables
write.taf(sigma.six, dir="report")
write.taf(mfcl.six, dir="report")
