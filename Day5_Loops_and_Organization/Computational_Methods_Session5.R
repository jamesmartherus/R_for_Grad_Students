######################
# Computational Methods Session 5
# For Loops
######################

# Loops can be difficult to understand for people who have never used a programming language before.
# However, they are one of the most important programming concepts you can learn, and often
# save you qute a lot of time. 

# Loops basically tell R to do a certain task over and over again until some condition is met.
# Sometimes that condition is that the task has been completed a certain number of times, other times
# the condition is that the task has been completed on every observation in a dataset, or every file
# in a folder. 

# There are many different types of loops, but we'll start with a relatively simple one - the For Loop.
# Many of these same principles apply to other sorts of loops. 
# Usually, loops include some sort of indicator that changes for each pass of the loop. 
# For example, I might name my indicator `i` and the first time through the loop `i = 1`,
# then the second time through the loop `i` would equal 2, etc. Here's an example of a simple for loop

# Loops start with the command for() the contents of the parentheses tell R how many times to run the
# loop or when the loop should stop. So in this example, we are telling R to run the loop 5 times. 

# What does the loop do?
# What is the new value of x?
x <- 0
for(i in 1:5){
  x <- x + 1
}


# We can also use our indicator variable inside the loop itself!
# What does this loop do? What should the new vector look like?
y <- c(1,2,3,4,5,6,7,8,9,10)

for(i in 1:10){
  y[i] <- y[i] * 5
}

###############
# Do Exercise 1 
###############




#### Some Final Thoughts on Coding Style

# Before we part ways for the last time, we should discuss some coding best practices.

# 1. Write your code for humans, not computers
# Ideally, you want your code to be clear enough that anyone who knows R could look
# at it and understand what is going on. That means you should put extensive comments
# on your code. I like to describe what the code is doing every few lines. It also means
# you should name your objects well. Names should be relatively short, but descriptive.
# The same applies for file names. 

# Although you are writing code so that someone else could understand it, you are
# actually doing it so that YOU can understand it in the future. Often, you'll leave 
# a project alone for several months and then come back to it. If you don't have
# well-documented code, you'll waste a lot of time figuring out what you were doing.

# 2. In general, you should organize your code in a similar way each time. 
# Normally, you load all necessary packages at the beginning of your script.
# After loading packages, I normally import data, then clean it, then analyze it.
# Again, all of these pieces should be well-labeled 

# 3. You CAN but SHOULDN'T use right-hand assignment. In our tutorials, we always used 
# left-hand assignment. Here's examples of left and right hand assignment
x <- 1
1 -> x
# We stick to left-hand assignment because it makes it easier to see where an object 
# is being created.

# 4. Certain words or phrases are reserved by R for special tasks. You shouldn't name
# your variables with these names. For example, T is a shortcut for the logical TRUE,
# so you shouldn't name a variable T.

T <- 1 #bad 

# 5. Put spaces around operators for readability

x<-1 #bad
y <- 1 #good
x==y #bad
x == y #good









