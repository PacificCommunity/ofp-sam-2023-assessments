calculate.sigma.model <- function(x)
{
  obs <- x$obs[!is.na(x$obs)]
  fit <- x$fit[!is.na(x$obs)]
  rss <- sum((log(fit) - log(obs))^2)
  sigma <- sqrt(rss / length(obs))
  sigma
}

calculate.sigma.loess <- function(x)
{
  obs <- x$obs[!is.na(x$obs)]
  smooth <- x$smooth[!is.na(x$obs)]
  rss <- sum((log(smooth) - log(obs))^2)
  sigma <- sqrt(rss / length(obs))
  sigma
}

convert.cv <- function(sigma)
{
  penalty <- 1 / (2*sigma^2)
  flag.value <- round(10 * penalty)
  flag.value
}

convert.flag <- function(flag.value)
{
  penalty <- flag.value / 10
  sigma <- sqrt(1/(2*penalty))
  sigma
}

plot.cpue.loess <- function(x, sigma)
{
  plot(obs~time, data=x, ylim=lim(c(x$obs,x$smooth)), ann=FALSE, col="gray")
  lines(smooth~time, data=x)
  par(new=TRUE)
  frame()
  sigma <- formatC(sigma, format="f", digits=3)
  text(0.95, 0.95, x$area[1], adj=1, font=2)
  text(0.95, 0.85, paste("sigma =", sigma), adj=1)
}

plot.cpue.model <- function(x, sigma)
{
  plot(obs~time, data=x, ylim=lim(c(x$obs,x$fit)), ann=FALSE, col="gray")
  lines(fit~time, data=x)
  par(new=TRUE)
  frame()
  sigma <- formatC(sigma, format="f", digits=3)
  text(0.95, 0.95, x$area[1], adj=1, font=2)
  text(0.95, 0.85, paste("sigma =", sigma), adj=1)
}
