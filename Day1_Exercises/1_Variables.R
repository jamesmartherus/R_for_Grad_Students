
###########
# Hello and welcome to your first R exercises!
#
# Below you will find a number of prompts.
# After each prompt, please add code
# that does what the prompt asks.
###########


# Exercise 1: Assigning values
  # Assign the numeric value 42 to a variable called `the_answer`
  # (don't type out the ticks around the_answer -- those are just a way of indicating I'm typing
  # out the name of a variable or function)
the_answer <- 42

  # Now create a new variable (you can call it whatever you want) that is equal to
  # double `the_answer`.
double_the_answer <- the_answer * 2

# Exercise 3: different types
  # create a variable called `my_age` and set it equal to your age
my_age <- 28

  # Check the class of `my_age` using the `class()` function.
class(my_age)

  # Create a variable called `my_dog` and set it equal to the name of your dog.
  # If you do not have a dog, pretend you do. What's your pretend dog's name?
my_dog <- "fluffy"

  # What's the class of `my_dog`?
class(my_dog)

  # Now the weird one. Create a variable called `ten` and assign in the value "10"
  # in quotes. What's the class of `ten`? Why is it not numeric?
ten <- "10"
class(ten)

  # What happens if you add `my_age` and `ten`?
my_age + ten

  # To convert `ten` to a numeric type, type `ten <- as.numeric(ten)`. Now check
  # it's class again.
ten <- as.numeric(ten)
class(ten)
