## Script with error
tibble(x = rnorm(10), 
       y = rnorm(10)) %>%
  ggplot(aes(x, y)) %>% 
  geom_point()

