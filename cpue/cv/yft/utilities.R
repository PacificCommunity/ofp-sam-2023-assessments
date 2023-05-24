plot.cpue <- function(x)
{
  plot(obs~time, data=x, ylim=lim(c(x$obs,x$fit)), ann=FALSE, col="gray")
  lines(fit~time, data=x)
  par(new=TRUE)
  frame()
  sigma <- formatC(sigma.cpue(x), format="f", digits=3)
  text(0.95, 0.95, x$area[1], adj=1, font=2)
  text(0.95, 0.85, paste("sigma =", sigma), adj=1)
}

sigma.cpue <- function(x)
{
  obs <- x$obs[!is.na(x$obs)]
  fit <- x$fit[!is.na(x$obs)]
  rss <- sum((log(fit) - log(obs))^2)
  sigma <- rss / length(obs)
  sigma
}
