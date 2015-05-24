Getting and Cleaning Data
=========================  


This repository contains all scripts used to generate a tidy dataset submitted for peer evaluation, as part of Coursera's "Getting and Cleaning Data" course project.  

The final dataset was built from the "Human Activity Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository. More information on the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the dataset itself can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Besides this README.md file, there are 2 files of interest:

- **CodeBook.md** - This file describes the final dataset, its variables and its data. It also contains information about the original dataset, and all transformations applied to it, that yielded the final dataset.
- **run_analysis.R** - This file contains the script, that creates the final dataset. In order to execute it, set your working directory in R (setwd) to the directory where this script resides and run it. It creates an output directory, downloads the UCI dataset, into the output dir, unzips it, loads all relevant files into memory, performs the transformations described in CodeBook.md, and writes the final dataset to the output directory (output/ avgDataset.txt).
