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







