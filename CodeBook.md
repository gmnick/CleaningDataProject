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

#### The script manipulates the data in the following way:

* The test set is merged with the test activity labels and the test subject IDs.
* The training set is merged with the training activity labels and the training subject IDs.
* Both the resulting test and training sets are merged together.
* The column names are attached to the new data frame.
* Only the columns related to the mean and standard devistion are kept. These are the features that contain the strings "<B>-mean()</B>" or "<B>-std()</B>" in the column name.
* The columns are reordered in order to put the columns "Label", "Activity", "Subject" at the front.
* An independent tidy data set with the average of each variable for each activity and each subject is generated.
* The mean and std columns in the tidy dataset are renamed to have them prefixed with the string "<B>mean.</B>" .
* The tidy data frame is saved to a file "<B>FinalTidyData.txt</B>" in the current working directory.

-- Nick Nobile
2015-06-19
