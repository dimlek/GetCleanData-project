## Original data set
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data is divided into two folders: TRAIN and TEST. The former contains 70% of the dataset and the latter the remaining 30%.

Each folder contains the following:
- INERTIAL SIGNALS FOLDER: RAW DATA for X, Y, Z Total Acceleration, X, Y, Z Gravitational Acceleration, X, Y, Z, angular velocity. Each row is a 128 element vector (window). This is not used in our analysis.
- X_TRAIN.txt (or X_TEST.txt): 561 processed variables (over a window of 128 readings of the raw data) of 7352+2947=10299 observations.
- Y_TRAIN.txt (or y_TEST.txt): Activity variable (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING), 7352+2947=10299 observations.
- SUBJECT_TRAIN/TEST.txt: Subject variable (1 to 30), 7352+2947=10299 observations.

## Merged data set
Merges the TRAIN and TEST datasets into X_all.txt (591 var, 10299 obs), y_all.txt (1 var, 10299 obs), subject_all.txt (1 var, 10299 obs)

## Processing
- Out of the 561 variables, extracts only those containing mean ("mean") or standard deviation ("std") in their label name, eventually yiealding 79 variables.
- Converts the numeric "activity" variable (1, 2, ...) , to descriptive (WALKING, ..., SITTING, ...).
- Adds "activity" and "subject" data from respective files to create one dataset with 79+2=81 variables.
- Orders the dataset, first by activity then by subject.
- Collapses the dataset, to have 180 rows, one for each subject-activity combination (6 times 30), and populates the rows with the average of each of the 79 variables for that particular combination.

## Output
- Stores the new dataset into a data frame, as well into a text file (tidy.txt), and ouputs the dataframe.


