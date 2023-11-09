# Calculate sigma for CPUE using maximum likelihood

get_sigma <- function(x)
{
  obs <- x$obs
  fit <- x$fit
  rss <- sum((log(fit) - log(obs))^2)
  sigma <- sqrt(rss / length(obs))
  sigma
}

cpue <- read.csv("cpue.csv")
plot(obs~year, cpue, ylim=c(0,1))
lines(fit~year, cpue)

get_sigma(cpue)
