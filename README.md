# CleaningDataProject
coursera Getting and Cleaning Data final Project

This repo contains the script "run_analysis.R" which merges the 
training and test sets from:

  <B>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</B>
  
It then keeps only those observations related to mean and standard variation.
Adds the Activity description by joining it with the  "activity_labels.txt" 
dataset based on the Label key.

Finally, a tidy data set is created by calculating  the average of each variable,
for each activity and each subject, is calculated. The names of these calculated
columns are prefixed with the string "mean." by using the supplied function
"funChangeName".  The tidy dataset is saved to a file names "FinalTidyData.txt"
in the working directory.

-- Nick Nobile
