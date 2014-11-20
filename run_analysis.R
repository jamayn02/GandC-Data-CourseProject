## This file assumes that the "UCI HAR Dataset" folder extracted from 
## the .zip file is in the working directory. 

## This section reads in the "features.txt" which has variable names.

features <- read.table("UCI HAR Dataset/features.txt")

## This section reads in training and test data set and assigns the
## variable names to the two sets.

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

## This section combines both traing and test data sets and creates
## unique variable names as some are equal.  Additionally, a subset of
## of the combined data set is created that only includes variables 
## with the mean and standard deviation in the name.

X <- rbind(X_test,X_train)
names(X) <- make.names(names(X),unique=TRUE)
install.packages(dplyr)
library(dplyr)
X <- select(X,contains("mean..."), contains("std..."))

## This section creates two data sets from reading the test and train
## data sets that contains the coded values of the activities 
## performed by the subjects (numbered 1-6). These two data sets are
## then combined into "Y". 

Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
Y <- rbind(Y_test,Y_train)
Y[1] <- factor(Y[[1]])

## This section reads in the subject numbers from two files and then
## combines them into one data set. This data set is then combined with
## the activity data set.

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test,subject_train)
subject_Y <- cbind(subject,Y)
colnames(subject_Y) <- c("subject", "activity")

## The description of activities peformed is read into a table, along
## with the corresponding coded number (1-6).  The coded number is then
## replaced with the descriptive activity name in the data set.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
install.packages("qdap")
library(qdap)
subject_Y$activity <- lookup(subject_Y$activity, activities)

## The subject and activity information data set is then combined with
## the data set containing mean and standard deviation data.

Dataset <- cbind(subject_Y,X)

## A tidy data set (wide) is created from the "Datset" data where the 
## mean of each variable is aggregated by the activity and subject.

tidydata <- aggregate(Dataset, by = list(Subject = Dataset$subject, Activity = Dataset$activity), FUN = mean)
tidydata <- subset(tidydata, select = -c(subject,activity))
write.table(tidydata, "tidydata.txt", row.names = FALSE)