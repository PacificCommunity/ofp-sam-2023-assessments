sigma.cpue <- function(x)
{
  obs <- x$obs[!is.na(x$obs)]
  fit <- x$fit[!is.na(x$obs)]
  rss <- sum((log(fit) - log(obs))^2)
  sigma <- rss / length(obs)
  sigma
}
