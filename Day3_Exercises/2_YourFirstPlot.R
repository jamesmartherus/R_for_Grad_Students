#################
# Exercise: Your First Plot
#################

# Look at the ggplot handout I gave you. There are dozens of different geoms that make 
# different types of plots. The first thing you should do before you make a data
# visualization is look at your data and decide the best way to present it might be.

# 1. Pick two variables from either the animals dataset or the inequality dataset. Stick to
# just two for now. We'll add more things like color later. 

# 2. Look at your variables (maybe use the class function to see what their types are)
# and think about the best way to present the data. Draw it out on paper

# 3. Use the handout to try to find the right geom(). I can help you if you can't find one.

# 4. Use the help file for the geom you chose and try to make your plot!
# Remember if you want to store your plot, you have to save it as a new object.

ggplot(inequality, aes(x=year, y=gini, color=top10)) +
  geom_point() +
  geom_smooth(method="loess", size=1.5) +
  xlab("Year") +
  ylab("Gini Coefficient") +
  ggtitle("Gini Coefficients Over Time") +
  theme_bw() +
  theme(text = element_text(size=18),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.position="bottom",
        plot.title = element_text(hjust = 0.5))

ggplot(inequality, aes(x=gini, y=state)) 
 