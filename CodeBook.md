# CodeBook

## Raw Data

See `README.txt` in `UCI HAR Dataset`.

## Tidy Data 

In the program the two most important dataset are:

* **data** : full merged and filtered dataset with human readable variable names and activity labels
    - The data are only including `mean` and `std` measures
* **data_mean_df** : average means and standard deviations per subject and activity of data captured by the accelerometer and gyroscope 

`data_mean_df` is written to `tidy_dataset.txt` file.

### Variables in tidy_dataset.txt

**Activity** : an activity among WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**SubjectID** : Unique identifier of the subject (one of the 30 volonteers)

---

The other data follows a **naming convention** making them easy to identify:


* **BodyAcc** : Body Linear Acceleration
* **GravityAcc** : Gravity Acceleration
* **BodyGyro** : Body Angular Velocity
* **f** : prefix for Fast Fourier Transform applied to the signal
* **mean** : mean value
* **std** : standard deviation
* **Jerk** : Jerk signal
* **Mag** : magnitude of the three-dimensional signals caluated using euclidian norm

---

**Full Variable list**:

    tBodyAcc_mean_X
    tBodyAcc_mean_Y
    tBodyAcc_mean_Z
    tBodyAcc_std_X
    tBodyAcc_std_Y
    tBodyAcc_std_Z
    tGravityAcc_mean_X
    tGravityAcc_mean_Y
    tGravityAcc_mean_Z
    tGravityAcc_std_X
    tGravityAcc_std_Y
    tGravityAcc_std_Z
    tBodyAccJerk_mean_X
    tBodyAccJerk_mean_Y
    tBodyAccJerk_mean_Z
    tBodyAccJerk_std_X
    tBodyAccJerk_std_Y
    tBodyAccJerk_std_Z
    tBodyGyro_mean_X
    tBodyGyro_mean_Y
    tBodyGyro_mean_Z
    tBodyGyro_std_X
    tBodyGyro_std_Y
    tBodyGyro_std_Z
    tBodyGyroJerk_mean_X
    tBodyGyroJerk_mean_Y
    tBodyGyroJerk_mean_Z
    tBodyGyroJerk_std_X
    tBodyGyroJerk_std_Y
    tBodyGyroJerk_std_Z
    tBodyAccMag_mean
    tBodyAccMag_std
    tGravityAccMag_mean
    tGravityAccMag_std
    tBodyAccJerkMag_mean
    tBodyAccJerkMag_std
    tBodyGyroMag_mean
    tBodyGyroMag_std
    tBodyGyroJerkMag_mean
    tBodyGyroJerkMag_std
    fBodyAcc_mean_X
    fBodyAcc_mean_Y
    fBodyAcc_mean_Z
    fBodyAcc_std_X
    fBodyAcc_std_Y
    fBodyAcc_std_Z
    fBodyAccJerk_mean_X
    fBodyAccJerk_mean_Y
    fBodyAccJerk_mean_Z
    fBodyAccJerk_std_X
    fBodyAccJerk_std_Y
    fBodyAccJerk_std_Z
    fBodyGyro_mean_X
    fBodyGyro_mean_Y
    fBodyGyro_mean_Z
    fBodyGyro_std_X
    fBodyGyro_std_Y
    fBodyGyro_std_Z
    fBodyAccMag_mean
    fBodyAccMag_std
    fBodyBodyAccJerkMag_mean
    fBodyBodyAccJerkMag_std
    fBodyBodyGyroMag_mean
    fBodyBodyGyroMag_std
    fBodyBodyGyroJerkMag_mean
    fBodyBodyGyroJerkMag_std
