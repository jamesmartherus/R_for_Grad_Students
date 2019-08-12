######################
# Computational Methods Session 2
# Dataframes
######################


# Now we're ready to look at some real data! When you put a bunch of vectors together, you get a matrix
# or a dataframe. Think of a dataframe like an excel spreadsheet. In most datasets, we want the rows
# to represent individual observations (people, states, etc.) and the columns to represent traits about
# those observations. Let's make one now.
name <- c("al", "bea", "carol")
age <- c(6, 7, 4)
hair <- c("brown", "green", "blond")

children <- data.frame(name, age, hair)
children

# Here the rows of the data.frame are individual children, identified by the name column.
# The columns give some sort of information about each child including their age and hair color.

# Now let's load up some "real" data and take a look at it. The first thing we need to do is tell R
# where to look for the data. If the data is on your computer, your first step is to set the
# working directory. If you aren't familiar with directories, they are just the system your computer
# uses to organize files. 

# On Mac OS, you can look at your directories using the Finder application.
# On Windows, you'll look for something like "Windows Explorer." 

# Once you find the data, you can find the path by right clicking on the folder and clicking either
# "Get Info" on Mac or "Properties" (I think) on Windows. Type that path into the setwd() function.
# Here's mine:
library(tidyverse)
setwd("/Users/jamesmartherus/Dropbox/Research/R_for_Grad_Students/Data/")
animals <- read_csv("animals.csv")

# Now we can check out the data in spreadsheet form by using the View() command:
View(animals)

# We can also look at the first few rows with the head() function or the last few with the tail() function.
head(animals)

# We can also look at the number of columns or rows in the dataset with the nrow() and ncol() functions.
ncol(animals)

# In vectors, when we wanted to refer to a specific piece of the vector, we had to use its numeric
# position. In dataframes, we can refer to pieces of the dataframe using the names of the columns.
# We do this with the `$` operator. The code: `animals$hair` refers to the column called "hair" in the
# dataframe "animals."
head(animals$eggs)

# Complete Exercise 1: Basic Manipulations.

#####################
# Cleaning Data
#####################

# The material we cover today gets a little complicated. You won't understand everything,
# and you'll probably forget a lot of this, but learning to code is all about repetition.
# Consider this your first exposure to some really important information, but don't be
# discouraged if it doesn't make perfect sense. 


# Intro to the Tidyverse
# There are a number of packages in R that are pieces of what is often called the "tidyverse."
# The tidyverse provides many different functions to help you prepare your data for analysis.
# All of these functions work on a standard set of principles that makes them easier to use.
# We'll learn about a few of these functions today, but there are many more.
# The handout I passed around is great for quickly reminding you some of these functions do.

library(foreign) # the foreign package allows us to import data of many different types.
inequality_data <- read.dta("inequality.dta")



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


# Do Exercise 5: Making New Variables



# That's all for today! Next, we'll learn how to visualize our data with ggplot,
# how to find help when you get stuck, and we'll start learning LaTeX.

