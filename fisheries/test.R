library(FLR4MFCL)

frq <- read.MFCLFrq("//penguin/assessments/yft/2020/assessment/ModelRuns/Diagnostic/yft.frq")
frq <- freq(frq)                 # 838,126 rows
frq <- frq[!is.na(frq$length),]  # 125,685 rows
table(frq$fishery)



yft <- read.MFCLFrq("//penguin/assessments/yft/2020/assessment/ModelRuns/Diagnostic/yft.frq")
test <- subset(freq(yft), fishery==9)
dim(test)
dim(yft)

x <- freq(yft)
x <- x[!is.na(x$length),]
table(x$fishery)
