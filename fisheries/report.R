## Prepare plots and tables for report

## Before: frq_yft.csv (output)
## After:  frq_yft.pdf (report)

library(TAF)

mkdir("report")

frq.yft <- read.taf("output/frq_yft.csv")

fisheries <- unique(frq.yft$fishery)

pdf("report/frq_yft.pdf", width=1920/120, height=1080/120)
par(mfrow=c(5,4))
for(f in fisheries)
  barplot(freq~length, data=frq.yft, subset=fishery==f, main=f)
dev.off()
