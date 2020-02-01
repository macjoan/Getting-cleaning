library(dplyr)

#Get all data from the files.
#Remember that the zip file has to be extracted in the Work Directory for R
#Please don't change the names from the folders or files.

#Train Data
trainx_DF <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy_DF <- read.table("./UCI HAR Dataset/train/Y_train.txt")
trains_DF <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Test Data.
testx_DF <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy_DF <- read.table("./UCI HAR Dataset/test/Y_test.txt")
tests_DF <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#REading the description variables.
descvar <- read.table("./UCI HAR Dataset/features.txt")

#Filter only the variables requested in this project. Mean and stanfard deviation
filter_var <- descvar[grep("mean\\(\\)|std\\(\\)", descvar[,2]),]

trainx_DF <- trainx_DF[,filter_var[,1]]
testx_DF <- testx_DF[,filter_var[,1]]

#Merge  train and  test data
Mergex_DF <- rbind(trainx_DF, testx_DF)
Mergey_DF <- rbind(trainy_DF, testy_DF)
Merges_DF <- rbind(trains_DF, tests_DF)

#get activity labels

act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Namming the activity in the data set.

colnames(Mergey_DF) <- "activity"
Mergey_DF$activitylabel <- factor(Mergey_DF$activity, labels = as.character(act_labels[,2]))
xvarnames <- descvar[filter_var[,1],2]
colnames(Mergex_DF) <- xvarnames
colnames(Merges_DF)<- "subject"

# Making a new Tidy Data Set.
activitylabels <- Mergey_DF[,2]
Tidy_DF <- cbind(Mergex_DF, activitylabels, Merges_DF)


Tidy_Table <- Tidy_DF %>% group_by(activitylabels, subject) %>% summarize_each(funs(mean))

# Creatin a file with tidy data.
write.table(Tidy_DF, file ="./UCI HAR Dataset/TidyTotal.csv",
            row.names = FALSE, col.names = TRUE, sep = ",")

write.table(Tidy_Table, file = "./UCI HAR Dataset/TidyMean.csv",
            row.names = FALSE, col.names = TRUE, sep = ",")


