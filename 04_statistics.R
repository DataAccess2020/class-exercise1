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

#To test the Ha we use "gmodels"

install.packages("gmodels")