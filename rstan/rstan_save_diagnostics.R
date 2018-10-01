library(rstan)
library(ggmcmc)

load("~/R/rstan/chapter/.RData")

write.table(data.frame(summary(fit)$summary),
            file="~/R/rstan/chapter/fit-summary.txt", sep='\t', quote=FALSE, col.names=NA)

ggmcmc(ggs(fit, inc_warmup=TRUE, stan_include_auxiliar=TRUE),
       file="~/R/rstan/chapter/fit-traceplot.pdf", plot="traceplot")

ggmcmc(ggs(fit), file="~/R/rstan/chapter/fit-ggmcmc.pdf",
       plot=c("traceplot", "density", "running", "autocorrelation"))