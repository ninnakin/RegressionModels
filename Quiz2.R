# Question 1
# Give a P-value for the two sided hypothesis test of whether 
# β1 from a linear regression model is 0 or not.
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

fit <- lm(y~x)
summary(fit)$coef

# Question 2
# Consider the previous problem, give the estimate of the residual 
# standard deviation.
summary(fit)

# Question 3
# In the mtcars data set, fit a linear regression model of weight 
# (predictor) on mpg (outcome). Get a 95% confidence interval for 
# the expected mpg at the average weight. What is the lower endpoint?
data(mtcars)

fit <- lm(data=mtcars, mpg~wt)
wt_avg <- as.data.frame(mean(mtcars$wt))
names(wt_avg) <- 'wt'

plot(mtcars$wt, mtcars$mpg, pch=19, col='grey')
lines(mtcars$wt, predict(fit), lwd=2)
points(wt_avg, predict(fit, wt_avg), pch=19, col='red')

predict(fit, wt_avg, interval="confidence")

# Question 4
# Refer to the previous question. Read the help file for 
# mtcars. What is the weight coefficient interpreted as?

?mtcars

# Question 5
# A new car is coming weighing 3000 pounds. Construct a 95% 
# prediction interval for its mpg. What is the upper endpoint?

wt_new <- as.data.frame(3000/1000)
names(wt_new)<-'wt'

points(wt_new, predict(fit, wt_new), pch=19, col='blue')

predict(fit, wt_new, interval="predict")

# Question 6
# A “short” ton is defined as 2,000 lbs. Construct a 95% 
# confidence interval for the expected change in mpg per 1 
# short ton increase in weight. Give the lower endpoint.

# wt is given in 1000 lbs, so if I divide int by 2 I get 
# weight in short tons
fit <- lm(data=mtcars, mpg~I(wt/2))
summary(fit)
# 95% confidence interval = estimate +- 2 standard errors 
# For lower endpoint:
summary(fit)$coef[2,1]-2*summary(fit)$coef[2,2]


# Question 9
# About what is the ratio of the the sum of the squared errors,
# when comparing a model with just an intercept (denominator) 
# to the model with the intercept and slope (numerator)?

fit0 <- lm(data=mtcars, mpg~1)
fit1 <- lm(data=mtcars, mpg~wt)

sqe0 <- sum((mtcars$mpg-predict(fit0))^2)
sqe1 <- sum((mtcars$mpg-predict(fit1))^2)

sqe0/sqe1






