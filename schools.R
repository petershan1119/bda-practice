#setwd('/Users/sangwonhan/statistics/bda')
schools <- read.csv('schools.csv', header=TRUE)
J <- nrow(schools)
y <- schools$estimate
sigma <- schools$sd

schools_fit <- stan(file="schools.stan", data=c("J", "y", "sigma"), iter=1000, chains=4)
print(schools_fit)
plot(schools_fit)

print(schools_fit, 'theta[1]', probs=c(0.025, 0.975))

schools_sim <- extract(schools_fit1)