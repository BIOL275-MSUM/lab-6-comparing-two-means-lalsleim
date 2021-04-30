
# load packages -----------------------------------------------------------

library(tidyverse)


# read data ---------------------------------------------------------------

fish <- read_csv("chap12q19ElectricFish.csv")


# put data in tidy format ------------------------------------------------

fish_long <- 
  pivot_longer(fish, speciesUpstream:speciesDownstream,
               names_to = "location",
               values_to = "species") %>% 
  mutate(location = str_remove(location, c("species"))) %>% 
  print()


# Question A t-test -------------------------------------------------------

fish_ttest <- t.test(species ~ location, data = fish_long)
fish_ttest$estimate

# Question B difference in means -----------------------------------------

diff(fish_ttest$estimate)

# Question C histograms --------------------------------------------------

fish_long %>% 
  ggplot(aes(x = location, y = tributary)) +
  geom_jitter(aes(color = location), 
  shape = 16, alpha = 0.9, width = 0.9) 
