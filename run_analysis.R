# Final Project Submission
# for coursera "Getting and Cleaning Data" course

strDBPath = "./UCI HAR Dataset/"
strTestSetPath = "./UCI HAR Dataset/test/"
strTrainSetPath = "./UCI HAR Dataset/train/"

  # Load the Test and Training Sets

vecColNames <- read.table(file.path(strDBPath, "features.txt"), colClasses = c("character"))     # Get the column names
vecColNames <- t(vecColNames[2])

dfActivityLabels <- read.table(file.path(strDBPath, "activity_labels.txt"), col.names = c("Label", "Activity"))

dfSetTestX <- read.table(file.path(strTestSetPath, "X_test.txt"), col.names = vecColNames, check.names = FALSE)
dfSetTestY <- read.table(file.path(strTestSetPath, "y_test.txt"), col.names = c("Label"))
dfSubjectTest <- read.table(file.path(strTestSetPath,"subject_test.txt"), col.names = c("Subject"))     # Test subject info

dfSetTrainX <- read.table(file.path(strTrainSetPath, "X_train.txt"), col.names = vecColNames, check.names = FALSE)
dfSetTrainY <- read.table(file.path(strTrainSetPath, "y_train.txt"), col.names = c("Label"))
dfSubjectTrain <- read.table(file.path(strTrainSetPath,"subject_train.txt"), col.names = c("Subject"))  # Training subject info

dfSetTest<-cbind(dfSetTestY, cbind(dfSubjectTest, dfSetTestX) )
dfSetTrain<-cbind(dfSetTrainY, cbind(dfSubjectTrain, dfSetTrainX) )


  # Part 1: Merge the training and the test sets to create one data set.

dfSetMerged <- rbind(dfSetTest, dfSetTrain)
  
  # Part 2: Extract only the measurements on the mean and standard deviation for each measurement
  #         Columns are used that contain the regular expression ".*-mean\\(.*" or ".*-std\\(.*"

vecColNames <- c("Label", "Subject", vecColNames)  # Update the column names to include the Label and Subject

dfSetMeanAndSTD <- dfSetMerged[grepl(".*-mean\\(\\).*", vecColNames)
                                 | grepl(".*-std\\(\\).*", vecColNames)
                                 | grepl("Label|Subject", vecColNames)]

  # Part 3: Use descriptive activity names to name the activities in the data set

dfSetMeanAndSTD <- join(dfSetMeanAndSTD, dfActivityLabels, by = "Label", match = "first")

  # Part 4: Appropriately label the data set with descriptive variable names. 

vecFrontCols <- c("Label", "Activity", "Subject")          # Reorder the columns
vecCols <- names(dfSetMeanAndSTD[!(names(dfSetMeanAndSTD) %in% vecFrontCols)])
vecCols <- c(vecFrontCols, vecCols)
dfSetMeanAndSTD <- dfSetMeanAndSTD[vecCols]

  # Part 5: From the data set in step 4, create a second, independent tidy data set with 
  #         the average of each variable for each activity and each subject.

  # Define a function to change the name of a column name
funChangeName <- function(vecName, vecExclude, strPrefix) {
  if (!(vecName %in% vecExclude)) {
    paste(strPrefix, vecName, sep = "")
  }
  else {
    vecName
  }
}


dfTidyData <- ddply(dfSetMeanAndSTD, c("Subject","Activity"), numcolwise(mean))  # get the average grouped by subject and activity
vecNewColNames <- names(dfTidyData)
vecNewColNames <- sapply(vecNewColNames, funChangeName, vecFrontCols, "mean.") # Change column names to reflect the mean
names(dfTidyData) <- vecNewColNames

  # Sort by Subject and then by Activity Label number
dfTidyData <- dfTidyData[order(dfTidyData$Subject, dfTidyData$Label),]
row.names(dfTidyData) <- NULL   # Reorder the row names

  # Save the tidy data set as a txt file created with write.table() using row.name=FALSE
write.table(dfTidyData, file = "FinalTidyData.txt", row.name = FALSE)  


