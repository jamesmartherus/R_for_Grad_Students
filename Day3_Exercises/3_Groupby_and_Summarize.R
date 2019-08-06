###########
# The group_by() and summarize() functions
#
###########

# In research, we often want to collapse our data in some way. For example,
# if we have exprimental data, we might want to find the average value of the dependent
# variable for each treatment group. We can perform tasks like this with the
# group_by() and summarize() functions.

# The group_by() function tells R what the group variable is. The summarize function tells R
# what to do with those groups.

# For example here's how I could get the average number of legs that each type of animal has
# `animals_byType <- group_by(animals, type)`
# `avg_legs <- summarize(animals_byType, mean(legs))`

# Problem 1
# OK, your turn! Load in the animals.csv file and try to get the LARGEST number of legs for each type
# of animal. Hint: you can use max() instead of mean() inside the summarize() function. 

# Problem 2
# Now find the number of each animals in each type. Hint: use n() instead of mean()



# Challenge: If you didn't already, try doing problems 1 and 2 using the pipe operator!





