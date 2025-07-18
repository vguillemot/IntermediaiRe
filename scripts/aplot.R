library(aplot)
library(dplyr)
library(ggplot2)

theme_set(theme_bw())

dat <- tibble(
  x = rnorm(1000),
  y = x + rnorm(1000)
)


hexplot <- dat %>%
  ggplot(aes(x, y)) + 
  geom_hex() + 
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  scale_fill_distiller(palette = "PuBu") + 
  coord_equal()

distplot.x <- dat %>%
  ggplot(aes(x)) + 
  geom_density(fill = "skyblue", color = NA) + 
  geom_vline(xintercept = 0) +
  theme_void()

distplot.y <- dat %>%
  ggplot(aes(y = y)) + 
  geom_density(fill = "skyblue", color = NA) + 
  geom_hline(yintercept = 0) +
  theme_void()

hexplot %>%
  insert_top(distplot.x, height = 0.1) %>%
  insert_right(distplot.y, width = 0.1)
