# Read Condor history
txt <- readLines("condor_history.dat")                      # history 2023-08-15

# Filter and format
txt <- trimws(txt)            # trim outer space
txt <- gsub("  +", " ", txt)  # trim inner space
txt <- grep("OWNER|arnim|jemeryd", txt, value=TRUE)         # arnim and jemeryd
txt <- grep(" X ", txt, invert=TRUE, value=TRUE)            # skip status x jobs
txt <- grep("condor_dagman", txt, invert=TRUE, value=TRUE)  # skip dagman tests
txt <- grep("12/[0-9]", txt, invert=TRUE, value=TRUE)       # skip pre-2023
txt <- grep("[Ss][Ww][Oo]", txt, invert=TRUE, value=TRUE)   # skip swordfish
txt <- grep("training", txt, invert=TRUE, value=TRUE)       # skip training
txt <- grep("matt_test", txt, invert=TRUE, value=TRUE)      # skip matt test
txt <- grep("school", txt, invert=TRUE, value=TRUE)         # skip mfcl school
txt <- grep(".bat$", txt, invert=TRUE, value=TRUE)          # skip bat scripts
txt <- grep(".R$", txt, invert=TRUE, value=TRUE)            # skip r scripts
txt <- grep("start_package", txt, invert=TRUE, value=TRUE)  # skip package devel
txt[1] <- "job owner day1 time1 runtime status day2 time2 cmd"  # column names

# Export filtered and formatted history
writeLines(txt, "model_runs.dat")

# Read filtered and formatted history
x <- read.table("model_runs.dat", header=TRUE)
x$status <- x$cmd <- NULL  # drop irrelevant columns

# Parse runtime
splits <- strsplit(x$runtime, "\\+")  # separate days from time
days <- sapply(splits, "[", 1)        # days string
days <- as.integer(days)              # days integer
hms <- sapply(splits, "[", 2)         # hms string
posix <- paste("1970-01-01", hms)     # construct POSIX string
posix <- as.POSIXct(posix, tz="UTC")  # convert to POSIX object
sec <- as.numeric(posix)              # convert to seconds
hrs <- 24*days + sec/3600             # convert to hours
x$hrs <- hrs

# Parse submission time
splits <- strsplit(x$day1, "/")                          # separate month/day
month <- sapply(splits, "[", 1)                          # month string
day <- sapply(splits, "[", 2)                            # day string
month <- formatC(as.integer(month), width=2, flag="0")   # month with zero
day <- formatC(as.integer(day), width=2, flag="0")       # day with zero
posix <- paste0("2023-", month, "-", day, " ", x$time1)  # construct string
submit <- as.POSIXct(posix, tz="UTC")                    # convert to POSIX
x$submit <- submit

# Add and remove columns
x$species <- ifelse(x$owner=="arnim", "yft", "bet")
x$day1 <- x$time1 <- x$runtime <- x$day2 <- x$time2 <- NULL

# Summary table
tab <- data.frame(Species=c("BET", "YFT", "Total"))
tab$Runs <- c(tapply(x$hrs, x$species, length), length(x$hrs))
tab$Hours <- c(tapply(x$hrs, x$species, sum), sum(x$hrs))
tab$"Hrs/Run" <- tab$Hours / tab$Runs
tab$Years <- tab$Hours / 24 / 365.25

# Round numbers
tab$Hours <- round(tab$Hours)
tab$"Hrs/Run" <- round(tab$"Hrs/Run", 1)
tab$Years <- round(tab$Years, 1)
write.csv(tab, "model_runs.csv", quote=FALSE, row.names=FALSE)

# Plot model runs by month and time of day
pdf("model_runs.pdf")
par(mfrow=c(2, 1))
barplot(table(x$species, format(x$submit, "%m")), xlab="Month",
        legend=TRUE, args.legend=list(x="topleft", bty="n"))
barplot(table(x$species, format(x$submit, "%H")), xlab="Time of day (hrs)",
        legend=TRUE, args.legend=list(x="topleft", bty="n"))
dev.off()
