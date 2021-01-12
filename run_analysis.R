# Step 0: Prepare library and get data

## prepare library
library(dplyr)

## check if archive exists; if not download data
filename <- "data.zip"

if (!file.exists(filename)) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method = "curl")
}

## check if folder exists; if not unzip data
if (!file.exists("UCI HAR Dataset")) {
        unzip(filename)
}

## assign data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: Merge train and test sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)
mergedData <- cbind(s_data, y_data, x_data)

# Step 2: Extract mean and standard deviation for each measurement
tidyData <- mergedData %>% select(subject, code, contains("mean"), contains("std"))

# Step 3: Name activities
tidyData <- activities[tidyData$cosde, 2]

# Step 4: Label data set with descriptive names
names(tidyData)[2] = "activity"
names(tidyData)<-gsub("Acc", "accelerometer", names(tidyData))
names(tidyData)<-gsub("Gyro", "gyroscope", names(tidyData))
names(tidyData)<-gsub("BodyBody", "body", names(tidyData))
names(tidyData)<-gsub("Mag", "Mmgnitude", names(tidyData))
names(tidyData)<-gsub("^t", "time", names(tidyData))
names(tidyData)<-gsub("^f", "frequency", names(tidyData))
names(tidyData)<-gsub("tBody", "timeBody", names(tidyData))
names(tidyData)<-gsub("-mean()", "mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "std", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-freq()", "frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("angle", "angle", names(tidyData))

# Step 5: Create second, independent tidy data set with the average of each subject and each activity variable
finalTidyData <- tidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(finalTidyData, "finalTidyData.txt", row.name = FALSE)