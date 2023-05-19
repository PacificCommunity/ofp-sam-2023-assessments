library(TAF)

mkdir("png")

# Import otolith data
bet.dir <- "//penguin/assessments/bet/2023/data_preparation/growth"
yft.dir <- "//penguin/assessments/yft/2023/data_preparation/growth"
bet <- read.csv(file.path(bet.dir, "output/otoliths.csv"))
yft <- read.csv(file.path(yft.dir, "analysis/data/otoliths.csv"))

# Construct lists
oto <- list(bet=bet$age.yr, yft=yft$Age)
int <- lapply(oto, round)

# Boxplot
png("png/otolith_ages_boxplot.png", width=1200, height=2400, res=300)
boxplot(oto, col=c("royalblue", "gold"), ylab="Age (yr)", main="Otoliths")
dev.off()

# Range
sapply(oto, range)

# Quantiles
probs <- c(0, 0.01, 0.05, 0.1, 0.2, 0.25, 0.5, 0.75, 0.8, 0.9, 0.95, 0.99, 1)
quants <- sapply(oto, quantile, probs=probs)
quants <- quants[rev(rownames(quants)),]

# Number of otoliths at age
nbet <- c(table(int$bet))
nbet <- nbet[as.character(4:11)]
pbet <- nbet / max(nbet)
nyft <- c(table(int$yft))
nyft <- nyft[as.character(4:11)]
pyft <- nyft / max(nyft)
opar <- par(mfrow=c(1,2))
barplot(nbet, col="royalblue", xlab="Age (yr)", ylab="Frequency",
        main="BET otoliths")
barplot(nyft, col="gold", xlab="Age (yr)", ylab="Frequency",
        main="YFT otoliths")
par(opar)

# Decay rate (BET)
nratio.bet <- nbet[-1] / nbet[-length(nbet)]
zbet <- -log(nratio.bet)
barplot(zbet)
zbet <- zbet[as.character(5:9)]
barplot(zbet)
abline(h=median(zbet))
median(zbet)
median(zbet) / 4

# Decay rate (YFT)
nratio.yft <- nyft[-1] / nyft[-length(nyft)]
zyft <- -log(nratio.yft)
barplot(zyft)
zyft <- zyft[as.character(4:9)]
barplot(zyft)
abline(h=median(zyft))
median(zyft)
median(zyft) / 4

# Write table
quants.rounded <- round(quants, 1)
quants.rounded <- xtab2taf(quants, "Percentile")
