# Getting and Cleaning Data
# Course Project
# run_analysis.R

library(dplyr)

## ------------------------------
## STEP 1.1 : Import Files
## ------------------------------

# Reference data import

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names = c("ActivityID","ActivityLabel"))
head(activity_labels)

features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE,col.names=c("FeatureID","FeatureLabel"))
head(features)

# Train data Import

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = "SubjectID")
head(subject_train)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="ActivityID")
head(y_train)

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
head(x_train)
names(x_train)

# Test data Import

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = "SubjectID")
head(subject_test)

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="ActivityID")
head(y_test)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
head(x_test)
names(x_test)

## ------------------------------
## STEP 1.2 : Merge training and test data
## ------------------------------

data <- rbind(x_train,x_test)

## ------------------------------
## STEP 2 : Extracts only the measurements 
## on the mean and standard deviation for each measurement
## ------------------------------

mean_and_std_col <- grep("mean|std",features$FeatureLabel)

mean_and_std_col
# to remove the meanFreq detected in the mean regex
features <- features[mean_and_std_col,]
mean_freq_col <- grep("meanFreq",features$FeatureLabel)
features <- features[-mean_freq_col,]

data <- select(data,features$FeatureID)

## ------------------------------
## STEP 3 : Uses descriptive activity names to name the activities in the data set
## ------------------------------

# merge y_train and y_test
activity <- rbind(y_train,y_test)
# Add label column
activity <- merge(activity,activity_labels)
# merge subject
subject <- rbind(subject_train,subject_test)

# Add subject and activity label columns to dataset
data <- mutate(data,SubjectID=subject$SubjectID,Activity=activity$ActivityLabel)

## ------------------------------
## STEP 4 : Appropriately labels the data set with descriptive variable names. 
## ------------------------------

# Feature names includes [()-,] characters
# These characters will cause issues when the labels will be used as column names
# So here we remove them all and use '_' to keep it readable 
features$FeatureLabel <- gsub("[()]","",gsub("[,-]","_",features$FeatureLabel))

names(data)[1:(ncol(data)-2)] <- features$FeatureLabel

head(data)

## ------------------------------
## STEP 5
## Create independent dataset with average of each variable
## for each activity and each subject
## ------------------------------

data_mean <- summarise_each(group_by(data,Activity,SubjectID),funs(mean))
data_mean_df <- as.data.frame(data_mean)

head(data_mean_df)

write.table(data_mean_df,"./tidy_dataset.txt",row.names=FALSE)
