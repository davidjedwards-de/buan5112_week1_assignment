library(tidyverse)
library(haven)

nhfs <- read_dta("IAHR52FL.dta")


#Get subset of variables relevant to the assignment
nhfs %>%
  select(hhid:shstruc) %>%
  rename(hhsize = hv009) %>%
  ggplot(mapping = aes(x = hhsize)) +
    geom_histogram(binwidth = 1) +
    xlab('Household Size')

#new data frame of only urban households
urban <- nhfs %>%
  select( hhid: shstruc) %>%
  rename( res_type = hv025) %>%
  rename( hhsize = hv009 ) %>%
  filter( res_type == 1)

#creating a factor of values for hv026 since the levels are integers
resi <- factor(urban$hv026, levels = c(0,1,2), labels = c("Large City","Small City","Town"))

#show the relationship between household size and place of residency
ggplot(data = urban)+
  geom_boxplot(mapping = aes(x = resi,  y = hhsize, fill = resi))+
  labs( title = "Household Size by Place of Residence", x = "Place of Residence", y = "Household Size", fill = "Place of Residence")


#Adding summary stats
urban %>%
  group_by(hv026) %>%
  summarise( 
    mean = mean(hhsize),
    median = median(hhsize))