# GetCleanData-project
This repo has been created as part of the course project of the Coursera module "Getting and Cleaning Data".

## Purpose

- To obtain dataset files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- To merge into 3 basic files (X_all, y_all, and subject_all.txt).
- To extract only the mean and standard deviation variables.
- To use descriptive activity names to name the activities in the data set and label the data set with descriptive variable names.
- To create a second, independent tidy dataset with the average of each variable for each activity and each subject.

## Instructions
- Source the script run_analysis.R
- It will create a new function (create_tidy_data_set) in your global environment .
- This function has one optional argument, your working directory (char). It defaults to the working directory you have set up in R ("getwd").
- Run the function (Please be patient as this function does everything, *downloading*, processing and output. 

## Output
- The tidy data set, a data frame with 81 variables (columns) and 180 records (or 181 rows, including the column headers).
- The variables are "Activity", "Subject", as well as the 79 variable names from the original data set that contained mean or std in their name.
- It will also create a text file in your working directory (or in the directory you have specified as function argument) with the dataset.
- Please refer to CodeBook.md for more information on the variables and transformations done to clean up the data.
