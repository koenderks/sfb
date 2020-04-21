## Statistics for Business with Applications in R and RStudio
##
## Chapter 6: Comparing more than two means

## 6.1a ######################

# Make sure to set your working directory first!
dataset8 <- read.csv("eyeColor.csv")

ttestData <- subset(dataset8,
                    dataset8$Group == "Blue" |
                      dataset8$Group == "Brown")

## 6.1c ######################

blue <- subset(ttestData$Score, ttestData$Group == "Blue")
brown <- subset(ttestData$Score, ttestData$Group == "Brown")
t.test(blue, brown, var.equal = TRUE) # p-value: 0.1401

## 6.1e ######################

dummyBrown <- as.numeric(ttestData$Group == 'Brown')    # Contains a 0 when group == 'Blue' and a 1 when group == 'Brown'
ttestData <- cbind(ttestData, dummyBrown)

## 6.1f ######################

ttestreg <- lm(formula = Score ~ dummyBrown, 
               data = ttestData)

## 6.1g ######################

summary(ttestreg)
# p-value dummyBrown: 0.14

## 6.2c ######################

df1 <- 4 - 1                # 3
df2 <- nrow(dataset8) - 4   # 218
qf(p = 0.95, df1 = df1, df2 = df2) # 2.646

## 6.2d ######################

anovaResult <- aov(formula = Score ~ Group, 
                   data = dataset8)

## 6.2e ######################

summary(anovaResult)
# F-value: 2.894
# p-value: 0.0362

## 6.3a ######################

dummyBrown <- as.numeric(dataset8$Group == 'Brown') # Dummy variable for brown eyes
dataset8 <- cbind(dataset8, dummyBrown)

dummyBlue <- as.numeric(dataset8$Group == 'Blue')   # Dummy variable for blue eyes
dataset8 <- cbind(dataset8, dummyBlue)

dummyGreen <- as.numeric(dataset8$Group == 'Green') # Dummy variable for green eyes
dataset8 <- cbind(dataset8, dummyGreen)

## 6.3b ######################

anovaReg <- lm(formula = Score ~ dummyBrown + dummyBlue + dummyGreen,
               data = dataset8)

## 6.3c ######################

summary(anovaReg)
# F-value: 2.894
# p-value: 0.0361
# R-squared: 0.0383

## 6.4a ######################

ancovaReg <- lm(formula = Score ~ dummyBrown + dummyBlue + dummyGreen + initialScore,
                data = dataset8)

## 6.4b ######################

summary(ancovaReg)
# F-value: 2.252
# p-value: 0.064
# R-squared: 0.0398

## 6.4g ######################

AIC(anovaReg)   # AIC: 865.54
AIC(ancovaReg)  # AIC: 867.18