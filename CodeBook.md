# CodeBook.md

June 20, 2015

This code book document describes the variables, the data, and transformations 
performed in the script <B>"run_analysis.R"</B> to clean up the data obtained from:

<B>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</B>

The script uses sthe following libraries:

* <B>library(dplyr)</B>
* <B>library(tidyr)</B>
* <B>library(plyr)</B>

#### The script contains the following variables:

|Variable            |Description                |
|:-------------------|:--------------------------|
|strDBPath           |Path where the database is contained |
|strTestSetPath      |Location of the test set             |
|strTrainSetPath     |Location of the training set         |
|vecColNames         |Vector column names of the test and training sets |
|dfActivityLabels    |Data frame containing activity names linked to the test/training set labels |
|dfSetTestX          |Data frame containing the test set |
|dfSetTestY          |Data frame containing the test set labels |
|dfSubjectTest       |Data frame containing Subjects IDs who performed the activities in the test set|
|dfSetTrainX         |Data frame containing the training set |
|dfSetTrainY         |Data frame containing the training set labels |
|dfSubjectTrain      |Data frame containing Subjects IDs who performed the activities in the training set|
|dfSetTest           |Data frame containing Test Set after adding the appropriateactivity and subject data |
|dfSetTrain          |Data frame containing Training Set after adding the appropriate activity and subject data |
|dfSetMerged         |Data frame containing the merged Test and Training sets |
|dfSetMeanAndSTD     |Data frame containing only the columns related to mean and stanard deviation, in addition to the Subject and Activity Label. Later to be merged (joined) with the activity labels|
|vecFrontCols        |Non mean/std column names |
|vecCols             |New column names containing the added Activity name |
|vecNewColNames      |New column names for the tidy data set |
|dfTidyData          |Data frame containing tidied-up data where the average of each variable for each activity and each subject |

#### The script contains the following functions:

|Function/Parameters |Description |Parameters|
|-------------------:|:--------------------------|:---|
|      funChangeName |Changes the name of a column name |vecName, vecExclude, strPrefix|
|           *vecName*|A column name to change |
|        *vecExclude*|A list of names to exclude/ignore |
|         *strPrefix*|Text to add to the beginning of the name |

The test set is merged with the test activity labels and the test subject IDs.
The training set is merged with the training activity labels and the training subject IDs.





-- Nick Nobile
2015-06-19
