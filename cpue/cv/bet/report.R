## Prepare plots and tables for report

## Before: cpue.csv, sigma_loess.csv, sigma_model.csv (output)
## After:  cpue_loess.png, cpue_model.png, sigma.png (report)

library(TAF)
source("utilities.R")  # plot.cpue

mkdir("report")

# Read CPUE data and sigma
cpue <- read.taf("output/cpue.csv")
sigma.loess <- unlist(read.taf("output/sigma_loess.csv"))
sigma.model <- unlist(read.taf("output/sigma_model.csv"))

# Split by region
splits <- split(cpue, cpue$area)

# Plot obs and fit
taf.png("cpue_loess")
par(mfrow=c(3,3), plt=c(0.20,0.95,0.15,0.90))
invisible(mapply(plot.cpue.loess, splits, sigma.loess))
dev.off()
taf.png("cpue_model")
par(mfrow=c(3,3), plt=c(0.20,0.95,0.15,0.90))
invisible(mapply(plot.cpue.model, splits, sigma.model))
dev.off()

# Plot sigmas
taf.png("sigma")
par(mfrow=c(1,2))
barplot(sigma.model, ylim=lim(c(sigma.loess, sigma.model)),
        main="sigma (model fit)")
abline(h=median(sigma.model), lty=2, lwd=2, col=2)
barplot(sigma.loess, ylim=lim(c(sigma.loess, sigma.model)),
        main="sigma (loess fit)")
abline(h=median(sigma.loess), lty=2, lwd=2, col=2)
dev.off()
