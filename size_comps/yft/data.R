## Preprocess data, write TAF data tables

## Before: length.fit (boot/data)
## After:  lenfits.csv (data)

library(TAF)
library(FLR4MFCL)

mkdir("data")

# Read MFCL length fit
fit <- read.MFCLLenFit2("boot/data/length.fit")

# Extract obs and fit
lenfits <- lenfits(fit)

# Examine data frame
lenfits <- type.convert(lenfits, as.is=TRUE)
dim(lenfits)  # 125,685 rows and 7 cols
head(lenfits)
#   fishery year month sample_size length obs   pred
# 1      13 1988     5     769.306     10   0 0.0000
# 2      13 1988     5     769.306     12   0 0.0000
# 3      13 1988     5     769.306     14   0 0.0002
sort(unique(lenfits$fishery))
# 13 14 15 16 17 18 19 20 21 22 23 24 25 26 28 30 31 32
range(lenfits$year)  # 1965 2018
sum(lenfits$obs)   # 1323
sum(lenfits$pred)  # 1323
round(aggregate(obs~fishery, lenfits, sum), 1)
#    fishery obs
# 1       13 118
# 2       14 113
# 3       15 111
# 4       16  94
# 5       17  95
# 6       18  92
# 7       19  62
# 8       20  98
# 9       21  67
# 10      22  61
# 11      23  41
# 12      24  87
# 13      25 101
# 14      26  93
# 15      28  42
# 16      30  15
# 17      31  11
# 18      32  22

# Experiment with fishery 31 which has the smallest number of samples
x <- lenfits[lenfits$fishery==31,]
rownames(x) <- NULL
dim(x)  # 1045, 7
table(x$month, x$year)
#   1989 1991 1999 2003 2014 2016 2017 2018
# 2    0    0    0    0    0    0   95    0
# 5    0   95   95    0   95    0   95   95
# 8   95    0    0   95    0   95   95   95
length(unique(paste(x$year, x$month, sep=".")))
barplot(obs~length, aggregate(obs~length, x, sum))

x$time <- paste(x$year, x$month, sep=".")

# Convert fishery 31 to 'scape' format
y <- x
names(y) <- c("Series", "Y", "M", "SS", "Length", "Obs", "Fit")
y$Year <- paste(y$Y, y$M, sep=".")
y$Sex <- "Unisex"
y <- y[c("Series", "Year", "SS", "Sex", "Length", "Obs", "Fit", "Y", "M")]
x.yft <- structure(list(CLc=y), class="scape")
x.yft2 <- structure(list(CLc=y[y$Length<170,]), class="scape")

# Plot
plotCL(x.yft)
plotCL(x.yft2)
plotCL(x.yft, lengths=seq(10,150,by=2), ylim=c(0,0.10))
plotCL(x.yft, log=TRUE)


# Calculate effective sample size
nscaled <- estN(x.yft, "CLc")
nfree <- estN(x.yft, "CLc", init=FALSE)
estN(x.yft2, "CLc", init=FALSE)
mean(estN(x.yft, "CLc"))
mean(estN(x.yft, "CLc", init=FALSE))

# SS
ss.20 <- round(with(aggregate(SS~Series+Year, x.yft$CLc, mean), tapply(SS, Series, median))/20)
ss.20 <- setNames(as.numeric(ss.20), dimnames(ss.20)[[1]])
ss.10 <- round(with(aggregate(SS~Series+Year, x.yft$CLc, mean), tapply(SS, Series, median))/10)
ss.10 <- setNames(as.numeric(ss.10), dimnames(ss.10)[[1]])
ss.scaled <- round(sapply(nscaled, median))
ss.free <- round(sapply(nfree, median))

median(ss.20)
# median(ss.10)
median(ss.scaled)
median(ss.free)
