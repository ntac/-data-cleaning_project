Information on the amalysis file 

The purpose of this project is to create a tidy dataset from the data provided, 
the input data is found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The file finaldata.txt is the agregated data set containing:
The first three colums contain:
1- The source that identifies the row as a training data row(train) or test data row(test)
2- The Id that identifies the individual subject of the experiment
3- The activity lable, meaning the activity that was measured 

The remainning 79 other columns contain the average of the mean measurement of the identified parameter, for each individual per activity 
the values where calculated  from the means values of the following tri-axis vectors
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


The 82 columns of the data in finaldata.txt are shown in the file columns.txt this file is created by the run_analysis.R code



