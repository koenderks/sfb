## Statistics for Business with Applications in R and RStudio
##
## Chapter 1: Descriptive statistics

## 1.2a ######################

dataset1 <- c(2, 7, 4, 5, 8, 10, 10, 7, 9, 2, 8, 8, 9, 4, 6)
View(dataset1)

## 1.2b ######################

mean(dataset1)    # Mean: 6.6
table(dataset1)   # Mode: 8 is the most occurring number (3 times)
median(dataset1)  # Median: 7
range(dataset1)   # Range: 2 to 10 = 8


## 1.2c ######################

quantile(dataset1, type = 6)
# Minimum:        2
# First quartile: 4
# Median:         7
# Third quartile: 9
# Maximum:        10

## 1.2d ######################

dataset2 <- c(7, 7, 6, 5, 2, 1, 3, 7, 5, 9, 9, 10)

mean(dataset2)    # Mean: 5.91 
table(dataset2)   # Mode: 7 is the most occurring number (3 times)
median(dataset2)  # Median: 6.5
range(dataset2)   # Range: 1 to 10 = 9

## 1.3 ######################

dataset3 <- read.csv(file.choose())

## 1.3b ## ####################

dataset3 <- read.csv("bloodPressure.csv")

## 1.3c ###################### 

mean(dataset3$Age)   # Mean: 45.15
table(dataset3$Age)  # Mode: 39 is the most occurring number (4 times)
median(dataset3$Age) # Median: 46
range(dataset3$Age)  # Range: 17 to 69 = 52

quantile(dataset3$Age, type = 6)
# Minimum:        17
# Lower quartile: 34.5
# Median:         46
# Upper quartile: 58.5
# Maximum:        69

## Create the new function for finding the mode:

getMode <- function(x){
  uniqx <- unique(x)
  uniqx[which.max(tabulate(match(x, uniqx)))]
}

## 1.3d ######################

getMode(dataset3$Age) # Mode: 39

## 1.3e ######################

mean(dataset3$BloodPressure)    # Mean: 130.62 
getMode(dataset3$BloodPressure) # Mode: 129
median(dataset3$BloodPressure)  # Median: 131.5 
range(dataset3$BloodPressure)   # Range: 45 to 166

quantile(dataset3$BloodPressure, type = 6)
# Minimum:          45
# Lower  quartile:  118.75
# Median:           131.5
# Upper  quartile:  145.75
# Maximum:          166

## 1.3g ######################

var(dataset3$Cholestrol)    # Variance: 1.059
sd(dataset3$Cholestrol)     # Standard deviation: 1.029

## 1.3h ######################

# The standard deviation is the square root of the variance.
sd(dataset3$Cholestrol) == sqrt(var(dataset3$Cholestrol)) 
