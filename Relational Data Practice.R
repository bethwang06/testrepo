library(tidyverse)
library(nycflights13)
theme_set(theme_minimal())

#Relationship between age of plane and departure delays?
plane_ages <- planes %>% mutate(age = 2013-year) %>% select(tailnum, age)

flights %>% 
  inner_join(y = plane_ages) %>% #inner join doesn't have x value?
  ggplot(aes(x = age, y = dep_delay)) + 
  geom_smooth()

#Add the location of the origin and destination to flights
flights %>% 
  left_join(y = airports, by = c(dest = "faa")) %>%
  left_join(y = airports, by = c(origin = "faa"))

airports_lite <- airports %>%
  select(faa, lat, lon)

flights %>%
  left_join(y = airports_lite, by = c(dest = "faa")) %>%
  left_join(y = airports_lite, by = c(origin = "faa"), suffix = c(".dest", ".origin"))
