##Statistics

library(rio)
library(tidyverse)

voteinc <- import("voteinc.dta")

#We have different levels of income (expressed in deciles, from 1 to 10) and we want to know
#if there's a relationship between income and vote; firstly we observe the proportions of vote 
#for each group:

voteinc %>%
  group_by(hinctnta) %>%
  summarize(
    voteprop = mean(vote, na.rm = T)
  )

#as we can see, they are different for each level of income

#Given that, we now have some support to the Ha, so now we test it statistically;
#in order to reject the H0, we'll perform a chi^test with contingency tables.
#To work fastly, we use "gmodels" package:

install.packages("gmodels")
library(gmodels)

as.table(CrossTable(voteinc$hinctnta, voteinc$vote, digit=2, prop.r=TRUE, chisq=TRUE))

##The Pearson's Chi-Squared tes gives us a p = 2.807141e-06, therefore with a 95% confidence
## we can reject the null H0 and confirm the Ha: vote depends on income.
