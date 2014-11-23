A group of researchers carried out an experiment in which they captured a large set of biophysical measurements as 
subjects perfromed a series of activities. The data were recorded in number of text files. The purpose of the 
run_analysis.R script is to recover from this scattered data a tidy data set with the average values for all of 
the mean and standard deviation measurements. 

The run_analysis.R script in this repository produces a data set containing 61920 values representing 15480 observations 
of 4 variables. The variables are:
  1. subject with 30 possible values (integers 1 through 30).
  2. activity with 6 possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
  3. signal with 86 possible values (these can be accessed by running run_analysis.R and entering levels(tidyData$signal)
      at the command line.
  4. average, which is the average of a series of physical measurements with unlimited possible values collected from the
      accelerometers from the Samsung Galaxy S smartphone.

The data files were downloaded to a local machine from the following link:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
The first step in the process is to build a data table from the necessary files. 
  1. The file features.txt is loaded and converted into a vector. This represents the measurement
      variables in the first data table.
  2. Unique is run on the vector to remove duplicates.
  3. The file activity_labels.txt is loaded and converted into a vector. This represents the labels for the activity               variable.
  4. The file x_train.txt is loaded. This represents the measurements used as training data.
  5. The features vector is inserted as the column names for the training data using the name command.
  6. The file subject_train.txt is loaded and converted to a vector. This represents the identifiers for the 
      subjects in the training data.
  7. The file y_train.txt is loaded and converted to a vector. This represents the identifiers for the activity variable.
  8. The data for the training subjects, activities, and signal measurements are combined into one data frame using cbind.
  9. The file x_test.txt is loaded. This represents the measurements used as test data.
  10. The features vector is inserted as the column names for the test data using the name command.
  11. The file subject_test.txt is loaded and converted to a vector. This represents the identifiers for the 
        subjects in the test data.
  12. The data for the test subjects, activities, and signal measurements are combined into one data frame using cbind.
  13. The training and test data are combined using rbind.
  14. The activity labels are integrated into the activity variable using the factor command.
  15. The mean and std variables are selected using the select command. Note: the decision was made to include all
        variables with mean, Mean, or std in their description. The reasoning was that all of these variables
        include measurments on the mean and standard deviation for a particular measurement.
  16. The data frame is converted to a data table.
  17. The mean for each measurment is calculated.
  18. Columns representing the measurments for the individual signals are turned into rows using melt.
  19. The tidy data set is saved to a file named signalAverages.txt.

