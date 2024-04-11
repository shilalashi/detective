#Install and load the tidyverse
install.packages('tidyverse')
library(tidyverse)

# Create a dataframe named 'daily_activity'
daily_activity <- read.csv("dailyActivity_merged.csv")

# Create another dataframe for the sleep data. 
sleep_day <- read.csv("sleepDay_merged.csv")

# Take a look at the daily_activity data.
head(daily_activity)

# Identify all the columns in the daily_activity data.
colnames(daily_activity)

# Take a look at the sleep_day data.
head(sleep_day)

# Identify all the columns in the daily_activity data.
colnames(sleep_day)

# How many unique participants are there in each dataframe?
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)

# How many observations are there in each dataframe?
nrow(daily_activity)
nrow(sleep_day)

# For the daily activity dataframe:
daily_activity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()


# For the sleep dataframe:

sleep_day %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()

# What's the relationship between steps taken in a day and sedentary minutes? 
# How could this help inform the customer segments that we can market to? 
# E.g. position this more as a way to get started in walking more? 
# Or to measure steps that you're already taking?
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()

# What's the relationship between minutes asleep and time in bed? 
# You might expect it to be almost completely linear - are there any unexpected trends?
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()

# Merging these two datasets together
combined_data <- merge(sleep_day, daily_activity, by="Id")

# Take a look at how many participants are in this data set.
n_distinct(combined_data$Id)

# Note that there were more participant Ids in the daily activity 
# dataset that have been filtered out using merge. Consider using 'outer_join' 
# to keep those in the dataset. 

# Now you can explore some different relationships between activity and sleep as well. 
# For example, do you think participants who sleep more also take more steps or fewer 
# steps per day? Is there a relationship at all? How could these answers help inform 
# the marketing strategy of how you position this new product?

# This is just one example of how to get started with this data - there are many other 
# files and questions to explore as well!
