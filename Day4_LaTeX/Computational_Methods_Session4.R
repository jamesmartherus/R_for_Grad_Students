############################
# Computation Methods Session 4
# Using stargazer
############################

# Creating tables in LaTeX is a pain. R has some great packages that automatically
# generate publication quality LaTeX tables. The easiest to use is `stargazer,` which works best
# with regression output. First install and load the `stargazer` package.
library(stargazer)

# I'll run a regression here. Just ignore this, you'll learn all about regression in Stat 2. 
# I just want to show you how to get a table.
setwd("/users/jamesmartherus/Dropbox/Research/R_for_Grad_Students/Data/")
animals <- read.csv("animals.csv")
animal_model <- lm(predator ~ hair + feathers + eggs + milk + airborne, data=animals)

# next I just put the model object (animal_model) into the `stargazer()` function, and I 
# some code for a nice table! Just copy and paste this code into your .tex document.
stargazer(animal_model)

# You can also control lots of different things in your table like the dependent variable labels,
# covariate labels, etc. If you want to be able to read the table in R, use `type="text"`
stargazer(animal_model,
          dep.var.labels="Predator",
          covariate.labels = c("Has Hair","Has Feathers","Lays Eggs","Produces Milk","Is Airborne"),
          type="text")

# That's it!


