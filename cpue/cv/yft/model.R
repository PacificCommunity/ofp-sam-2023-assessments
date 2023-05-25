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
  fm <- loess(log(obs)~time, cpue, subset=area==a, span=0.5)
  cpue$smooth[cpue$area==a] <- exp(predict(fm, cpue[cpue$area==a,]))
}

# Calculate sigma
splits <- split(cpue, cpue$area)
sigma.loess <- sapply(splits, calculate.sigma.loess)
sigma.loess <- as.data.frame(t(sigma.loess))
sigma.model <- sapply(splits, calculate.sigma.model)
sigma.model <- as.data.frame(t(sigma.model))

# Simulate
if(FALSE)
{
  plot.sim <- function(x, y, ysim, sigma)
  {
    plot(ysim~x, ylim=lim(c(y,ysim)), ann=FALSE, col="honeydew3")
    lines(y~x, col="darkgreen")
    par(new=TRUE)
    frame()
    sigma <- formatC(sigma, format="f", digits=3)
    text(0.95, 0.95, a, adj=1, font=2)
    text(0.95, 0.85, paste("simulated with =", sigma), adj=1)
  }
  taf.png("model/sim_loess.png")
  par(mfrow=c(3,3), plt=c(0.20,0.95,0.15,0.90))
  for(a in 1:9)
  {
    x <- cpue$time[cpue$area==a]
    y <- cpue$smooth[cpue$area==a]
    n <- length(y)
    sigma <- sigma.loess[[a]]
    ysim <- y * exp(rnorm(n, s=sigma))
    plot.sim(x, y, ysim, sigma)
  }
  dev.off()
}

# Write TAF tables
write.taf(cpue, dir="model")
write.taf(sigma.loess, dir="model")
write.taf(sigma.model, dir="model")
