library(rio)
voteinc <- import("voteinc.dta")

t <- table(voteinc$vote, voteinc$hinctnta)
names(dimnames(t)) <- c("Vote", "Income")

library(ggplot2)

p <- ggplot(as.data.frame(t), aes(x = Income, y = Freq, fill = Vote)) + 
  geom_bar(stat = "identity")

ggsave(filename = "Figs/Plot1.png", plot = p, device = "png")