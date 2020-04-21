## Statistics for Business with Applications in R and RStudio
##
## Chapter 2: Creating graphs from data

## 2.2a ######################

dataset4 <- c(1.5, 5.5, 1.7, 7.2, 1.2, 7.9, 1.4, 3.6, 
              3.1, 3.8, 5.9, 3.6, 5.1, 3.2, 7.1)
hist(dataset4)

## 2.2c ######################

# The breaks argument determines the number of bars in the histogram
# see ?hist for more help on the hist() function
hist(dataset4, breaks = 4)

## 2.2 d ######################

hist(dataset4, breaks = 4, col = "blue",  # col sets the color of the bars
     xlab = "x-axis",                     # xlab sets the x-axis name
     ylab = "Count",                      # ylab sets the y-axis name
     main = "My histogram")               # main sets the title of the histogram

## 2.2e ######################

mean(dataset4)    # Mean: 4.12
median(dataset4)  # Median: 3.6

## 2.3a ######################

data(swiss)       # Import the swiss data

education   <- swiss$Education
agriculture <- swiss$Agriculture

## 2.3b ###################### 

plot(x = education, y = agriculture,
     xlab = "Percentage of education beyond primary school",
     ylab = "Percentage of males involved in agriculture")

## 2.3d ###################### 

plot(x = education, y = agriculture,
     xlab = "Percentage of education beyond primary school",
     ylab = "Percentage of males involved in agriculture",
     col = "blue",
     main = "Statistics of Switzerland",
     las = 1,                              # las sets the rotation of the y-axis labels
     bty = "n")                            # bty = "n" removes the outer lines of the plot

## 2.4a ######################

data(EuStockMarkets)
stockData <- data.frame(EuStockMarkets)

plot(stockData$DAX, 
     type = 'l',         # type = 'l' creates lines instead of dots
     xlab = 'Time',
     ylab = 'Price')

## 2.4b ###################### 

lines(stockData$SMI, col = "red")    # Add a line for the SMI stock
lines(stockData$CAC, col = "blue")   # Add a line for the CAC stock
lines(stockData$FTSE, col = "green") # Add a line for the FTSE stock

## 2.5a ######################

quantile(agriculture, type = 6)
# Minimum:        1.2
# First quartile: 35.3
# Median:         54.1
# Third quartile: 67.8
# Maximum:        89.7

## 2.5b ######################

boxplot(agriculture)

## 2.5c ######################

educationLevel <- rep('2.Medium', 47)
educationLevel[education <= 6] = '1.Low'
educationLevel[education >= 12] = '3.High'
table(educationLevel)

## 2.5d ######################

boxplot(agriculture ~ educationLevel)
