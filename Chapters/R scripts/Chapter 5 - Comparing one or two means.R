## Statistics for Business with Applications in R and RStudio
##
## Chapter 5: Comparing one or two means

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

# These are the values for the RER test dataset
placebo <- c(105, 119, 100, 97, 96, 101, 94, 95, 98)
caffeine <- c(96, 99, 94, 89, 96, 93, 88, 105, 88)

mean(placebo)  # Mean:                 100.55
sd(placebo)    # Standard deviation:   7.699  

mean(caffeine) # Mean:                 94.22
sd(caffeine)   # Standard deviation:   5.607  

## 5.3g ######################

# Perform an one-sided right tailed independent samples t-test 
t.test(x = placebo, y = caffeine, alternative = 'greater', mu = 0,
       paired = FALSE, var.equal = TRUE, conf.level = 0.95)        

## 5.3h ######################

t.test(x = placebo, y = caffeine, alternative = 'greater', mu = 0,
       paired = FALSE, var.equal = FALSE, conf.level = 0.95)  
# The results differ slightly to those of 5.3g (see df and p-value)

## 5.4b ######################

# These are the values for the blood pressure dataset
standing <- c(132, 146, 135, 141, 139, 162, 128, 137, 145, 151, 131,
              143)
lying <- c(136, 145, 140, 147, 142, 160, 137, 136, 149, 158, 120, 150)

mean(standing)                                  # Mean standing:        100.55
mean(lying)                                     # Mean lying:           94.22
differences <- standing - lying
mean(differences)                               # Mean difference:      -2.5

## 5.4d ######################

t.test(x = standing, y = lying, alternative = 'greater', mu = 0 ,
       paired = TRUE, conf.level = 0.925)
# The test is done with alternative = 'greater'

## 5.4e ######################

# Correct: alternative = 'less'
t.test(x = standing, y = lying, alternative = 'less', mu = 0 ,
       paired = TRUE, conf.level = 0.925)

