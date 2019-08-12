################
# Computational Methods
# Session 1: Intro to R
################

####### Tour of RStudio

# This top left pane shows your R script. Just as the name suggests, this is a set of
# instructions (or script) you are giving to R. This is the most important piece of RStudio,
# and where you will perform the vast majority of your work.
#
# The bottom left pane is called the "console." This is where your code actually runs. If you 
# type "hello world" into the console and hit enter, R will spit back "hello world" to you. 
# Although in theory you could run all your code directly in the console, your instructions would
# not be saved and you wouldn't be able to access them in the future. USE A SCRIPT.
#
# The top right pane can show you a variety of things, but the one you'll use most is the environment tab. 
# This tab shows you which objects (we'll talk more about what that means later) R has at its disposal.
# Try typing x <- 1 into your console. After you hit enter, you'll see x pop up in your environment pane.
#
# The Bottom right pane has two important jobs. First, when you make some sort of plot or graph, it
# will pop up in this pane. Second, you can find "help" files here, which help remind you how to do
# certain things in R. Try typing ?mean in the console.


# Your first line of code

hello_world <- "hello world"

# Here we created an object called hello_world by using the "assignment operator" (<-). If you want
# R to remember something, you must assign it to something. 


# R is a calculator

x <- 1
y <- 2

z <- x + y

# We can use functions to do more complex things. For example, the mean() function calculates an average.
mean(c(1,2,3,4,5))

# Note that we also used a c() function. c stands for combine. This function takes a set of numbers
# (or words or other objects) and combines them into a vector. We'll talk about vectors later.
concat <- c(1,2,3,4)
concat

# Each object we create in R is assigned a class, or type. For example, if we make a vector of numbers,
# and then use the class() function, we see the class is "numeric"
class(concat)
class(hello_world)

# There are several common classes:
# `character`: these are text. Also called `strings` in other programming languages
# `numeric`: these are numbers
# `factor`: We won't worry too much about these for now, but these are like categorical variables. 
# `boolean`: contains values TRUE or FALSE.

# one of the biggest causes of errors in r coding is not knowing the class of your objects.
# For example, in the vector below, because we put parentheses around the numbers,
# R treats them like text instead of numbers.
vector1 <- c("1","2","3","4")
class(vector1)

# there are functions we can use to switch between different classes
vector2 <- as.numeric(vector1)
class(vector2)


######### Packages

# R comes with lots of functions, but there are millions more that you can get from packages.
# To get access to functions in a package, first install the package and then load it. 
# You only have to install a package once, but you must load it every time you start R.
install.packages("ggplot2")
library(ggplot2)

# You'll eventually be using ggplot quite a lot. It has one nice function for making really quick plots
my_data <- c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,3,3,3,3,2,2,2,2,1,1,1,1)
qplot(my_data) + theme_bw()


# There are literally packages to do anything you want in R. 
# Run this code if you want DJ Kahled or Lil Jon to congratulate you after your code runs.
devtools::install_github("brooke-watson/BRRR")
library(BRRR)
skrrrahh(35)
skrrrahh(36)


# Complete Exercise 1: Variables

#########
# Vectors
#########

# Last time we learned what variables are and played around with a few different types of variables.
# Today we'll spend more time on variables with multiple dimensions, and eventually talk about data.frames,
# which you'll use quite a lot in grad school.

# First let's make a vector. A vector is a variable that includes multiple values. You can think about 
# a vector as a column of a spreadsheet. 
some_numbers <- c(1,2,3,4)
some_numbers[1:3]

be_careful <- c(1,"these",2,"are",3,"words")
class(be_careful)
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

my_vector <- c(1,2,2,3,3,3,4,4,4,3,3,3,2,2,2,1,1,2,3,4,3,4,3,4,3,2,2,1,1,2,3,3,3,2,1,2,3,2,1,2,3)

# Several ways to do the same thing:
my_vector[my_vector==2]
my_vector[my_vector != 1 & my_vector != 3 & my_vector != 4]
my_vector[my_vector > 1 & my_vector < 3]

















