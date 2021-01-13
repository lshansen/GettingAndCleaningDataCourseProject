# Getting and Cleaning Data Course Project #

## Data source ##
The original data is the <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">UCI HAR Data Set</a>.

A full description of the data set is available at <a href=http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"> UCI Center for Machine Learning and Intelligent Systems</a>.

## Modifictaions ##
The original data was modified by running the 'run_analysis.R' script that does the following:

0. Prepares libraries, gets and reads data
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables ##

### Identifiers ###

* subject: ID of the subject
* activity: name of activity performed by subject

### Measurements ###
