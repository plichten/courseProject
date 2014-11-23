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

The data files were downloaded to a local machine using the following link:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
