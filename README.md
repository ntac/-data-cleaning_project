A- Folder content
 - The Codebook that explain the content of the tidy data file finaldata.txt
 - The readme.md file that explains the repository content, and it's usage
 - The run_analysis.R code that performs the analysis requested for this project
 - The columns.txt that is actually part of the codeBook.md file
 - the finaldata.txt that is the tidy data created by the script run_analysis.README
 
B- Process followed to create the final tidy data file

 B. 1- The data was downloaded from the web location and unzipped to the project folder
   data web location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   
 B. 2- The script then reads the training and the test datasets and merge them creating a single dataset. 
 B. 3- A source column is added to the dataset to identify if it is a training observation or a test observation
 B. 4- Only the means and standard deviations of the measurements are kept for the further manipulations.
 B. 5- The activity column is then changed from the numerical code to its corresponding descriptive name
 B. 6- The column names are also changed to reflect what they are from the automatic lable that is provided when using read.table
 B. 7- As each activity measured were taken several time for each individual, the average for the values of each activity per individual is then calculated
       creating here a new dataset, the final tidy data.
	   
C- Instrauctions to run the code run_analysis.R

1- Introductory Note: while compressing the downloaded data set, you will get to an intermediate folder named , 
"UCI HAR Dataset" that contains de sub-folder of the training set and the subfolder of the test set,
so as the activity_labels.txt, features.txt, features_info.txt, README.txt

2- Create your Project repository let's say : getdata_projectfiles_FUCI_HAR_Dataset
3- Place the repository "UCI HAR Dataset" with the whole contents in the project repository you created earlier
4- Place the code run_analysis.R in the project repository
5- In the code run_analysis.R, modify the line: path<-"C:/Leprojet/"
   to replace the given path by the full path to your project repository 
6- run the script
   