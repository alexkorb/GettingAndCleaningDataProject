# GettingAndCleaningDataProject
This script is for the course project for Getting and Cleaning Data. To successfully run this script the dataset must have already been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and then unzipped. This script contains a single function: run_analysis().

##Running the script
First source the script. Then either set your working directory to the data set (e.g. setwd("UCI HAR Dataset") ) and then call the function, or simply call the function with the proper directory (e.g. run_analysis("UCI HAR Dataset")


## What the script does
To run the script
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

### STEP 5:Creates a second tidy data set with average of each variable for each activity and each subject.

The average of each variable for each subject and activity is calculated and written to a file called "tidy_data.csv".
