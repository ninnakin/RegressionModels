# Question 1
# Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders 
# as a factor variable and weight as confounder. Give the adjusted estimate for the expected change 
# in mpg comparing 8 cylinders to 4.

data(mtcars)
fit <- lm(mpg~as.factor(cyl)+wt,data=mtcars)

# Question 2
# Compare the effect of 8 versus 4 cylinders on mpg for the adjusted and unadjusted by weight models. 
# Here, adjusted means including the weight variable as a term in the regression model and unadjusted 
# means the model without weight included. What can be said about the effect comparing 8 and 4 cylinders 
# after looking at models with and without weight included?.

fit_ad <- lm(mpg~as.factor(cyl)+wt,data=mtcars)
fit_notad <- lm(mpg~as.factor(cyl),data=mtcars)
summary(fit_ad)
summary(fit_notad)

# Question 3
# Fit a model with mpg as the outcome that considers number of cylinders as a factor variable and 
# weight as confounder. Now fit a second model with mpg as the outcome model that considers the 
# interaction between number of cylinders (as a factor variable) and weight. Give the P-value for the 
# likelihood ratio test comparing the two models and suggest a model using 0.05 as a type I error rate 
# significance benchmark.

fit_ad <- lm(mpg~as.factor(cyl)+wt,data=mtcars)
fit_int <- lm(mpg~as.factor(cyl)*wt,data=mtcars)
anova(fit_ad,fit_int)

# Question 5
# Give the hat diagonal for the most influential point
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit <- lm(y~x)
plot(x, y, pch=19)
points(x,predict(fit), type="l")

hatvalues(fit)

# Question 6
# Give the slope dfbeta for the point with the highest hat value.
dfbetas(fit)


