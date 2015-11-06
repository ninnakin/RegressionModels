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

