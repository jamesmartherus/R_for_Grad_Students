###########
# Getting Help
#
###########

# Finding R help is a skill, it takes practice to find the right answers.
# In this exercise, you'll learn a semi-complicated concept in R - reshaping data.

# First, google something like "reshape data wide to long" and try to figure out what it means 
# to reshape data. If you can't find something on your own, this article gives a good explanation:
# https://data.library.virginia.edu/reshaping-data-from-wide-to-long/

# Next, load in the inequality dataset. This dataset is currently in "long" format, with each 
# row being a state-year. Let's say we want to reshape the data such that each row is one state,
# with a set of columns for each year (e.g. gini.1916, gini.1917, etc.). Use the resources we
# discussed to answer the following questions:

# 1. Which package/function might you use to reshape your data? 
# Hint: Try Google and Stack Overflow

# 2. How does this function work? 
# Hint: Use the help file. Don't forget to install and load any packages you need first.

# 3. What is an id variable in the context of reshaping data?

# Now, create a new dataframe called `inequality_wide` where each row is one state
# and each year has its own set of columns.

# You'll probably get an error the first time you try this.
# Can you figure out what the error means? 

library(foreign)
setwd() # put your directory here
inequality <- read.dta("inequality.dta")

inequality_wide <- reshape(inequality, idvar="state",timevar="year",direction="wide")


