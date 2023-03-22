## Preprocess data, write TAF data tables

## Before: fdesc.txt, yft.frq (boot/data)
## After:  fdesc.csv, yft_frq.csv (data)

library(TAF)
library(FLR4MFCL)

mkdir("data")

# Read files
yft.frq <- read.MFCLFrq("boot/data/yft.frq")
fdesc <- read.table("boot/data/fdesc.txt", header=TRUE)

# Extract length frequencies
yft.frq <- freq(yft.frq)
yft.frq <- aggregate(freq~length+fishery, yft.frq, sum)
names(yft.frq)[names(yft.frq)=="fishery"] <- "fishery.id"

# Rename fishery columns
names(fdesc)[names(fdesc)=="num"] <- "fishery.id"
names(fdesc)[names(fdesc)=="code"] <- "fishery"

# Write TAF tables
write.taf(yft.frq, dir="data")
write.taf(fdesc, dir="data")
