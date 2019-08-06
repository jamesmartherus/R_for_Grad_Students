######################
# Computational Methods Session 3
# Tidying and Plotting Data
######################

# Last time we talked about vectors and dataframes. Today we'll spend some time on the two tasks
# that will eventually take up most of your codig time - cleaning your data, and visualizing it.

# The material we cover today is the most complicated we will cover in computing camp. You won't
# understand everything, and you'll probably forget a lot of this, but learning to code is all about
# repetition. Consider this your first exposure to some really important information, but don't be
# discouraged if it doesn't make sense. 


# Intro to the Tidyverse
# There are a number of packages in R that are pieces of what is often called the "tidyverse."
# The tidyverse provides many different functions to help you prepare your data for analysis.
# All of these functions work on a standard set of principles that makes them easier to use.
# We'll learn about a few of these functions today, but there are many more.
# The handout I passed around is great for quickly reminding you some of these functions do.


# First, let's upload some data into R to review from yesterday, and so we can see
# the Tidyverse in action. 
setwd("/users/jamesmartherus/Dropbox/Research/R_for_Grad_Students/Data/")
library(foreign) # the foreign package allows us to import data of many different types.
inequality_data <- read.dta("inequality.dta")

head(inequality_data)

class(inequality_data$state)



# The main package in the Tidyverse for cleaning data is called dplyr. dplyr has several important
# functions. Here's the ones I used most often:

# filter()    For subsetting data
# arrange()   For sorting data
# select()    For dropping variables
# rename()    For renaming variables
# mutate()    For creating new variables
# group_by()  For collapsing data
# summarize() For collapsing data

# Lets test some of them out on our data. 
library(dplyr)

# Remember that functions are like machines that take inputs and then give us something else as output.
# The first input for a tidyverse function is ALWAYS the name of the data object.

# the second input depends on the function we are using. Let's start with filter(). 
# Let's say I want a new dataset that includes only the countries with a gini coefficient greater
# than .5. We can do this realy easily with the filter() function by adding a logical argument as the 
# second input to the function
filter(inequality_data, gini > .5)

# Now let's say we want to see all the data we have for Tennessee. Again, we just use a simple logical
# statement
filter(inequality_data, state=="Tennessee")


# Do Exercise 1: Subsetting


# Next let's learn about dropping variables. There are a number of reasons we might want to do this.
# Smaller datasets are easier to look at, and can be analyzed much more quickly. Keeping only the 
# variables you're interested in is often a good idea. The select function makes this simple.

# Again, the first argument is the dataframe you want to use. The second argument is a list
# of variables that you want to KEEP. Remember to use the c() function. Here's an example from the inequality data
select(inequality_data, c(year, state, gini))

# You can also say which variables you want to DROP by adding a `-` in front of the list.
# For example, this line would drop the variables `atkin05`, `rmeandev`, and `theil`.
select(inequality_data, -c(atkin05, rmeandev, theil))


# Do Exercise 2: Dropping Variables


#############################################################
# This next section is a really cool feature of the tidyverse, but it tends to confuse people.
# If you feel like you're barely following along at this point, just skip this section. 
# It is optional. 
#############################################################

# In Exercise 2, I asked you to use both the filter() function and the select() function.
# You can actually use multiple tidyverse functions at once using something called
# the "pipe" operator, which looks lke this: `%>%`

# The pipe operator lets you stack multiple functions, so you can do everything at once. 
# For example, here's the code to solve the last piece of exercise 2 using the pipe operator:
venomous_reptiles <- animals %>%
  filter(type=="reptile" & venomous==1) %>%
  select(c(animal,venomous, type))

# Basically, the pipe operator inserts the previous line of code into the next. So the above
# code tells R to insert the animals dataframe as the first argument of the filter command.
# then AFTER the filtering occurs, the new filtered dataframe gets inserted as the first argument
# of the select function.

# Lots of people get confused by this, so if it makes no sense to you, pretend you didn't hear
# this and don't use it for now. All these functions will work perfectly fine without the pipe.

#################################
#################################


# Next is the group_by() function. This one is a little tricky to explain, since you can't immediately
# see its effects. Basically the group_by() function tells R that you want to analyze a data by groups
# rather than for each individual observation. For example, lets say we want to know the average
# gini coefficient for each state over time. We would start by using the group_by() function to 
# tell R we want to group by states.
grouped_inequality <- group_by(inequality_data, state)

# The data looks exactly the same as it did before, but now R knows we want to group by states.
# Now we can use another tidyverse function, summarize(), to get the average gini coefficient by state.
mean_gini <- summarize(grouped_inequality, mean(gini))

# If you use the pipe operator here, you don't have to create
# the intermediate dataframe `grouped_inequality`
mean_gini <- inequality_data %>%
  group_by(state) %>%
  summarize(mean(gini))


# Do Exercise 3: Summarize


# Finally, the mutate() function helps us create new variables. 
# Perhaps we want a new variable that multiples the gini coefficient by 100 for some reason.
# The second argument in the mutate function lets us specify the name of the new variable, and then
# how the values of that variable should be calculated.
mutate(inequality_data, gini100 = gini*100)


# That's all I have for today. Next time we'll focus mostly on LaTeX, but we'll also learn how
# to create loops in R. Loops can be challenging if you don't have prior programming experience,
# but they can save you a TON of coding time once you get the hang of them.
# Also your Stats 1 professor told me you'll need them in her class... 






# Next is the mutate function. This one can be a little tricky, but its job is to create new variables.
# For example, lets say

















