library(tidyverse)
library(haven)

nhfs <- read_dta("IAHR52FL.dta")

#selecting the subset of variables relevant for the assignment
ss_nhfs <- select(nhfs, hhid : shstruc)
