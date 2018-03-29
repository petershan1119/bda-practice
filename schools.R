#setwd('/Users/sangwonhan/statistics/bda')
library(rstan)
schools <- read.csv('schools.csv', header=TRUE)
J <- nrow(schools)
y <- schools$estimate
sigma <- schools$sd

schools_fit <- stan(file="schools.stan", data=c("J", "y", "sigma"), iter=1000, chains=4)
print(schools_fit)
plot(schools_fit)

print(schools_fit, 'theta[1]', probs=c(0.025, 0.975))

schools_fit1 <- stan(fit=schools_fit, data=c('J', 'y', 'sigma'), iter=2000, chains=4)
schools_sim <- extract(schools_fit1)

hist(schools_sim$tau)

mean(schools_sim$theta[,1] > schools_sim$thata[,3])

n_sims <- length(schools_sim$lp__)
y_rep <- array(NA, 