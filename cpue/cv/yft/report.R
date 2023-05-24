## Prepare plots and tables for report

## Before: cpue.csv (data), sigma.csv (output)
## After:  cpue.png, sigma.csv, sigma.png (report)

library(TAF)
source("utilities.R")

mkdir("report")

# Read CPUE data and sigma
cpue <- read.taf("data/cpue.csv")
sigma <- read.taf("output/sigma.csv")

# Split by region
splits <- split(cpue, cpue$area)

# Plot obs and fit
taf.png("cpue")
par(mfrow=c(3,3), plt=c(0.20,0.95,0.15,0.90))
invisible(sapply(splits, plot.cpue))
dev.off()

# Plot sigmas
taf.png("sigma")
par(mfrow=c(1,1))
barplot(sigma~area, sigma)
abline(h=median(sigma$sigma), lty=2, lwd=2, col=2)
dev.off()

# Round sigmas
sigma <- round(sigma, 3)

# Write TAF table
write.taf(sigma, dir="report")
