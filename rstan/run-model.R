library(rstan)

d <- read.csv(file ="~/R/rstan/chapter/")
data <- list(N = nrow(d), X = d$X, Y = d$Y)
fit <- stan(file = "~/R/rstan/chapter/.stan", data = data, seed = 1234)

save.image(file = "~/R/rstan/chapter4/result-.RData")