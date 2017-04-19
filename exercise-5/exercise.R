# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

View(flights)
# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data

flights <- group_by(flights, month)
dep.delay.by.month <- summarize(flights, delay = mean(dep_delay, na.rm=TRUE))

# dep.delay.by.month <- flights %>% 
#   group_by(month) %>%  
#   summarise(delay = mean(dep_delay, na.rm=TRUE))



# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(dep.delay.by.month)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
flights <- group_by(flights, dest)
airport.with.highest.avg.delay <- summarize(flights, delay = mean(arr_delay, na.rm=TRUE))
airport.with.highest.avg.delay <- arrange(airport.with.highest.avg.delay, -delay)
### Bonus ###
# Which city was flown to with the highest average speed?
