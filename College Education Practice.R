library(tidyverse)
library(rcfss)

#Greater than 40% share of first-generation students
scorecard %>% filter(firstgen > 0.40)

#10 most expensive colleges in 2018-2019 based on net cost of attendance
arrange(.data = scorecard, desc(netcost)) %>% slice(1:10)

#average SAT score for each type of college
scorecard %>% group_by(type) %>% summarize(mean_sat = mean(satavg, na.rm = TRUE))

#How many students it takes to pay average faculty member's salary
scorecard %>% mutate(ratio = avgfacsal/netcost) %>% select(name, ratio)

#Private, nonprofit schools that have smaller net cost than UChicago (total number)
scorecard %>% filter(type == "Private, nonprofit") %>% arrange(netcost) %>% mutate(school_cheaper = row_number() - 1) %>% filter(name == "University of Chicago") %>% glimpse()

#Private, nonprofit schools that have smaller net cost than UChicago (percentage)
scorecard %>% filter(type == "Private, nonprofit") %>% mutate(netcost_rank = percent_rank(netcost)) %>% filter(name == "University of Chicago") %>% glimpse()

#Graph for which type of college has the highest average SAT score
ggplot(scorecard, mapping = aes(x = type, y = satavg)) + geom_boxplot() 
ggplot(scorecard, mapping = aes(x = satavg)) + geom_histogram() + facet_wrap(~type)
ggplot(scorecard, aes(x = satavg, color = type)) + geom_freqploy()

#Relationship between net cost of attendance and faculty salaries differ by type
ggplot(scorecard, mapping = aes(x = netcost, y = avgfacsal, color = type)) + geom_point() + geom_smooth() + facet_grid(.~type)

#College Pell Grant recipients and average student's education debt
ggplot(scorecard, mapping = aes(pctpell, debt)) + geom_jitter()
ggplot(scorecard, mapping = aes(pctpell, debt)) + geom_hex()
ggplot(scorecard, mapping = aes(pctpell, debt)) + geom_point(alpha = .2) + geom_smooth()
