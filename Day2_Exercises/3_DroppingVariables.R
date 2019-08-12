###########
# Dropping and keeping variables with the select() function
#
###########

# Exercise 1: Drop some variables
# In research, we often want pare down our datasets for ease of reading and
# to make our analyses run faster. The select() function helps us do this easily!

# For example here's how I could drop several columns from the animals data:
# `select(animals, -c(feathers, eggs, milk, airborne))`

# OK, your turn! Load in the animals.csv file and try to keep only the animal name and type.


# Now try to drop only the legs and fins variables


# Finally, lets combine the filter() and select() functions. 
# Try to create a new dataset called venemous_reptiles that includes only 
# animals with the type "reptile" and where venomous is equal to 1. 

# Then drop all the variables except the animal's name, type, and the venomous variable.


# Without peeking, what is the second animal in the list?
