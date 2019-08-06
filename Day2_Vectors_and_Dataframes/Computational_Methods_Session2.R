######################
# Computational Methods Session 2
# Vectors and Importing Data
######################

# Begin by completing Exercise 1: Variables

#########
# Vectors
#########

# Last time we learned what variables are and played around with a few different types of variables.
# Today we'll spend more time on variables with multiple dimensions, and eventually talk about data.frames,
# which you'll use quite a lot in grad school.

# First let's make a vector. A vector is a variable that includes multiple values. You can think about 
# a vector as a column of a spreadsheet. 
some_numbers <- c(1,2,3,4)
some_numbers

# Vectors always hold the same type of value. For example, you can't have a vector with some 
# numbers and some strings. If you try, R will automatically choose a type for you:
be_careful <- c(1,"hi",2,"there")
class(be_careful)

# There are different functions that help us learn about vectors we have created. For example, try
# creating a vector and using the length() function to see how many values it contains.
some_numbers <- c(1,2,3,4,5,4,3,2,1)
length(some_numbers)

# Now let's do Exercise 2: Making Vectors

# Each piece of a vector has a name. We can refer to individual pieces of a vector by using brackets.
# For example, to get the first item from a vector, I would put a 1 in brackets after the vector's name.
some_numbers[1]

# Sometimes we want to get pieces of a vector based on some sort of logical rule. To do this we use
# Boolean logic.
# `==` means `equal to`
# `!=` mean `not equal to`
# `&` means `and`
# `|` means `or`
# `>` means `greater than`
# `<` means `less than`
# `>=` means `greater than or equal to`
# `<=` means `less than or equal to`
# We can also use the phrases TRUE and FALSE

# We can use these different logical operators to make rules to pick which pieces of a vector we want
# to use. This will be important later, so let's practice this: Do exercise 3: Subsetting Vectors.


##############
# Data Frames
##############


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


# Tomorrow we're going to do some more complex things with datasets, so its really important
# that everyone understands these basics. To finish up, let's do some more practice with
# Exercise 5: Basic Manipulations.

# Next time, we'll talk about cleaning and visualizing our data!










