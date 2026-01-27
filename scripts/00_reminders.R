## Packages
library(tibble)
library(dplyr)
library(ggplot2)

## Themes
theme_set(theme_bw())

## Create example
set.seed(678)
ex1 <- tibble(
  group = factor(rep(LETTERS[1:7], each = 10)),
  n = as.numeric(group) + rbinom(n = 70, size = 10, prob = 0.1))

## Save plot
g <- ex1 %>%
  ggplot(aes(x = group, y = n, fill = group)) + 
  geom_col() +
  scale_fill_viridis_d() +
  coord_flip() +
  labs(x = "", y = "Total number of objects", fill = "Well")

ggsave(filename = "../img/00_reminders/example1_plot.svg", 
       width = 4, height = 5)

## Save data
write.csv(x = ex1, "../data/example1.csv")
