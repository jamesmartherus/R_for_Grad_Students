######################
# Computational Methods Session 3
# Plotting Data and Finding Help
######################

###############
# Finding Help
###############

# At some point, you'll need help to fix an error, find the right function, etc. 
# Finding help is a skill - one of the more important skills for getting through 
# Stat 1 and Stat 2. 

# There are many good resources for R help, but let's talk about three of the best.


#### R Help Files

# First, R itself contains several features for getting help. The most important of these
# features are help files. We've looked at these a bit in prior sessions, but let's look more
# closely. Pull up the help file for the rnorm() function using a question mark. 
?rnorm

# Help files begin with a description of what the function is supposed to do. Sometimes the
# descriptions are poorly worded and (especially when you're new to R) won't always make 
# perfect sense. Googling the name of the function often gives you a better description.
# For example, try googling "R rnorm function." The first result says:
# "rnorm generates a random value from the normal distribution." Much clearer.

# Next, help files show you how the function is used. In this case, the help file is actually 
# describing a number of related functions (rnorm, dnorm, pnorm, and qnorm). Look at the 
# usage for rnorm. This function uses three arguments - n, mean, and sd. You'll notice that
# the mean and se arguments are assigned values here. These are the defaults. If you don't
# specify a mean or sd, rnorm will assume you want a mean of 0, and a standard deviation of 1.

# The next section tells you what each argument means. What does the n argument refer to? 
# We should be able to use the rnorm function now. We give it the number of observations we want
# and it gives us random numbers from the normal distribution
random_nums <- rnorm(1000)

# Preview of ggplot for later!
library(ggplot2)
qplot(random_nums)

# At the end of the help file, you'll see some examples. Sometimes these are helpful, sometimes
# they're not. In the rnorm help file the examples are fairly complex, so they are less useful
# for us.


#### Google and Stack Overflow

# Stack Overflow is a website where programmers can ask for help from other programmers. 
# I would not recommend posting on Stack Overflow just yet - the community can be harsh if
# you ask a question that has been answered before or if your question doesn't follow the 
# (fairly strict) formatting guidelines. However, most questions you will have as a 
# beginner have been asked before, so Stack Overflow is a good resource. 

# Most of the time, you'll get to Stack Overflow naturally when you google a question. 
# I tend to format my Google queries like this: "R function arrange" or 
# "R error [paste error message here]". Make sure to take any names specific to your code
# out before you search. For example, if you had an error with the animals dataset, make sure
# to remove any references to that dataset. 

# You'll probably find several questions or errors that look similar to yours. Stack Overflow
# uses an upvote/downvote system similar to Reddit. When you click on different Stack Overflow
# links, look for questions (and especially answers) that have many upvotes. These are most
# likely to work for you. Also look for answers that are relatively recent. R changes over time
# and new packages are developed, so newer solutions are often easier to implement.

# Take a look at some Stack Overflow answers:

# Reshaping data
#https://stackoverflow.com/questions/5890584/how-to-reshape-data-from-long-to-wide-format
# Can you figure out what reshaping the data means?


#### R Cookbook and other R reference books

# You might also benefit from some sort of R reference. My favorites are:

# 1. The R Cookbook series (R Cookbook and R Graphics Cookbook)
# The R cookbook series is "task-oriented." You search for the task you are trying to accomplish
# and then the cookbook teaches you the principles you need to complete the task. It's a great
# book to have sitting on your bookshelf when you need it. 

# 2. R for Data Science
# This is a more traditional "textbook" style book that takes you through from very basic 
# principles all the way through building models. This is an extremely popular book for learning
# R, and if you'd like another, more in-depth version of the material we're covering in our class,
# you can't go wrong here. In programming, having things explained to you in multiple, different
# ways is often really helpful, so working through this book could be very valuable. 


# Both of these books are also available for free online!


# Do Exercise 1: Getting Help




######################
# Data visualization with ggplot
######################

# ggplot2 is an extremely powerful package in R that can make pretty much any type of chart
# can think of. It takes some time to get used to, but we'll give you your first exposure
# today. 

# One of the coolest functions in the ggplot package is qplot(). The q stands for "quick."
# qplot is fantastic for a quick and dirty look at your data. qplot looks at the data that
# you give it, and guesses what type of chart you want to see. Generally, when you pass 
# qplot one variable, it will give you a histogram. When you give it two variables, it
# will give you a scatterplot. First variable will be x, second will be y.
# Here's some examples:

qplot(inequality_data$gini)

qplot(inequality_data$year, inequality_data$gini)

# Now try using quickplot to chart the Gini coefficient on the x axis and state name on the 
# y axis




# The main workhorse function in ggplot is just called ggplot. Look up the help file for the 
# ggplot function, and see if you can make sense of how to use it. Hint: there are examples 
# at the bottom of the help file.


# Essentially, ggplot takes a dataframe as its first argument, and then you use the aes()
# function as the second argument. Inside the aes function, you tell R which variables
# to use for different things. For example, here's the code to use the inequality dataframe
# with the year on the x axis and the gini coefficient on the y axis:
ggplot(inequality_data, aes(x=year, y=gini))

# If you run that line, you'll notice you get a blank plot. That's because we haven't added
# the other important piece of a ggplot plot - a geom(). Geom's are basically templates that
# ggplot uses to make different types of charts. For example, if we want a scatterplot we
# would use geom_point(). 

# The way ggplot works is by adding layers on top of each other. The ggplot command you used
# above gave you the axes, and the geom will actually plot your data. To add a layer, you use
# the plus sign. Here's how to add point data on top of the ggplot you create above:
ggplot(inequality_data, aes(x=year, y=gini)) +
  geom_point()

# Exercise 6: Your First Plot


# When you want to customize your plot, you just keep adding more layers. 
# Here's some examples that show how to change your plot's title, coloring, axis labels, etc.
ggplot(inequality_data, aes(x=year, y=gini)) +
  geom_point() +
  ggtitle("Gini Coefficients Over Time") +
  ylim(c(0,1)) +
  ylab("Gini Coefficient") +
  xlab("Year") +
  theme_minimal()

# Spend some time customizing the plot you made in exercise 6


# You can also add more geom's to your plot. For example, if we want to add a loess curve
# to the plot we've been working with, we can add a geom_smooth(). 
ggplot(inequality_data, aes(x=year, y=gini)) +
  geom_point() +
  ggtitle("Gini Coefficients Over Time") +
  ylim(c(0,1)) +
  ylab("Gini Coefficient") +
  xlab("Year") +
  theme_minimal() +
  geom_smooth(method = "loess", size = 1.5)

# We could also add a third variable using the color, size, or shape of the points.
# Try using help files and google to figure out how to color each point using the
# `rmeandev` variable
ggplot(inequality_data, aes(x=year, y=gini, color=rmeandev)) +
  geom_point() +
  ggtitle("Gini Coefficients Over Time") +
  ylim(c(0,1)) +
  ylab("Gini Coefficient") +
  xlab("Year") +
  theme_minimal() +
  geom_smooth(method = "loess", size = 1.5)

# The great thing about ggplot is that you can do a bunch of complex things, but you can add
# it bit by bit. You don't have to know exactly what you want before going in, you can 
# tinker with all these little pieces. 

# Now lets combine the things we learned about cleaning data and what we learned about 
# making charts!

# Exercise 7: Putting dplyr and ggplot together.















