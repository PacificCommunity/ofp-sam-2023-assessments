library(FLR4MFCL)

dir.create("output", showWarnings=FALSE)

# Read files
rep <- read.MFCLRep("data/yft/plot-14.par.rep")
frq <- read.MFCLFrq("data/yft/yft.frq")
fdesc <- read.table("data/yft/fdesc.txt", header=TRUE)

# Extract length frequencies
frq <- freq(frq)
frq <- aggregate(freq~length+fishery, frq, sum)
names(frq)[names(frq)=="fishery"] <- "fishery.id"

# Rename fishery columns
names(fdesc)[names(fdesc)=="num"] <- "fishery.id"
names(fdesc)[names(fdesc)=="code"] <- "fishery"

# Merge length frequencies and fishery descriptions
frq <- merge(frq, fdesc)
frq <- frq[c("fishery.id", "fishery", "region", "length", "freq")]

# Write table
write.csv(frq, "output/yft_frq.csv", row.names=FALSE, quote=FALSE)
