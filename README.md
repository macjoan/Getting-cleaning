# Getting and Cleaning Data Final Project.
This repository is form the final project of the course Getting and cleaning Data by Coursera. 
Please consider the following suggestions.

  - Download the zip file.
  - Extract the zip file on the work directory for R
  - Please don’t change any name of the folders or files
  - Please download the run_analysis.R file into R work directory.
  - Execute the run_analysis.R With R.
### Explaining the code
The script first read the files to generate a DataFrame from X train, y train, x Test, y Test, Subject from Train and Subject from Test. The script read too the activiti labels.

The code select only the columns in X Data that have the text mean() and std() to ensure that the mean and standar deviation have been contemplated.

The script makes a merge of train and test data usen a rbind function and then it makes a union of X total data selected previously, activity labels and subject.  With this information is generated a Total Datya Set.

The previous data set is user to generate a tidy Data Set sith the average for each activity and each subject. The new Tidy Data Set is written in a file called TidyMean.csv.
