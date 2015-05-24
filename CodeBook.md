Getting and Cleaning Data
=========================  

CodeBook
--------

This dataset contains a summary of part of the "Human Activity Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository.  

More information on the original dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the dataset itself can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  

The original dataset contains a set of 561 variables, generated from high frequency data from a cellular phone's accelerometer and gyroscope. It was collected from 30 subjects as they performed 6 different activities. The original dataset was divided into 2 subsets, a training subset and a test subset,  

This dataset contains the average of each variable for each activity and each subject, of a subset of the original datasets, comprising the mean and standard deviation of the original variables.

This data set contains 180 rows, one row per each subject and activity (30*6=180). Each row contains the following columns: 

 - **activity** - Activity, which is one of: 
 - **subject** - The subject identifier (a number from 1 to 30)
 
 The following columns contain the average of the original measurements of the same name, for the subject and activity in the first two columns. Its units are standard gravity "g" units, for units with acceleration (mean and std) and radians/second measures derived from the gyroscope (mean and std).
 
 - **tBodyAcc-mean()-X**
 - **tBodyAcc-mean()-Y**
 - **tBodyAcc-mean()-Z** 
 - **tBodyAcc-std()-X** 
 - **tBodyAcc-std()-Y** 
 - **tBodyAcc-std()-Z** 
 - **tGravityAcc-mean()-X** 
 - **tGravityAcc-mean()-Y** 
 - **tGravityAcc-mean()-Z** 
 - **tGravityAcc-std()-X**
 - **tGravityAcc-std()-Y**
 - **tGravityAcc-std()-Z**
 - **tBodyAccJerk-mean()-X**
 - **tBodyAccJerk-mean()-Y**
 - **tBodyAccJerk-mean()-Z**
 - **tBodyAccJerk-std()-X**
 - **tBodyAccJerk-std()-Y**
 - **tBodyAccJerk-std()-Z**
 - **tBodyGyro-mean()-X**
 - **tBodyGyro-mean()-Y**
 - **tBodyGyro-mean()-Z**
 - **tBodyGyro-std()-X**
 - **tBodyGyro-std()-Y**
 - **tBodyGyro-std()-Z**
 - **tBodyGyroJerk-mean()-X**
 - **tBodyGyroJerk-mean()-Y**
 - **tBodyGyroJerk-mean()-Z**
 - **tBodyGyroJerk-std()-X**
 - **tBodyGyroJerk-std()-Y**
 - **tBodyGyroJerk-std()-Z**
 - **tBodyAccMag-mean()**
 - **tBodyAccMag-std()**
 - **tGravityAccMag-mean()**
 - **tGravityAccMag-std()**
 - **tBodyAccJerkMag-mean()**
 - **tBodyAccJerkMag-std()**
 - **tBodyGyroMag-mean()**
 - **tBodyGyroMag-std()**
 - **tBodyGyroJerkMag-mean()**
 - **tBodyGyroJerkMag-std()**
 - **fBodyAcc-mean()-X**
 - **fBodyAcc-mean()-Y**
 - **fBodyAcc-mean()-Z**
 - **fBodyAcc-std()-X**
 - **fBodyAcc-std()-Y**
 - **fBodyAcc-std()-Z**
 - **fBodyAccJerk-mean()-X**
 - **fBodyAccJerk-mean()-Y**
 - **fBodyAccJerk-mean()-Z**
 - **fBodyAccJerk-std()-X**
 - **fBodyAccJerk-std()-Y**
 - **fBodyAccJerk-std()-Z**
 - **fBodyGyro-mean()-X**
 - **fBodyGyro-mean()-Y**
 - **fBodyGyro-mean()-Z**
 - **fBodyGyro-std()-X**
 - **fBodyGyro-std()-Y**
 - **fBodyGyro-std()-Z**
 - **fBodyAccMag-mean()**
 - **fBodyAccMag-std()**
 - **fBodyBodyAccJerkMag-mean()**
 - **fBodyBodyAccJerkMag-std()**
 - **fBodyBodyGyroMag-mean()**
 - **fBodyBodyGyroMag-std()**
 - **fBodyBodyGyroJerkMag-mean()**
 - **fBodyBodyGyroJerkMag-std()**
 
This data set was built as follows:  

 1. All files pertaining to the original dataset's training and test sub sets were loaded into memory.
 2. The activity identifiers and the subject identifiers where added to each dataset, since they were original kept in separate files.
 3. THe the test and train datasets were merged into a single dataset
 4. The first column was named *activity*, the second was named *subject*, and the remaining columns were named according to the features.txt file in the original dataset.
 5. The activity, subject and columns pertaining to the mean and standard deviation of each feature were extracted from this dataset.
 6. The activity identifiers in the activity column were replaced by their descriptive names as found in the activity_labels.txt file in the original dataset.
 7. The new dataset was built as the average of each feature, for each subject and activity.  
 
Please refer to the *run_analysis.R* file for more information.
