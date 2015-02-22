# obtainAndCleanCourseProject
Obtaining and Cleaning data course project

## Purpose

This program computes the average means and standard deviations per subject and activity of data captured by the accelerometer and gyroscope of a Samsung Galaxy S II wears by 30 volonteers.

The 30 volunteers (named the _subject_ in the program) are within an age bracket of 19-48 years. Each person performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

## Content

* *run_analysis.R* : program generating tidy dataset from the raw Human Activity Recognition dataset
* *UCI HAR Dataset* : raw dataset of accelerometer and gyroscope

For informations about the data see `CodeBook.md`

## Instructions

1. Clone the repository
2. Create a project in RStudio with the repository as working directory
3. Run `run_analysis.R from RStudio 

The result is writen a file named `tidy_dataset.txt`. 

It displays the average means and standard deviations of data captured per subject and activity.

Here is a sample of the result:

~~~
  Activity SubjectID tBodyAcc_mean_X tBodyAcc_mean_Y tBodyAcc_mean_Z tBodyAcc_std_X tBodyAcc_std_Y
1   LAYING        10       0.2769771     -0.01703330      -0.1108735     -0.3919863     -0.3856738
2   LAYING        12       0.2736087     -0.01833720      -0.1066491     -0.5839622     -0.5220400
3   LAYING        13       0.2758959     -0.01765048      -0.1091353     -0.6248445     -0.4488161
4   LAYING        18       0.2763242     -0.01728315      -0.1081123     -0.6946169     -0.6271175
5   LAYING        20       0.2684258     -0.01759130      -0.1080291     -0.6048467     -0.3693367
6   LAYING        24       0.2767670     -0.01768225      -0.1079145     -0.6754592     -0.5824907
~~~


## How the script works

The script does the folowing operations:

1. Import all the files
2. Merge the train and test raw data into a single dataset
3. Extract the `mean` and `std` variables only by using a `grep()` on the features labels, then remove the `meanFreq` (returned by the grep() on `mean`)
4. Merge the activity, add the label column then `mutate()` the dataset to add the subject and activity label
5. Modify Feature Labels by removing the `()` and replacing `[,-]` by `_`. This results in more readable labels that can be used in expressions like `data$tBodyAcc_mean_Y` for instance
6. Assign these labels to the names of the dataset
7. Summarize by activity and subject with the mean of each column (`summarise_each`) is used
8. Convert into data.frame
9. Write the result into `tidy_dataset.txt` file







