## FileName: run_analysis.R
## Last Updated: 03/21/2015
## Purpose: Data Analysis file for John Hopkins "Getting and Cleaning Data"
##
## Please reference README.md for additional context/detail around the input data
##
## Specific intent as follows (from the Course Project Description): 

#         1. Merges the training and the test sets to create 
#                 one data set.
#         2. Extracts only the measurements on the mean and 
#                 standard deviation for each measurement. 
#         3. Uses descriptive activity names to name the 
#                 activities in the data set
#         4. Appropriately labels the data set with descriptive 
#                 variable names. 
#         5. From the data set in step 4, creates a second, 
#                 independent tidy data set with the average 
#                 of each variable for each activity and each subject.

## Load Libraries
library(dplyr)
library(tidyr)

## Define pathways to data: 

path.root <- "."
path.data <- "data"
path.test <- "test"
path.train <- "train"

features.file <- "features.txt"
activities.file <- "activity_labels.txt"

test.core.file <- "X_test.txt"
test.type.file <- "y_test.txt"
test.subject.file <- "subject_test.txt"

train.core.file <- "X_train.txt"
train.type.file <- "y_train.txt"
train.subject.file <- "subject_train.txt"

## Load features/activities data
features <- tbl_df(read.table(paste(path.root, path.data, 
                                    features.file, sep="/"))) %>%
        # Only need the 2nd column
        select(V2) %>%
        # Add a Column Name
        rename(feature.name = V2)
activities <- tbl_df(read.table(paste(path.root, path.data, 
                                      activities.file, sep="/"))) %>%
        # Add some Column Names
        rename(act_id = V1, activity = V2)



## Load all test/train data into tbl variables
test.core <- tbl_df(read.table(paste(path.root, path.data, 
                                     path.test, test.core.file, sep="/")))
test.type <- tbl_df(read.table(paste(path.root, path.data, 
                                     path.test, test.type.file, sep="/")))%>%
        # Add a Column Name
        rename(act_id = V1) %>%
        # Link up with 'activities' dataset
        left_join(activities, by="act_id")
test.subject <- tbl_df(read.table(paste(path.root, path.data,
                                        path.test, test.subject.file, sep="/"))) %>%
        # Add a Column Name
        rename(subject = V1)

train.core <- tbl_df(read.table(paste(path.root, path.data, 
                                      path.train, train.core.file, sep="/")))
train.type <- tbl_df(read.table(paste(path.root, path.data, 
                                      path.train, train.type.file, sep="/")))%>%
        # Add a Column Name
        rename(act_id = V1)%>%
        # Link up with 'activities' dataset
        left_join(activities, by="act_id")
train.subject <- tbl_df(read.table(paste(path.root, path.data, 
                                         path.train, train.subject.file, sep="/")))%>%
        # Add a Column Name
        rename(subject = V1)

## Add Column Headers to test.core/train.core
setnames(test.core, old=colnames(test.core), 
         new=as.character(collect(select(features, feature.name))[[1]]))
setnames(train.core, old=colnames(train.core), 
         new=as.character(collect(select(features, feature.name))[[1]]))


## Compile full test and train variables (each composed of core/type/subject): 
test <- test.core %>%
        bind_cols(select(test.type, activity), 
                  select(test.subject, subject))

train <- train.core %>%
        bind_cols(select(train.type, activity), 
                  select(train.subject, subject))

## Combine test/train into single set
fullSet <- test %>% bind_rows(train)

## Trim fullset to only include subject mean() and std() 
##   columns per 'features_info.txt'
trimSet <- fullSet %>%
        select(subject, activity, contains("mean()"), contains("std()"))
## Make Column Names "friendly"
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("-X", ".X", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("-Y", ".Y", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("-Z", ".Z", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("-mean()", ".Mean", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("-std()", ".Std_Dev", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("tBodyAcc", "Time.Body_Acceleration", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("tBodyGyro", "Time.Body_Gyroscopic", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("tGravityAcc", "Time.Gravity_Acceleration", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("fBodyAcc", "Frequency.Body_Acceleration", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("fBodyGyro", "Frequency.Body_Gyroscopic", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("fGravityAcc", "Frequency.Gravity_Acceleration", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("fBodyBodyAcc", "Frequency.Body_Body_Acceleration", colnames(trimSet)))
setnames(trimSet, old=colnames(trimSet), 
         new=gsub("fBodyBodyGyro", "Frequency.Body_Body_Gyroscopic", colnames(trimSet)))

## Remove unneeded table variables
rm(activities, features, test.core, test.type, test.subject, train.core, 
   train.type, train.subject, test, train, fullSet)

## Create independent tidy dataset from 'trimSet' with average of all columns, 
##  grouped by subject and activity. 
avgActivity <- trimSet %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean)) %>%
        arrange(subject, activity)

## Output Tidy Dataset to file
write.table(avgActivity, "AverageActivity.txt")


