# GettingAndCleaningDataProject
This script is for the course project for Getting and Cleaning Data. To successfully run this script the dataset must have already been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and then unzipped.

## Before running the script
Before running the script make sure your working directory is set to the directory with the downloaded data — for example: setwd("UCI HAR Dataset")


## What the script does

Below you can find a step-by-step description of what this script does

### STEP 1: Merges the training and the test sets to create one data set.

First the test and train data are read, and then combined. Then the test and train subjects are read and combined. Finally the subjects are added to the rest of the data set.


### STEP 2: Extracts only the measurements on the mean and standard deviation...

First the feature names are read. Then only names that contain the phrase "mean()" or "std()"  and are selected and combined into one data set.


### STEP 3:Uses descriptive activity names to name the activities in the data set
  
First test and train activities are read. The activity numbers are then relabled using descriptive names


### STEP 4:Appropriately labels the data set with descriptive variable names.
The parenthesis and dashes are replaced in the label names to make them more readable. Capitalization is also fixed to make the names more readable. Lastly, the letters "t" and "f" that start the variable names are replaced with Time and Frequency respectively to make the names more descriptive.

The codebook file "feature_info.txt" is then modified by appending a table of the old and new variable names that end up in the final data set.

### STEP 5:Creates a second tidy data set with average of each variable for each 

The average of each variable for each subject and activity is calculated and written to a file called "tidy_data.txt".
