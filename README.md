# Getting And Cleaning Data
This repository is my submission for the "Getting and Cleaning Data Course Project" on Coursera.

The included script 'run_analysis.R' does the following:

0. Prepares libraries, gets and reads data
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The included file 'tidyDataSet.txt' is the tidy data set that results from running 'run_analysis.R'.

The included file 'CodeBook.md' is the code book that describes all the variables in the tidy data set that results from running 'run_analysis.R' as well as the original source for the data.
