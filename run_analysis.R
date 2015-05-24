## run_analysis.R

setwd("E:/dev/coursera/ds/03_GettingAndCleaningData/20150524_project_01/repo")

## -----------------------
## Download and unzip data
## -----------------------

outDir <- "output"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileNameZip <- "getdataprojectfilesUciHarDataset.zip"

if (!file.exists(outDir)) {
    dir.create(outDir)
}

if (!file.exists(file.path(outDir,fileNameZip))) {
    download.file(url = fileUrl, destfile = file.path(outDir,fileNameZip))
    unzip(file.path(outDir,fileNameZip), exdir = outDir, overwrite = TRUE)
}

## ---------
## Load data
## ---------

# Rougth estimate on size requirements: 

activityLabels <- read.table(file.path(outDir,"UCI HAR Dataset","activity_labels.txt"), header = FALSE, sep = " ", stringsAsFactors = FALSE)
features <- read.table(file.path(outDir,"UCI HAR Dataset","features.txt"), header = FALSE, sep = " ", stringsAsFactors = FALSE)

testActivities <- read.table(file.path(outDir,"UCI HAR Dataset", "test", "y_test.txt"), header = FALSE, sep = " ", stringsAsFactors = FALSE)
testSubjects <- read.table(file.path(outDir,"UCI HAR Dataset", "test", "subject_test.txt"), header = FALSE, sep = " ", stringsAsFactors = FALSE)
testVectors <- read.table(file.path(outDir,"UCI HAR Dataset", "test", "X_test.txt")
                          , colClasses = rep("numeric",561)
                          , header = FALSE
                          , stringsAsFactors = FALSE
                          , strip.white=TRUE)


trainActivities <- read.table(file.path(outDir,"UCI HAR Dataset", "train", "y_train.txt"), header = FALSE, sep = " ", stringsAsFactors = FALSE)
trainSubjects <- read.table(file.path(outDir,"UCI HAR Dataset", "train", "subject_train.txt"), header = FALSE, sep = " ", stringsAsFactors = FALSE)
trainVectors <- read.table(file.path(outDir,"UCI HAR Dataset", "train", "X_train.txt")
                          , colClasses = rep("numeric",561)
                          , header = FALSE
                          , stringsAsFactors = FALSE
                          , strip.white=TRUE)

## -----------------------------
## Merge Test and train datasets
## -----------------------------

# adding columns for the test subject id and the activity names

mergedDataset <-
    rbind(
        cbind(testSubjects, testActivities, testVectors)
        , cbind(trainSubjects, trainActivities, trainVectors)
    )

## ----------------
## Name the columns 
## ----------------

# based on the data loaded from the features file

colnames(mergedDataset)[1] <- "subject"
colnames(mergedDataset)[2] <- "activity"
colnames(mergedDataset)[3:(nrow(features)+2)] <- features[,2]

## ------------------------------------
## Extract columns for the mean and std
## ------------------------------------

library("dplyr")

## Select only the columns with mean() and std() on its name

# need to add 2 to the indexes, because I've added 2 colimns to the data frame (subject and activity)
meanStdDataset <- mergedDataset[,c(1:2,sort(union(grep("std\\(\\)",features[,2]) , grep("mean\\(\\)",features[,2]))) + 2)]

## -------------------------
## Rename the activity names
## -------------------------

# I could have user merge here, but this will create an extra column ... will replace the activity names deirectly in the meanStdDataset instead
# unused_code: meanStdActDataset <- merge(meanStdDataset,activityLabels, by.x="activity",by.y="V1",all = TRUE)

# for each activity lablel, replace the activity id in the dataset with the activity name
for (i in activityLabels$V1) {
    meanStdDataset[meanStdDataset$activity==i,]$activity <- activityLabels[i,2]
}

## -----------------------------------------------------------
## average of each variable for each activity and each subject
## -----------------------------------------------------------

avgActSubject <- meanStdDataset %>% group_by(activity, subject) %>% summarise_each("mean")

write.table(avgActSubject, file.path(outDir,"avgDataset.txt"), row.names = FALSE)
