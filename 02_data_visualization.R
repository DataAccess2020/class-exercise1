library(rio)
voteinc <- import("voteinc.dta")

t <- table(voteinc$vote, voteinc$hinctnta)
names(dimnames(t)) <- c("Vote", "Income")
#I'm creating a cross-tab of the variables vote and income


library(ggplot2)

p <- ggplot(as.data.frame(t), aes(x = Income, y = Freq, fill = Vote)) + 
  geom_bar(stat = "identity")

ggsave(filename = "Figs/Plot1.png", plot = p, device = "png")

#In this plot I get to see the differences in the numbers of voters and non-voters per decile.
#The non-voters numbers get smaller as the income grows, however I'm not sure if it depends on the
#overall number of subjects being smaller in the highest levels of income.
#Therefore, I decide to look at the in-group proportions.



p2 <- ggplot(as.data.frame(t)) +
  geom_col(aes(x = Income, y = Freq, fill = Vote), position = "fill")

ggsave(filename = "Figs/Plot2.png", plot = p2, device = "png")

#From this plot I see there's an increase of in-group proportion as the income grows; however,
#in the very last decile suddenly the proportion of voters drops.