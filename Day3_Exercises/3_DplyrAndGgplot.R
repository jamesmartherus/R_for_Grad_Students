#################
# Exercise: Combining dplyr and ggplot
#################

### Part A
# Ok, lets combine everything we learned today. Take the inequality data and do the following:
# 1. keep only the state, year, gini, and top10 variables.
# 2. group the data by state
# 3. collapse the data such that each row is one state with the average gini coefficient
# across all years in the data
# 4. sort the data in descending order such that the state with the highest gini
# coefficient comes first. 
#     Hint: you'll need to use a function we haven't learned yet, so you'll have to find it.
#     try here: https://dplyr.tidyverse.org/
# Bonus points if you do it all at once using the pipe!

inequality_new <- inequality %>%
  select(c(state, year, gini, top10)) %>%
  group_by(state) %>%
  summarize(mean_gini=mean(gini, na.rm=TRUE)) %>%
  arrange(desc(mean_gini))


# Part B
# Now decide how to plot this data most clearly. Draw it out on paper!
  


# Part C
# Create your plot using the ggplot function
ggplot(inequality_new, aes(y=mean_gini,x=reorder(state, mean_gini), mean_gini)) +
  geom_col() +
  coord_flip() +
  ylab("Mean Annual Gini Coefficient") +
  xlab("State") +
  ggtitle("Average Annual Gini Coefficient For Each State Between 1916 and 2012") +
  theme_bw()




# Part D
# Now customize your plot. Try to use the ggplot cheat sheet or google to go beyond the
# customizations we did earlier. 



