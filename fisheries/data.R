## Preprocess data, write TAF data tables

## Before: fdesc.txt, yft.frq (boot/data)
## After:  fdesc.csv, frq_yft.csv (data)

library(TAF)
suppressMessages(library(FLR4MFCL))

mkdir("data")

# Read files
frq.yft <- read.MFCLFrq("boot/data/yft.frq")
fdesc <- read.table("boot/data/fdesc.txt", header=TRUE)

# Extract length frequencies
frq.yft <- freq(frq.yft)
frq.yft <- aggregate(freq~length+fishery, frq.yft, sum)
names(frq.yft)[names(frq.yft)=="fishery"] <- "fishery.id"

# Rename fishery columns
names(fdesc)[names(fdesc)=="num"] <- "fishery.id"
names(fdesc)[names(fdesc)=="code"] <- "fishery"

# Write TAF tables
write.taf(frq.yft, dir="data")
write.taf(fdesc, dir="data")
