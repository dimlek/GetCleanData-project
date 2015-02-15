# GetCleanData-project
This repo has been created as part of the course project of the Coursera module "Getting and Cleaning Data".

## Purpose
- Assumes dataset has been downloaded and extracted in "user working directory"/UCI HAR Dataset
- Merges into 3 basic files (X_all, y_all, and subject_all.txt).
- Extracts only the mean and standard deviation variables.
- Uses descriptive activity names to name the activities in the data set and labels the data set with descriptive variable names.
- Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

## Instructions
- Source the script run_analysis.R
- It will create a new function (create_tidy_data_set) in your global environment .
- This function has one optional argument, your working directory (char). It defaults to the working directory you have set up in R ("getwd").
- Run the function. 

## Output
- The tidy data set, a data frame with 81 variables (columns) and 180 records (or 181 rows, including the column headers).
- The variables are "Activity", "Subject", as well as the 79 variable names from the original data set that contained mean or std in their name.
- It will also create a text file (tidy.txt) in your working directory (or in the directory you have specified as function argument) with the dataset.
- Please refer to CodeBook.md for more information on the variables and transformations done to clean up the data.

## Optional
- If you wish for the code to also download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , unzip the contents and record the time of the download, you need to uncomment lines 13-15.
