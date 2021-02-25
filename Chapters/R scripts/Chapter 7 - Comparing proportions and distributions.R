## Statistics for Business with Applications in R and RStudio
##
## Chapter 7: Comparing proportions and distributions

## 7.1g ######################

Observed <- c(29, 45, 49.4, 32.8)
Historical <- c(0.39, 0.25, 0.13, 0.23)
Expected <- c(60.918, 39.05, 20.306, 35.926)

chi <- sum((Observed - Expected)^2 / Expected) # 59.587

## 7.1h ######################

qchisq(p = 0.95, df = 3) # 7.185

## 7.1i ######################

# Chi-squared test: x = observations p = model distribution
# rescale makes sure the model distribution adds up to 100%
chisq.test(x = Observed, p = Historical, rescale.p = TRUE)

# Chi-squared value: 59.587
# p-value: 7.201e-13

## 7.1j ######################

chisq <- chisq.test(x = Observed, p = Historical)
chisq$expected   # Extract expected values with $expected

## 7.2a ######################

# These are the values for the sales dataset
sales <- data.frame(month = seq(from = 1, to = 12, by = 1),
                    historical = c(5.1, 5.1, 6.7, 10, 11.4, 10,
                                   6.7, 5.1, 6.7, 10, 11.7, 11.7),
                    newstore = c(5.6, 6.2, 9.4, 8.6, 6.8, 4.8,
                                 5.6, 4.8, 8.8, 12.6, 13.1, 13.7))

summary(sales)

## 7.2b ######################

# Create a barplot
barplot(t(matrix(c(sales$historical, sales$newstore), ncol = 2)),
        beside = T, names.arg = sales$month, las = 1, xlab = 'Month',
        ylab = 'Percentage of yearly sales',
        main = 'Seasonal sales',
        col = c('aquamarine3','coral'))
# Add a legend
legend('topleft', bty = 'n',
       legend = c('Historical', 'New store'),
       fill = c('aquamarine3','coral'))

chisq.test(x = sales$newstore, p = sales$historical, rescale.p = TRUE)
# p-value: 
## 7.3h ######################

n <- c(71, 111)
k <- c(8, 16)
prop.test(x = k, n = n)
# p-value: 0.6984