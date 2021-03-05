## Statistics for Business with Applications in R and RStudio
##
## Chapter 4: Testing a linear relationship

## 4.3a ######################

# Make sure to set your working directory first!
dataset6 <- read.csv("localSupermarket.csv")

## 4.3b ######################

cov(dataset6$Distance, dataset6$AvgVisits)  # Covariance   -0.3000603
cor(dataset6$Distance, dataset6$AvgVisits)  # Correlation: -0.3000382

## 4.3c ######################

cor.test(dataset6$Distance, dataset6$AvgVisits, alternative = "less")
# Correlation: -0.30
# t-value: -9.936
# p-value: < 2.2e-16

## 4.3d ######################

curve(dnorm(x, mean = 0, sd = 1), from = -3, to = 3, ylab = 'Density')
curve(dt(x, df = 3), from = -3, to = 3, add = TRUE, col = 'red')

## 4.3e ###################### 

n <- nrow(dataset6)
dft <- n - 2

r <- cor(dataset6$Distance, dataset6$AvgVisits)
tscore <- r * sqrt(n - 2) / sqrt(1 - r^2)   
# t-score: -9.936 so you can confirm 4.3c

## 4.4a ######################

dataset7 <- read.csv("nationalSupermarket.csv")

## 4.4b ######################

plot(x = dataset7$Price,
     y = dataset7$AvgWasted,
     main = "Scatter plot of Price vs. AvgWasted",
     ylab = "Average number of cartons wasted",
     xlab = "Price of a carton of milk",
     las = 1,
     col = "orange",
     pch = 19,
     bty = "n")

## 4.4d ######################

lmfit <- lm(formula = AvgWasted ~ Price, data = dataset7)
summary(lmfit)
# b0 = 0.399
# b1 = 0.214
# R-squared: 0.64

## 4.4f ######################

abline(lmfit)

## 4.5a ######################

newdata <- data.frame(Price = 0.70)

## 4.5b ######################

predict(object = lmfit, 
        newdata = newdata) # Prediction: 2.33

## 4.5d ######################

predict(object = lmfit, 
        newdata = newdata,
        interval = "prediction", level = 0.90) 
# Lower bound: 0.424
# Upper bound: 4.240
