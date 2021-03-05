## Statistics for Business with Applications in R and RStudio
##
## Chapter 5: Testing one or two means

## 5.2a ######################

qnorm(p = 0.95, mean = 0, sd = 1, lower.tail = TRUE)
# Or because the standard normal distribution is the default simply use:
qnorm(0.95)

round(qnorm(0.95), digits = 3)                  # z-value for 95% left-tailed probability: 1.645

## 5.2b ######################

qnorm(p = 0.975)                                # z-value for 97.5% left-tailed probability: 1.960

## 5.2c ######################

pnorm(q = 1.645, mean = 0, sd = 1)              # Gives the left-tailed probability for z-value 1.645 
pnorm(1.960)                                    # Gives the left-tailed probability for z-value 1.960

## 5.2d ######################

qt(p = 0.95, df = 15)                           # t-value for 95% left-tailed probability: 1.753

## 5.2e ######################

pt(q = 1.753, df = 15)                          # Gives the left-tailed probability for t-value 1.753

## 5.2f ######################

qt(p = 0.15, df = 19)   # -1.06
qt(p = 0.10, df = 19)   # -1.328
qt(p = 0.90, df = 19)   # 1.328
qt(p = 0.90, df = 19)   # 1.328

## 5.2g ######################

pt(q = -1.5, df = 19)                     # 0.075
diff(pt(q = c(-2,2), df = 19))            # 0.939
pt(q = 2.5, df = 19, lower.tail = FALSE)  # 0.011

## 5.2h ######################

qt(p = 0.99, df = 28)                      # Two-tailed inequality test:   2.467
qt(p = 0.98, df = 28)                      # One-tailed right sided test:  2.153
qt(p = 0.98, df = 28, lower.tail = FALSE)  # One-tailed left sided test:   -2.153

## 5.3f ######################

# These are the values for the RER test data set
placebo <- c(97, 106, 120, 104, 96, 100, 93, 96, 99)
caffeine <- c(97, 92, 95, 100, 95, 88, 85, 106, 89)

mean(placebo)  # Mean:                 101.22
sd(placebo)    # Standard deviation:   8.14 

mean(caffeine) # Mean:                 94.11
sd(caffeine)   # Standard deviation:   6.48  

## 5.3g ######################

# Perform an one-sided left-tailed independent samples t-test 
t.test(x = caffeine, y = placebo, alternative = 'less', mu = 0,
       paired = FALSE, var.equal = TRUE, conf.level = 0.95)        

## 5.3h ######################

t.test(x = caffeine, y = placebo, alternative = 'less', mu = 0,
       paired = FALSE, var.equal = FALSE, conf.level = 0.95)  
# The results differ slightly to those of 5.3g (see df and p-value)

## 5.4b ######################

# These are the values for the blood pressure data set
standing <- c(136, 144, 152, 133, 140, 129, 131, 133, 145, 134, 142, 140, 125, 135)
sitting <- c(148, 159, 121, 151, 145, 139, 135, 144, 141, 148, 143, 161, 150, 151)

mean(standing)                                  # Mean standing:        137.07
mean(sitting)                                   # Mean lying:           145.43
differences <- sitting - standing
mean(differences)                               # Mean difference:      8.36

## 5.4d ######################

t.test(x = standing, y = sitting, alternative = 'greater', mu = 0 ,
       paired = TRUE, conf.level = 0.925)
# This tests whether standing is greater than sitting

## 5.4e ######################

# Correct: alternative: x = sitting, y = standing
t.test(x = sitting, y = standing, alternative = 'greater', mu = 0 ,
       paired = TRUE, conf.level = 0.925)