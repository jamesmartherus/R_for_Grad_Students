

#####
# Session Setup: Loading, familiarizing
#####


library(dplyr)

inequality = read.dta("inequality.dta")

table(inequality$year)

table(taxation$year)

head(populations)

head(taxation)

install.packages("foreign")

fips_codes = read.table("State_FIPS.txt", sep="\t", header=TRUE)

setwd("FILL_IN_CORRECT_VALUES")

library(foreign)

head(inequality)

taxation = read.csv("STC_Historical_taxes.csv")

populations = read.csv("state_populations.csv")

#####
# Data Cleaning
#####

inequality = filter(inequality, state != "District of Columbia" & state != "United States")

inequality = inequality[c("year", "state", "gini", "top10", "top1")] #OR inequality = select(inequality, year, state, gini, top10, top1)

table(inequality$state)

inequality = inequality[inequality$year == 2010,] # OR inequality = filter(inequality, year == 2010)

populations = select(populations, NAME, CENSUS2010POP)

taxation = select(taxation, year, state, Total.Taxes, Total.Income.Taxes, name)

taxation = filter(taxation, year == 2010) # OR taxation = taxation[taxation$year == 2010,]

taxation = rename(taxation, state_fips_code=state)

fips_codes = select(fips_codes, State.FIPS, Name)

taxation = filter(taxation, name != "US STATE GOVTS")

fips_codes = filter(fips_codes, State.FIPS != 11)

populations = filter(populations, !state %in% c("United States",
                                                "District of Columbia",
                                                "Puerto Rico",
                                                "Northeast Region",
                                                "Midwest Region",
                                                "South Region",
                                                "West Region"))

fips_codes = filter(fips_codes, State.FIPS != 0)

populations = rename(populations, state=NAME, population_2010=CENSUS2010POP)

###########
# Merging code
###########

full_data = merge(ineq_and_taxation, populations,
                  by.x="FILL_IN_CORRECT_VALUE_HERE",
                  by.y="FILL_IN_CORRECT_VALUE_HERE",
                  all=TRUE)

ineq_and_taxation = merge(taxation_w_names, inequality,
                          by.x="FILL_IN_CORRECT_VALUE_HERE",
                          by.y="FILL_IN_CORRECT_VALUE_HERE",
                          all=TRUE)

taxation_w_names = merge(taxation, fips_codes,
                         by.x="FILL_IN_CORRECT_VALUE_HERE", by.y="FILL_IN_CORRECT_VALUE_HERE",
                         all=TRUE)
