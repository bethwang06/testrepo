library(tidyverse)
library(rcfss)
library(readr)
race

#Tidy data structure
race %>% pivot_longer(cols = c(`50`:`350`), names_to = "time", values_to = "cases", names_transform = list(time = parse_number))

results
#Tidy data structure
results %>% pivot_wider(names_from = Treatment, values_from = value)

grades

#Tidy data structure
grades %>% pivot_longer(cols = c("Fall":"Winter"), names_to = "Quarter", values_to = "Score") %>% pivot_wider(names_from = "Test", values_from = "Score")

activities
#Tidy data structure
activities %>% pivot_longer(cols = c("work.T1": "talk.T2"), names_to = "variable", values_to = "value") %>% separate(variable, into = c("location", "time")) %>% pivot_wider(names_from = location, values_from = value)
