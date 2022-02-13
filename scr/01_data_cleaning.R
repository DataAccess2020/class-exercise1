library(rio)
vote_income <- import("ESS1-9e01_1.dta")

#View(vote_income)
variable.names(vote_income)

library(tidyverse)

unique(vote_income$vote)
#The var "vote" has values 1 for VOTED, 2 for NOT VOTED,
#3 for NOT ELIGIBLE and NA for missing observations

voteinc <- filter(
  vote_income,
  agea > 18,
  vote == 1 | vote == 2
)

typeof(voteinc$vote)
#it's a double, I'm gonna recode it to 1-0 but keeping the type,
#in case we'll need to get the proportion

voteinc <- mutate(
  voteinc,
  vote = ifelse(vote == 1, 1,
                0)
)

unique(voteinc$vote)



##remove the NAs

voteinc <- na.omit(voteinc)

##export

export(voteinc, "voteinc.dta")