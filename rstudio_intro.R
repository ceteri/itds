require(graphics)
 
## load and view Iris data set
data(iris)
head(iris)
 
## show summary stats for one variable
summary(iris$Petal.Length)
 
## generate scatterplot
plot(iris$Petal.Length, iris$Petal.Width)
 
## fit a line using linear regression
fit <- lm(iris$Petal.Width ~ iris$Petal.Length)
fit
 
## confidence interval
ci <- confint(fit)
ci
 
## scatterplot with color, legend, abline
cols <- rainbow(3)[iris$Species]
plot(iris$Petal.Length, iris$Petal.Width, col=cols)
legend("topleft", levels(iris$Species), fill=rainbow(3))
 
abline(fit, col="black")
abline(ci[1, 2], ci[2, 2], col="gray")
abline(ci[1, 1], ci[2, 1], col="gray")
 
## scatterplot matrix
library(car) 
spm(~iris$Sepal.Length + iris$Sepal.Width + iris$Petal.Length + iris$Petal.Width | iris$Species)
 
## boxplot
boxplot(iris)
