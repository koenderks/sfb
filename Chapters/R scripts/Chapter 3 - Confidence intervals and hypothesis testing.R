## Statistics for Business with Applications in R and RStudio
##
## Chapter 3: Confidence intervals and hypothesis testing

## 3.3a ######################

# Make sure to set your working directory first!
dataset5 <- read.csv("populations.csv")

## 3.3b ######################

set.seed(54321) # You can replace 54321 with your own seed number
sample1 <- sample(dataset5$P1, size = 90)       # Randomly selects 90 observations from population P1
sample2 <- sample(dataset5$P2, size = 90)       # Randomly selects 90 observations from population P2
sample3 <- sample(dataset5$P3, size = 90)       # Randomly selects 90 observations from population P3
sample4 <- sample(dataset5$P4, size = 90)       # Randomly selects 90 observations from population P4

## 3.3c ######################

# Means for sample 1 to 4
x1 <- mean(sample1) # 456.78
x2 <- mean(sample2) # 511.02
x3 <- mean(sample3) # 790.32
x4 <- mean(sample4) # 533.37

# Standard deviations for samples 1 to 4
sd1 <- sd(sample1) # 277.38
sd2 <- sd(sample2) # 72.43
sd3 <- sd(sample3) # 290.46
sd4 <- sd(sample4) # 171.58

# Standard errors for samples 1 to 4 [se = sd / sqrt(n)]
se1 <- sd1 / sqrt(length(sample1))              # Standard error: 29.24
se2 <- sd2 / sqrt(length(sample2))              # Standard error: 7.64
se3 <- sd3 / sqrt(length(sample3))              # Standard error: 30.61
se4 <- sd4 / sqrt(length(sample4))              # Standard error: 18.09

## 3.3d ######################

# Gives the one-sided right-tailed probability (z-value) for 95% confidence
qnorm(p = 0.95) # 1.645

## 3.3e ######################

z <- qnorm(p = 0.975)

## 3.3f ######################

# Lower bounds
lb1 <- x1 - z * se1 # 399.48
lb2 <- x2 - z * se2 # 496. 06
lb3 <- x3 - z * se3 # 730.31
lb4 <- x4 - z * se4 # 497.92

# Upper bounds
ub1 <- x1 + z * se1 # 514.10
ub2 <- x2 + z * se2 # 525.99
ub3 <- x3 + z * se3 # 850.33
ub4 <- x4 + z * se4 # 568.81

## 3.3g ######################

# Population means
mu1 <- mean(dataset5$P1) # 495.54
mu2 <- mean(dataset5$P2) # 500.08
mu3 <- mean(dataset5$P3) # 748.96
mu4 <- mean(dataset5$P4) # 556.43

## 3.3h ######################

# Are the means inside our intervals?
lb1 < mu1 & mu1 < ub1           # Yes
lb2 < mu2 & mu2 < ub2           # Yes
lb3 < mu3 & mu3 < ub3           # Yes
lb4 < mu4 & mu4 < ub4           # Yes

## 3.4a ######################

# install.packages('car')
library(car)

layout(matrix(c(1, 2,           # Create a 2x2 layout for the histograms
                3, 4), 
              byrow = TRUE,
              nrow = 2))

hist(sample1, col = "gray")
hist(sample2, col = "gray")
hist(sample3, col = "gray")
hist(sample4, col = "gray")

layout(1)                       # Reset the layout to the default

## 3.4c ######################

layout(matrix(c(1, 2,           # Create a 2x2 layout for the qqPlots
                3, 4), nrow = 2))

qqPlot(sample1, distribution = "norm") # qqPlot for sample 1
qqPlot(sample2, distribution = "norm") # qqPlot for sample 2
qqPlot(sample3, distribution = "norm") # qqPlot for sample 3
qqPlot(sample4, distribution = "norm") # qqPlot for sample 4

layout(1)                       # Reset the layout to the default

## 3.4f ######################

shapiro.test(sample1) # Normality test for sample 1
shapiro.test(sample2) # Normality test for sample 2
shapiro.test(sample3) # Normality test for sample 3
shapiro.test(sample4) # Normality test for sample 4

## 3.5a ######################

library(car)
data(iris)

plot(x = iris$Species, y = iris$Sepal.Length,
     col = "grey", main = "Sepal Length")

## 3.5d ######################

# Levene's Test for Homogeneity of Variance
leveneTest(y = iris$Sepal.Width, 
           group = iris$Species)
