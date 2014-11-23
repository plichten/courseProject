courseProject
=============
run_analysis.R works on individual files that have been downloaded to a local machine.

It uses the dplyr, data.table, and reshape2 packages, which are loaded during the execution of the script.
It loads the training and test data sets into separate data frames. 
It loads variable names for the measurement variable by reading in the feature.txt file removing the first column from that data frame and converting it to a vector.
Using the make.names function with unique set to TRUE, it removes duplicate names. 
It loads the names for the activity variable by reading in the activity_labels.txt file removing the first column from that data frame and converting it to a vector.
It loads the training and test subject ids into separate data frames.
It combines the training data into a single data frame using cbind.
It combines the test data into a single data frame using cbind.
It combines the traing and test data into a single data frame using rbind.
It integrates the activity labels into the activity variable using the factor function.
It retains only the mean and standard variation variables using the select function.
It calculates the averages on these remaining variables using lapply, mean over the measurement variables.
It reorganizes the data to create the signal and average variables using the melt function.
It writes the resulting table to a text file named signalAverage.txt using the write.table function.

To view the tidy data set, please read it into R using read.table("./signalAverage.txt").
