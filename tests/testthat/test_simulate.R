library(corncob)
context("Test simulation")

set.seed(1)
seq_depth <- rpois(20, lambda = 10000)
my_counts <- rbinom(20, size = seq_depth, prob = 0.001) * 10
my_covariate <- cbind(rep(c(0,1), each = 10))
colnames(my_covariate) <- c("X1")

test_data <- data.frame("W" = my_counts, "M" = seq_depth, my_covariate)

out <- bbdml(formula = cbind(W, M - W) ~ X1,
             phi.formula = ~ X1,
             data = test_data,
             link = "logit",
             phi.link = "logit",
             nstart = 1)

test_that("Simulation works", {
  expect_is(simulate(out, nsim = 10, seed = 1), "numeric")
})
