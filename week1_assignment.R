library(tidyverse)
library(haven)

nhfs <- read_dta("IAHR52FL.dta")


#Get subset of variables and renaming hv009 to user friendly name
nhfs %>%
  select(hhid:shstruc) %>%
  rename(hhsize = hv009) %>%
  ggplot(aes(x = hhsize)) +
    geom_histogram(binwidth = 1)
