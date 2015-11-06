data(mtcars)
library(ggplot2)
library(dplyr)
library(gridExtra)

# exploring effect of weight on mpg for automatic and manual cars
mtcars$am <- as.factor(mtcars$am)
a_cars <- filter(mtcars, am==0)
m_cars <- filter(mtcars, am==1)

# plot weight against mpg, add regression lines for all data and by a/m
#regressing on weight for a/m
fitall<-lm(mpg~wt, mtcars)
fit_a <-lm(mpg~wt, a_cars)
fit_m <-lm(mpg~wt, m_cars)

g<-ggplot(data=mtcars,aes(x=wt, y=mpg, color=as.factor(am)))+geom_point(size=3)
g <- g + geom_abline(intercept=summary(fitall)$coef[1,1], slope=summary(fitall)$coef[2,1], lwd=1)
#g <- g + geom_abline(intercept=summary(fit_a)$coef[1,1], slope=summary(fit_a)$coef[2,1], color="salmon")
#g <- g + geom_abline(intercept=summary(fit_m)$coef[1,1], slope=summary(fit_m)$coef[2,1], color="turquoise")
#g <- g + geom_hline(y=mean(a_cars$mpg), color="salmon")
#g <- g + geom_hline(y=mean(m_cars$mpg), color="turquoise")
#g <- g + geom_vline(x=mean(a_cars$wt), color="salmon")
#g <- g + geom_vline(x=mean(m_cars$wt), color="turquoise")
g

# boxplots
# yes, automatic cars are heavier
ggplot(data=mtcars, aes(x=am,y=wt, fill=am))+geom_boxplot()

# same data in histogram, shows only small overlap
ggplot(data=mtcars, aes(x=wt, fill=am))+geom_histogram(col=1)

# can we adjust for weight?
# look at residuals from fitall
mtcars$mpg_adjusted <-  summary(fitall)$residuals
g<-ggplot(data=mtcars,aes(x=wt, y=mpg_adjusted, color=as.factor(am)))+geom_point(size=3)

g1<-ggplot(data=mtcars, aes(x=am,y=mpg, fill=am))+geom_boxplot()+ggtitle("not adjusted for weight")
g2<-ggplot(data=mtcars, aes(x=am,y=mpg_adjusted, fill=am))+geom_boxplot()+ggtitle("adjusted for weight")
grid.arrange(g1, g2, ncol=2)

# new fit, using the mpg adjusted by weight
fit_new<-lm(mpg_adjusted~. -wt -mpg-adjusted, mtcars)
# only 1 significant variable (disp), and that one has only a small effect

