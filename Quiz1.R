# Question 1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
# Give the value of μ that minimizes the least squares equation 
# ∑wi(xi−μ)2

# the value corresponding to the mean minimizes the function
sum(x*w)/sum(w)

# Question 2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

# Fit the regression through the origin and get the slope treating y 
# as the outcome and x as the regressor.

# add -1 to the regression formula to fit through the origin
lm(y~x -1)

# Question 3
# Do data(mtcars) from the datasets package and fit the regression 
# model with mpg as the outcome and weight as the predictor. Give 
# the slope coefficient.

data(mtcars)
cars_model <- lm(mpg~wt, data=mtcars)
cars_model$coefficients[2]

# Question 4
# Consider data with an outcome (Y) and a predictor (X). The 
# standard deviation of the predictor is one half that of the 
# outcome. The correlation between the two variables is .5. What 
# value would the slope coefficient for the regression model with 
# Y as the outcome and X as the predictor?

# cov(x,y)=cor(x,y)*s(x)*s(y)
# cor(x,y)=.05
# s(x)=0.5s(y)
# slope: cov(x,y)/(s(x)^2)=2*cor(x,y)*(s(x)^2)/s(x)^2)=0.25

# Question 5
# Students were given two hard tests and scores were normalized 
# to have empirical mean 0 and variance 1. The correlation between 
# the scores on the two tests was 0.4. What would be the expected 
# score on Quiz 2 for a student who had a normalized score of 1.5 
# on Quiz 1?

1.5*0.4

# Question 6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
# What is the value of the first measurement if x were normalized 
x_nor <- (x-mean(x))/(sd(x))
x_nor[1]

# Question 7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
# What is the intercept for fitting the model with x as the 
# predictor and y as the outcome?

lm(y~x)$coefficients

# Question 9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
# What value minimizes the sum of the squared distances between 
# these points and itself?

# the value that minimizes the squared distances should be the mean
mean(x)

# Question 10





