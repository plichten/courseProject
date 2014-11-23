## load libraries and Set the working directory
setwd("C:/Users/tristein/Desktop/coursera/getting and cleaning data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
library(dplyr)
library(data.table)
library(reshape2)

## Load the training and the test sets; add measurement variable names, activity names and subject ids
features <- read.table("./features.txt")
features <- features[ -c(1) ]    ## Removes the column of numbers
features <- as.vector(as.matrix(features))  ## Converts features to a vector of names
features <- make.names(features, unique=TRUE) ## Corrects duplicate names
activity_labels <- read.table("./activity_labels.txt")
activity_labels <- activity_labels[ -c(1) ]
activity_labels <- as.vector(as.matrix(activity_labels))
training <- read.table("./train/x_train.txt")
names(training) <- features
subject_train <- read.table("./train/subject_train.txt")
subject_train <- as.vector(as.matrix(subject_train))
activity_train <- read.table("./train/y_train.txt")
activity_train <- as.vector(as.matrix(activity_train))
training <- cbind(subject=subject_train, activity=activity_train, training)
test <- read.table("./test/x_test.txt")
names(test) <- features
subject_test <- read.table("./test/subject_test.txt")
subject_test <- as.vector(as.matrix(subject_test))
activity_test <- read.table("./test/y_test.txt")
activity_test <- as.vector(as.matrix(activity_test))
test <- cbind(subject=subject_test, activity=activity_test, test)
allData <- rbind(training, test)
allData$activity <- factor(allData$activity, labels=activity_labels)

## Select only the relevant variables for further manipulation, convert to data table
allData <- select(allData, contains("subject"), contains("activity"), contains("mean"), contains("Mean"), contains("std"))
allData <- data.table(allData)

## Generate the results, melt the table, and save to text file
resultsData <- allData[, lapply(.SD, mean), by=list(subject, activity)]
tidyData <- melt(resultsData, id=1:2, variable="signal", value.name="average")
write.table(tidyData, file="signalAverages.txt", row.names=FALSE)

